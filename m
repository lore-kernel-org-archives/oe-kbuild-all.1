Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5069233B6F9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 17:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779385634; cv=none; b=Y8hv4lOGphWhTT+T+5N0coGF24SimONMKYU0DiXHk2f0a4P37OUJi0Bs9HqK7DLGcNLKDwXQ+Pzn2zTMA+L85VcNzAHZ6lXjV2CvAThLSCNkdlzlG3MJoWfhXRFZ5F0RTmqWSlm4ASZDRxw1YoyEQLSJITuZ192u4wI8DrelLEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779385634; c=relaxed/simple;
	bh=OiF3KeOffs/CGSvKDvCDt5rJ9S1cu5Y7jb5YQU/6wRU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q3nzsCq7c8fKHHyv3kYcbZ03/HBjT74yg9ZqOY914K7xPs5hplY7PnvHI5tiaFcwLGFaZdwyz0rDomGJm+HKrKVEx/IeDFeOK8p03L1zv+1WsSdm2C6lqS0Rc2bRPW85za6IuOea3qqUzr4sO/X/TTiAtkE6uG2xkxYc4jZx9kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HT0yVlGs; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HT0yVlGs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779385632; x=1810921632;
  h=date:from:to:cc:subject:message-id;
  bh=OiF3KeOffs/CGSvKDvCDt5rJ9S1cu5Y7jb5YQU/6wRU=;
  b=HT0yVlGslcHmyf3ozIy4xAQ/0vfRHwgHmKtQAw4TWdQ6jykNYhWQY1PK
   BvTixwBmq57jM4iIXz+AxTgaglImFm65ybHN3bzl8V1fQqnSCBbMFid+w
   L/P1j0hagElBFiqhDbbIQ2KahNdilwlFSuvM6Led5OVvpmaktipZqrUxZ
   ZAf6jHAOQ/w1Zz4I2ek9iGhqF1Sjj+LVMCzhwdv1Pc4wpOGo7Gmfj/HdS
   w9E48HENJ5y9aEhQ9UgtxJjDmy8T1ymzAaVjkaYtiN6A5sIyLae0J53Q9
   AufqX+LBNT1bQeYc6/yR3r5QfJMYzipVR3GodMmxrH6bQ0F6joL1NmVfN
   w==;
X-CSE-ConnectionGUID: IcJEP/5MRwmB6NTa/ihZlA==
X-CSE-MsgGUID: 6yLp73B/RfOsnAEZYiKJ0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="97883601"
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; 
   d="scan'208";a="97883601"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 10:47:11 -0700
X-CSE-ConnectionGUID: zipJZdRwQaiyA9ANrDr2iA==
X-CSE-MsgGUID: W58YjQUMTW6Q/jak/MhGPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; 
   d="scan'208";a="240621306"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 May 2026 10:47:09 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ7UB-000000000vD-18xf;
	Thu, 21 May 2026 17:47:07 +0000
Date: Fri, 22 May 2026 01:46:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/ring-buffer-bootid 4/4]
 kernel/trace/trace_selftest.c:1245:1: warning:
 'trace_selftest_startup_preemptoff' defined but not used
Message-ID: <202605220156.JbrJrPyg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Masami,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/ring-buffer-bootid
head:   11c7f327c260ca2dd626cb8e242b1aed41959caf
commit: 11c7f327c260ca2dd626cb8e242b1aed41959caf [4/4] tracing: Record and show boot ID in last_boot_info
config: parisc-randconfig-001-20260521 (https://download.01.org/0day-ci/archive/20260522/202605220156.JbrJrPyg-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605220156.JbrJrPyg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605220156.JbrJrPyg-lkp@intel.com/

All warnings (new ones prefixed by >>):

    9452 | static void ftrace_dump_by_param(void)
         |             ^~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:9522:19: error: non-static declaration of 'ftrace_dump' follows static declaration
    9522 | EXPORT_SYMBOL_GPL(ftrace_dump);
         |                   ^~~~~~~~~~~
   include/linux/export.h:76:28: note: in definition of macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:90:41: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   kernel/trace/trace.c:9522:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    9522 | EXPORT_SYMBOL_GPL(ftrace_dump);
         | ^~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:9493:6: note: previous definition of 'ftrace_dump' with type 'void(enum ftrace_dump_mode)'
    9493 | void ftrace_dump(enum ftrace_dump_mode oops_dump_mode)
         |      ^~~~~~~~~~~
   kernel/trace/trace.c:9585:19: error: invalid storage class for function 'backup_instance_area'
    9585 | __init static int backup_instance_area(const char *backup,
         |                   ^~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:9621:20: error: invalid storage class for function 'enable_instances'
    9621 | __init static void enable_instances(void)
         |                    ^~~~~~~~~~~~~~~~
   kernel/trace/trace.c:9798:19: error: invalid storage class for function 'tracer_alloc_buffers'
    9798 | __init static int tracer_alloc_buffers(void)
         |                   ^~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:9973:20: error: invalid storage class for function 'clear_boot_tracer'
    9973 | __init static void clear_boot_tracer(void)
         |                    ^~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:9991:20: error: invalid storage class for function 'tracing_set_default_clock'
    9991 | __init static void tracing_set_default_clock(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:10012:19: error: invalid storage class for function 'late_trace_init'
   10012 | __init static int late_trace_init(void)
         |                   ^~~~~~~~~~~~~~~
   kernel/trace/trace.c:10027:20: error: initializer element is not constant
   10027 | late_initcall_sync(late_trace_init);
         |                    ^~~~~~~~~~~~~~~
   include/linux/init.h:265:55: note: in definition of macro '____define_initcall'
     265 |                 __attribute__((__section__(__sec))) = fn;
         |                                                       ^~
   include/linux/init.h:275:9: note: in expansion of macro '__unique_initcall'
     275 |         __unique_initcall(fn, id, __sec, __initcall_id(fn))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/init.h:277:35: note: in expansion of macro '___define_initcall'
     277 | #define __define_initcall(fn, id) ___define_initcall(fn, id, .initcall##id)
         |                                   ^~~~~~~~~~~~~~~~~~
   include/linux/init.h:309:41: note: in expansion of macro '__define_initcall'
     309 | #define late_initcall_sync(fn)          __define_initcall(fn, 7s)
         |                                         ^~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:10027:1: note: in expansion of macro 'late_initcall_sync'
   10027 | late_initcall_sync(late_trace_init);
         | ^~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:10027:1: error: expected declaration or statement at end of input
   include/linux/delay.h:57:22: warning: unused variable 'lpj_fine' [-Wunused-variable]
      57 | extern unsigned long lpj_fine;
         |                      ^~~~~~~~
   include/linux/delay.h:16:22: warning: unused variable 'loops_per_jiffy' [-Wunused-variable]
      16 | extern unsigned long loops_per_jiffy;
         |                      ^~~~~~~~~~~~~~~
   kernel/trace/trace.c:6764:30: warning: unused variable 'trace_min_max_fops' [-Wunused-variable]
    6764 | const struct file_operations trace_min_max_fops = {
         |                              ^~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c: At top level:
   kernel/trace/trace.c:1433:12: warning: 'add_tracer' used but never defined
    1433 | static int add_tracer(struct trace_array *tr, struct tracer *t);
         |            ^~~~~~~~~~
   kernel/trace/trace.c:9965:13: warning: 'trace_init' defined but not used [-Wunused-function]
    9965 | void __init trace_init(void)
         |             ^~~~~~~~~~
   kernel/trace/trace.c:9950:13: warning: 'early_trace_init' defined but not used [-Wunused-function]
    9950 | void __init early_trace_init(void)
         |             ^~~~~~~~~~~~~~~~
   kernel/trace/trace.c:9944:21: warning: 'trace_get_global_array' defined but not used [-Wunused-function]
    9944 | struct trace_array *trace_get_global_array(void)
         |                     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:9526:9: warning: 'trace_parse_run_command' defined but not used [-Wunused-function]
    9526 | ssize_t trace_parse_run_command(struct file *file, const char __user *buffer,
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:9360:6: warning: 'trace_init_global_iter' defined but not used [-Wunused-function]
    9360 | void trace_init_global_iter(struct trace_iterator *iter)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:9284:12: warning: 'trace_die_panic_handler' defined but not used [-Wunused-function]
    9284 | static int trace_die_panic_handler(struct notifier_block *self,
         |            ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:9098:6: warning: 'module_exists' defined but not used [-Wunused-function]
    9098 | bool module_exists(const char *module)
         |      ^~~~~~~~~~~~~
   kernel/trace/trace.c:8538:21: warning: 'trace_array_find_get' defined but not used [-Wunused-function]
    8538 | struct trace_array *trace_array_find_get(const char *instance)
         |                     ^~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_selftest.c:1538:1: warning: 'trace_selftest_startup_branch' defined but not used [-Wunused-function]
    1538 | trace_selftest_startup_branch(struct tracer *trace, struct trace_array *tr)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_selftest.c:1460:1: warning: 'trace_selftest_startup_wakeup' defined but not used [-Wunused-function]
    1460 | trace_selftest_startup_wakeup(struct tracer *trace, struct trace_array *tr)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_selftest.c:1408:1: warning: 'trace_selftest_startup_nop' defined but not used [-Wunused-function]
    1408 | trace_selftest_startup_nop(struct tracer *trace, struct trace_array *tr)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/trace/trace_selftest.c:1245:1: warning: 'trace_selftest_startup_preemptoff' defined but not used [-Wunused-function]
    1245 | trace_selftest_startup_preemptoff(struct tracer *trace, struct trace_array *tr)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_selftest.c:1062:1: warning: 'trace_selftest_startup_function_graph' defined but not used [-Wunused-function]
    1062 | trace_selftest_startup_function_graph(struct tracer *trace,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace_selftest.c:692:1: warning: 'trace_selftest_startup_function' defined but not used [-Wunused-function]
     692 | trace_selftest_startup_function(struct tracer *trace, struct trace_array *tr)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6891:6: warning: 'tracing_log_err' defined but not used [-Wunused-function]
    6891 | void tracing_log_err(struct trace_array *tr,
         |      ^~~~~~~~~~~~~~~
   kernel/trace/trace.c:6850:14: warning: 'err_pos' defined but not used [-Wunused-function]
    6850 | unsigned int err_pos(char *cmd, const char *str)
         |              ^~~~~~~
   kernel/trace/trace.c:6584:5: warning: 'tracing_event_time_stamp' defined but not used [-Wunused-function]
    6584 | u64 tracing_event_time_stamp(struct trace_buffer *buffer, struct ring_buffer_event *rbe)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6155:5: warning: 'trace_user_fault_put' defined but not used [-Wunused-function]
    6155 | int trace_user_fault_put(struct trace_user_buf_info *tinfo)
         |     ^~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6136:5: warning: 'trace_user_fault_get' defined but not used [-Wunused-function]
    6136 | int trace_user_fault_get(struct trace_user_buf_info *tinfo)
         |     ^~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:6112:5: warning: 'trace_user_fault_init' defined but not used [-Wunused-function]
    6112 | int trace_user_fault_init(struct trace_user_buf_info *tinfo, size_t size)
         |     ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/trace_selftest_startup_preemptoff +1245 kernel/trace/trace_selftest.c

60a11774b38fef Steven Rostedt           2008-05-12  1242  
60a11774b38fef Steven Rostedt           2008-05-12  1243  #ifdef CONFIG_PREEMPT_TRACER
60a11774b38fef Steven Rostedt           2008-05-12  1244  int
60a11774b38fef Steven Rostedt           2008-05-12 @1245  trace_selftest_startup_preemptoff(struct tracer *trace, struct trace_array *tr)
60a11774b38fef Steven Rostedt           2008-05-12  1246  {
6d9b3fa5e7f663 Steven Rostedt (Red Hat  2014-01-14  1247) 	unsigned long save_max = tr->max_latency;
60a11774b38fef Steven Rostedt           2008-05-12  1248  	unsigned long count;
60a11774b38fef Steven Rostedt           2008-05-12  1249  	int ret;
60a11774b38fef Steven Rostedt           2008-05-12  1250  
769c48eb2530c5 Steven Rostedt           2008-11-07  1251  	/*
f2cc020d7876de Ingo Molnar              2021-03-23  1252  	 * Now that the big kernel lock is no longer preemptible,
769c48eb2530c5 Steven Rostedt           2008-11-07  1253  	 * and this is called with the BKL held, it will always
769c48eb2530c5 Steven Rostedt           2008-11-07  1254  	 * fail. If preemption is already disabled, simply
769c48eb2530c5 Steven Rostedt           2008-11-07  1255  	 * pass the test. When the BKL is removed, or becomes
769c48eb2530c5 Steven Rostedt           2008-11-07  1256  	 * preemptible again, we will once again test this,
769c48eb2530c5 Steven Rostedt           2008-11-07  1257  	 * so keep it in.
769c48eb2530c5 Steven Rostedt           2008-11-07  1258  	 */
769c48eb2530c5 Steven Rostedt           2008-11-07  1259  	if (preempt_count()) {
769c48eb2530c5 Steven Rostedt           2008-11-07  1260  		printk(KERN_CONT "can not test ... force ");
769c48eb2530c5 Steven Rostedt           2008-11-07  1261  		return 0;
769c48eb2530c5 Steven Rostedt           2008-11-07  1262  	}
769c48eb2530c5 Steven Rostedt           2008-11-07  1263  
60a11774b38fef Steven Rostedt           2008-05-12  1264  	/* start the tracing */
b6f11df26fdc28 Arnaldo Carvalho de Melo 2009-02-05  1265  	ret = tracer_init(trace, tr);
1c80025a49855b Frederic Weisbecker      2008-11-16  1266  	if (ret) {
1c80025a49855b Frederic Weisbecker      2008-11-16  1267  		warn_failed_init_tracer(trace, ret);
1c80025a49855b Frederic Weisbecker      2008-11-16  1268  		return ret;
1c80025a49855b Frederic Weisbecker      2008-11-16  1269  	}
1c80025a49855b Frederic Weisbecker      2008-11-16  1270  
60a11774b38fef Steven Rostedt           2008-05-12  1271  	/* reset the max latency */
6d9b3fa5e7f663 Steven Rostedt (Red Hat  2014-01-14  1272) 	tr->max_latency = 0;
60a11774b38fef Steven Rostedt           2008-05-12  1273  	/* disable preemption for a bit */
60a11774b38fef Steven Rostedt           2008-05-12  1274  	preempt_disable();
60a11774b38fef Steven Rostedt           2008-05-12  1275  	udelay(100);
60a11774b38fef Steven Rostedt           2008-05-12  1276  	preempt_enable();
490362003457f8 Frederic Weisbecker      2009-03-17  1277  
490362003457f8 Frederic Weisbecker      2009-03-17  1278  	/*
490362003457f8 Frederic Weisbecker      2009-03-17  1279  	 * Stop the tracer to avoid a warning subsequent
490362003457f8 Frederic Weisbecker      2009-03-17  1280  	 * to buffer flipping failure because tracing_stop()
490362003457f8 Frederic Weisbecker      2009-03-17  1281  	 * disables the tr and max buffers, making flipping impossible
490362003457f8 Frederic Weisbecker      2009-03-17  1282  	 * in case of parallels max preempt off latencies.
490362003457f8 Frederic Weisbecker      2009-03-17  1283  	 */
490362003457f8 Frederic Weisbecker      2009-03-17  1284  	trace->stop(tr);
60a11774b38fef Steven Rostedt           2008-05-12  1285  	/* stop the tracing. */
bbf5b1a0cecb56 Steven Rostedt           2008-11-07  1286  	tracing_stop();
60a11774b38fef Steven Rostedt           2008-05-12  1287  	/* check both trace buffers */
1c5eb4481e0151 Steven Rostedt (VMware   2020-01-09  1288) 	ret = trace_test_buffer(&tr->array_buffer, NULL);
60a11774b38fef Steven Rostedt           2008-05-12  1289  	if (!ret)
694b3f6fe0b6c8 Steven Rostedt           2026-02-08  1290  		ret = trace_test_buffer(&tr->snapshot_buffer, &count);
60a11774b38fef Steven Rostedt           2008-05-12  1291  	trace->reset(tr);
bbf5b1a0cecb56 Steven Rostedt           2008-11-07  1292  	tracing_start();
60a11774b38fef Steven Rostedt           2008-05-12  1293  
60a11774b38fef Steven Rostedt           2008-05-12  1294  	if (!ret && !count) {
60a11774b38fef Steven Rostedt           2008-05-12  1295  		printk(KERN_CONT ".. no entries found ..");
60a11774b38fef Steven Rostedt           2008-05-12  1296  		ret = -1;
60a11774b38fef Steven Rostedt           2008-05-12  1297  	}
60a11774b38fef Steven Rostedt           2008-05-12  1298  
6d9b3fa5e7f663 Steven Rostedt (Red Hat  2014-01-14  1299) 	tr->max_latency = save_max;
60a11774b38fef Steven Rostedt           2008-05-12  1300  
60a11774b38fef Steven Rostedt           2008-05-12  1301  	return ret;
60a11774b38fef Steven Rostedt           2008-05-12  1302  }
60a11774b38fef Steven Rostedt           2008-05-12  1303  #endif /* CONFIG_PREEMPT_TRACER */
60a11774b38fef Steven Rostedt           2008-05-12  1304  

:::::: The code at line 1245 was first introduced by commit
:::::: 60a11774b38fef1ab90b18c5353bd1c7c4d311c8 ftrace: add self-tests

:::::: TO: Steven Rostedt <srostedt@redhat.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
