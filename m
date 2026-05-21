Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA31319601
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 15:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779376376; cv=none; b=tKoxdvwjCSnVzcKWaj/PXVHqH9ikTbElghDYzBVviIuvRgoTuJabnWX4jH6h6cnZjWKHtssSGaPlikWcQtjfHXEbMZsIt3z/0NLxIMQ/rnGpqVXbkrNK7nrBsRTQf/iucngAI/z8YhL2v6VhgGudFJeEFH0pFiFP6MDiN+e6Ncc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779376376; c=relaxed/simple;
	bh=fYhPes6hzzMNIg6RrvHEm+70mr8WN+/qqvEEzhfj+2w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sV4gAolMopDTV35qu9DBdOY/gShd9XlUzmUzFSQ12qVQOKSw/gC2FaGbpE46IwARubeQ4dEUQlou5T91eVMYiToPWFb707+yyMpqYFm/uacbiGq4KNgSO7hD/Mom5orBdfpCA/rVRnjANEUOhhUIy1+K9fUAoWFlztO1ptXglzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZlOPYRnk; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZlOPYRnk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779376373; x=1810912373;
  h=date:from:to:cc:subject:message-id;
  bh=fYhPes6hzzMNIg6RrvHEm+70mr8WN+/qqvEEzhfj+2w=;
  b=ZlOPYRnk6Cd/x6Ytt1A/jmlICkKK/4ku+HvJJpq2pYzjWUyfa5vZszml
   TcQKLKEPGjTpbDH4vOWG8Hsufff4zky6V2thy5rpYr81ddnmB6HoXmgnn
   tAQYlzqt7YnLiwx6hHq6Ue6OWODWCfZQhr1fr6L5vOpPJir00c3x9QZEC
   QCdFpOEqDr8mbXU4Otr0pf+yl/2X+1AdRabBqb3Cy2MsrPYcoeBQS1TmP
   E7LbgXxsYPB26TtaKLK2z90/uMs3jDvvEy0jcrHhV8vVk1tX6kVhOZ72r
   z4Q+piBWh8UF78gxQZt9y4SELaL6ySUizbsbt6OCQAKE6JBhEgf/3/mQI
   A==;
X-CSE-ConnectionGUID: rnj8CRETSbyqmeBbd42E7Q==
X-CSE-MsgGUID: iS1YyUa2SWa+Wlfj8L1rSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="82874743"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="82874743"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 08:12:51 -0700
X-CSE-ConnectionGUID: l2OEKcUJQDGAzGty+hJrCA==
X-CSE-MsgGUID: cyr29nk/RC2caGOQgugqWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="240575909"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 May 2026 08:12:50 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ54o-000000000ft-3zs7;
	Thu, 21 May 2026 15:12:46 +0000
Date: Thu, 21 May 2026 23:12:03 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/ring-buffer-bootid 4/4]
 kernel/trace/trace.c:6764:30: warning: unused variable 'trace_min_max_fops'
Message-ID: <202605212335.bebl8ZNS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/ring-buffer-bootid
head:   11c7f327c260ca2dd626cb8e242b1aed41959caf
commit: 11c7f327c260ca2dd626cb8e242b1aed41959caf [4/4] tracing: Record and show boot ID in last_boot_info
config: arc-defconfig (https://download.01.org/0day-ci/archive/20260521/202605212335.bebl8ZNS-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605212335.bebl8ZNS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605212335.bebl8ZNS-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |            ^~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:9196:26: error: initializer element is not constant
    9196 |         .notifier_call = trace_module_notify,
         |                          ^~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:9196:26: note: (near initialization for 'trace_module_nb.notifier_call')
   kernel/trace/trace.c:9201:20: error: invalid storage class for function 'tracer_init_tracefs_work_func'
    9201 | static __init void tracer_init_tracefs_work_func(struct work_struct *work)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:9240:19: error: invalid storage class for function 'tracer_init_tracefs'
    9240 | static __init int tracer_init_tracefs(void)
         |                   ^~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:9263:13: error: initializer element is not constant
    9263 | fs_initcall(tracer_init_tracefs);
         |             ^~~~~~~~~~~~~~~~~~~
   include/linux/init.h:265:55: note: in definition of macro '____define_initcall'
     265 |                 __attribute__((__section__(__sec))) = fn;
         |                                                       ^~
   include/linux/init.h:275:9: note: in expansion of macro '__unique_initcall'
     275 |         __unique_initcall(fn, id, __sec, __initcall_id(fn))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/init.h:277:35: note: in expansion of macro '___define_initcall'
     277 | #define __define_initcall(fn, id) ___define_initcall(fn, id, .initcall##id)
         |                                   ^~~~~~~~~~~~~~~~~~
   include/linux/init.h:303:41: note: in expansion of macro '__define_initcall'
     303 | #define fs_initcall(fn)                 __define_initcall(fn, 5)
         |                                         ^~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:9263:1: note: in expansion of macro 'fs_initcall'
    9263 | fs_initcall(tracer_init_tracefs);
         | ^~~~~~~~~~~
   kernel/trace/trace.c:9265:12: error: invalid storage class for function 'trace_die_panic_handler'
    9265 | static int trace_die_panic_handler(struct notifier_block *self,
         |            ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:9269:26: error: 'trace_die_panic_handler' undeclared (first use in this function)
    9269 |         .notifier_call = trace_die_panic_handler,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:9269:26: note: each undeclared identifier is reported only once for each function it appears in
   kernel/trace/trace.c:9284:12: error: invalid storage class for function 'trace_die_panic_handler'
    9284 | static int trace_die_panic_handler(struct notifier_block *self,
         |            ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:9335:13: error: invalid storage class for function 'trace_init_iter'
    9335 | static void trace_init_iter(struct trace_iterator *iter, struct trace_array *tr)
         |             ^~~~~~~~~~~~~~~
   kernel/trace/trace.c:9365:13: error: invalid storage class for function 'ftrace_dump_one'
    9365 | static void ftrace_dump_one(struct trace_array *tr, enum ftrace_dump_mode dump_mode)
         |             ^~~~~~~~~~~~~~~
   kernel/trace/trace.c:9452:13: error: invalid storage class for function 'ftrace_dump_by_param'
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
   kernel/trace/trace.c:10009:20: error: invalid storage class for function 'tracing_set_default_clock'
   10009 | static inline void tracing_set_default_clock(void) { }
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
>> kernel/trace/trace.c:6764:30: warning: unused variable 'trace_min_max_fops' [-Wunused-variable]
    6764 | const struct file_operations trace_min_max_fops = {
         |                              ^~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c: At top level:
>> kernel/trace/trace.c:1433:12: warning: 'add_tracer' used but never defined
    1433 | static int add_tracer(struct trace_array *tr, struct tracer *t);
         |            ^~~~~~~~~~
>> kernel/trace/trace.c:9965:13: warning: 'trace_init' defined but not used [-Wunused-function]
    9965 | void __init trace_init(void)
         |             ^~~~~~~~~~
>> kernel/trace/trace.c:9950:13: warning: 'early_trace_init' defined but not used [-Wunused-function]
    9950 | void __init early_trace_init(void)
         |             ^~~~~~~~~~~~~~~~
>> kernel/trace/trace.c:9526:9: warning: 'trace_parse_run_command' defined but not used [-Wunused-function]
    9526 | ssize_t trace_parse_run_command(struct file *file, const char __user *buffer,
         |         ^~~~~~~~~~~~~~~~~~~~~~~
>> kernel/trace/trace.c:9360:6: warning: 'trace_init_global_iter' defined but not used [-Wunused-function]
    9360 | void trace_init_global_iter(struct trace_iterator *iter)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/trace/trace.c:9284:12: warning: 'trace_die_panic_handler' defined but not used [-Wunused-function]
    9284 | static int trace_die_panic_handler(struct notifier_block *self,
         |            ^~~~~~~~~~~~~~~~~~~~~~~
>> kernel/trace/trace.c:9098:6: warning: 'module_exists' defined but not used [-Wunused-function]
    9098 | bool module_exists(const char *module)
         |      ^~~~~~~~~~~~~
>> kernel/trace/trace.c:8538:21: warning: 'trace_array_find_get' defined but not used [-Wunused-function]
    8538 | struct trace_array *trace_array_find_get(const char *instance)
         |                     ^~~~~~~~~~~~~~~~~~~~
>> kernel/trace/trace.c:6891:6: warning: 'tracing_log_err' defined but not used [-Wunused-function]
    6891 | void tracing_log_err(struct trace_array *tr,
         |      ^~~~~~~~~~~~~~~
>> kernel/trace/trace.c:6850:14: warning: 'err_pos' defined but not used [-Wunused-function]
    6850 | unsigned int err_pos(char *cmd, const char *str)
         |              ^~~~~~~
>> kernel/trace/trace.c:6584:5: warning: 'tracing_event_time_stamp' defined but not used [-Wunused-function]
    6584 | u64 tracing_event_time_stamp(struct trace_buffer *buffer, struct ring_buffer_event *rbe)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/trace/trace.c:6155:5: warning: 'trace_user_fault_put' defined but not used [-Wunused-function]
    6155 | int trace_user_fault_put(struct trace_user_buf_info *tinfo)
         |     ^~~~~~~~~~~~~~~~~~~~
>> kernel/trace/trace.c:6136:5: warning: 'trace_user_fault_get' defined but not used [-Wunused-function]
    6136 | int trace_user_fault_get(struct trace_user_buf_info *tinfo)
         |     ^~~~~~~~~~~~~~~~~~~~
>> kernel/trace/trace.c:6112:5: warning: 'trace_user_fault_init' defined but not used [-Wunused-function]
    6112 | int trace_user_fault_init(struct trace_user_buf_info *tinfo, size_t size)
         |     ^~~~~~~~~~~~~~~~~~~~~


vim +/trace_min_max_fops +6764 kernel/trace/trace.c

6de58e6269cd05 Steven Rostedt (Red Hat    2013-03-05  6583) 
bade44fe546212 Steven Rostedt             2026-03-24 @6584  u64 tracing_event_time_stamp(struct trace_buffer *buffer, struct ring_buffer_event *rbe)
bade44fe546212 Steven Rostedt             2026-03-24  6585  {
bade44fe546212 Steven Rostedt             2026-03-24  6586  	if (rbe == this_cpu_read(trace_buffered_event))
bade44fe546212 Steven Rostedt             2026-03-24  6587  		return ring_buffer_time_stamp(buffer);
debdd57f5145f3 Hiraku Toyooka             2012-12-26  6588  
bade44fe546212 Steven Rostedt             2026-03-24  6589  	return ring_buffer_event_time_stamp(buffer, rbe);
bade44fe546212 Steven Rostedt             2026-03-24  6590  }
debdd57f5145f3 Hiraku Toyooka             2012-12-26  6591  
6508fa761c330a Stanislav Fomichev         2014-07-18  6592  static const struct file_operations tracing_thresh_fops = {
6508fa761c330a Stanislav Fomichev         2014-07-18  6593  	.open		= tracing_open_generic,
6508fa761c330a Stanislav Fomichev         2014-07-18  6594  	.read		= tracing_thresh_read,
6508fa761c330a Stanislav Fomichev         2014-07-18  6595  	.write		= tracing_thresh_write,
6508fa761c330a Stanislav Fomichev         2014-07-18  6596  	.llseek		= generic_file_llseek,
6508fa761c330a Stanislav Fomichev         2014-07-18  6597  };
6508fa761c330a Stanislav Fomichev         2014-07-18  6598  
5e2336a0d47c96 Steven Rostedt             2009-03-05  6599  static const struct file_operations set_tracer_fops = {
9b37febc578b2e Steven Rostedt (Google     2023-09-06  6600) 	.open		= tracing_open_generic_tr,
bc0c38d139ec7f Steven Rostedt             2008-05-12  6601  	.read		= tracing_set_trace_read,
bc0c38d139ec7f Steven Rostedt             2008-05-12  6602  	.write		= tracing_set_trace_write,
b444786f1a797a Arnd Bergmann              2010-07-07  6603  	.llseek		= generic_file_llseek,
9b37febc578b2e Steven Rostedt (Google     2023-09-06  6604) 	.release	= tracing_release_generic_tr,
bc0c38d139ec7f Steven Rostedt             2008-05-12  6605  };
bc0c38d139ec7f Steven Rostedt             2008-05-12  6606  
5e2336a0d47c96 Steven Rostedt             2009-03-05  6607  static const struct file_operations tracing_pipe_fops = {
b3806b4316306d Steven Rostedt             2008-05-12  6608  	.open		= tracing_open_pipe,
2a2cc8f7c4d0df Soeren Sandmann Pedersen   2008-05-12  6609  	.poll		= tracing_poll_pipe,
b3806b4316306d Steven Rostedt             2008-05-12  6610  	.read		= tracing_read_pipe,
3c56819b14b00d Eduard - Gabriel Munteanu  2009-02-09  6611  	.splice_read	= tracing_splice_read_pipe,
b3806b4316306d Steven Rostedt             2008-05-12  6612  	.release	= tracing_release_pipe,
b3806b4316306d Steven Rostedt             2008-05-12  6613  };
b3806b4316306d Steven Rostedt             2008-05-12  6614  
5e2336a0d47c96 Steven Rostedt             2009-03-05  6615  static const struct file_operations tracing_entries_fops = {
0bc392ee46d0fd Oleg Nesterov              2013-07-23  6616  	.open		= tracing_open_generic_tr,
a98a3c3fde3ae7 Steven Rostedt             2008-05-12  6617  	.read		= tracing_entries_read,
a98a3c3fde3ae7 Steven Rostedt             2008-05-12  6618  	.write		= tracing_entries_write,
b444786f1a797a Arnd Bergmann              2010-07-07  6619  	.llseek		= generic_file_llseek,
0bc392ee46d0fd Oleg Nesterov              2013-07-23  6620  	.release	= tracing_release_generic_tr,
a98a3c3fde3ae7 Steven Rostedt             2008-05-12  6621  };
a98a3c3fde3ae7 Steven Rostedt             2008-05-12  6622  
299ea67e6a2b3d Steven Rostedt             2025-10-28  6623  static const struct file_operations tracing_syscall_buf_fops = {
299ea67e6a2b3d Steven Rostedt             2025-10-28  6624  	.open		= tracing_open_generic_tr,
299ea67e6a2b3d Steven Rostedt             2025-10-28  6625  	.read		= tracing_syscall_buf_read,
299ea67e6a2b3d Steven Rostedt             2025-10-28  6626  	.write		= tracing_syscall_buf_write,
299ea67e6a2b3d Steven Rostedt             2025-10-28  6627  	.llseek		= generic_file_llseek,
299ea67e6a2b3d Steven Rostedt             2025-10-28  6628  	.release	= tracing_release_generic_tr,
299ea67e6a2b3d Steven Rostedt             2025-10-28  6629  };
299ea67e6a2b3d Steven Rostedt             2025-10-28  6630  
950032ffcee7a4 Steven Rostedt (Google     2024-06-12  6631) static const struct file_operations tracing_buffer_meta_fops = {
950032ffcee7a4 Steven Rostedt (Google     2024-06-12  6632) 	.open		= tracing_buffer_meta_open,
950032ffcee7a4 Steven Rostedt (Google     2024-06-12  6633) 	.read		= seq_read,
950032ffcee7a4 Steven Rostedt (Google     2024-06-12  6634) 	.llseek		= seq_lseek,
950032ffcee7a4 Steven Rostedt (Google     2024-06-12  6635) 	.release	= tracing_seq_release,
950032ffcee7a4 Steven Rostedt (Google     2024-06-12  6636) };
950032ffcee7a4 Steven Rostedt (Google     2024-06-12  6637) 
f81ab074c30234 Vaibhav Nagarnaik          2011-08-16  6638  static const struct file_operations tracing_total_entries_fops = {
7b85af63034818 Steven Rostedt (Red Hat    2013-07-01  6639) 	.open		= tracing_open_generic_tr,
f81ab074c30234 Vaibhav Nagarnaik          2011-08-16  6640  	.read		= tracing_total_entries_read,
f81ab074c30234 Vaibhav Nagarnaik          2011-08-16  6641  	.llseek		= generic_file_llseek,
7b85af63034818 Steven Rostedt (Red Hat    2013-07-01  6642) 	.release	= tracing_release_generic_tr,
f81ab074c30234 Vaibhav Nagarnaik          2011-08-16  6643  };
f81ab074c30234 Vaibhav Nagarnaik          2011-08-16  6644  
4f271a2a60c748 Vaibhav Nagarnaik          2011-06-13  6645  static const struct file_operations tracing_free_buffer_fops = {
7b85af63034818 Steven Rostedt (Red Hat    2013-07-01  6646) 	.open		= tracing_open_generic_tr,
4f271a2a60c748 Vaibhav Nagarnaik          2011-06-13  6647  	.write		= tracing_free_buffer_write,
4f271a2a60c748 Vaibhav Nagarnaik          2011-06-13  6648  	.release	= tracing_free_buffer_release,
4f271a2a60c748 Vaibhav Nagarnaik          2011-06-13  6649  };
4f271a2a60c748 Vaibhav Nagarnaik          2011-06-13  6650  
5e2336a0d47c96 Steven Rostedt             2009-03-05  6651  static const struct file_operations tracing_mark_fops = {
2972e3050e3517 John Keeping               2021-12-07  6652  	.open		= tracing_mark_open,
5bf9a1ee350a10 Pekka Paalanen             2008-09-16  6653  	.write		= tracing_mark_write,
64cf7d058a005c Steven Rostedt             2025-10-08  6654  	.release	= tracing_mark_release,
5bf9a1ee350a10 Pekka Paalanen             2008-09-16  6655  };
5bf9a1ee350a10 Pekka Paalanen             2008-09-16  6656  
fa32e8557b470f Steven Rostedt             2016-07-06  6657  static const struct file_operations tracing_mark_raw_fops = {
2972e3050e3517 John Keeping               2021-12-07  6658  	.open		= tracing_mark_open,
fa32e8557b470f Steven Rostedt             2016-07-06  6659  	.write		= tracing_mark_raw_write,
64cf7d058a005c Steven Rostedt             2025-10-08  6660  	.release	= tracing_mark_release,
fa32e8557b470f Steven Rostedt             2016-07-06  6661  };
fa32e8557b470f Steven Rostedt             2016-07-06  6662  
5079f3261ffd7f Zhaolei                    2009-08-25  6663  static const struct file_operations trace_clock_fops = {
13f16d209161c9 Li Zefan                   2009-12-08  6664  	.open		= tracing_clock_open,
13f16d209161c9 Li Zefan                   2009-12-08  6665  	.read		= seq_read,
13f16d209161c9 Li Zefan                   2009-12-08  6666  	.llseek		= seq_lseek,
7b85af63034818 Steven Rostedt (Red Hat    2013-07-01  6667) 	.release	= tracing_single_release_tr,
5079f3261ffd7f Zhaolei                    2009-08-25  6668  	.write		= tracing_clock_write,
5079f3261ffd7f Zhaolei                    2009-08-25  6669  };
5079f3261ffd7f Zhaolei                    2009-08-25  6670  
2c1ea60b195da6 Tom Zanussi                2018-01-15  6671  static const struct file_operations trace_time_stamp_mode_fops = {
2c1ea60b195da6 Tom Zanussi                2018-01-15  6672  	.open		= tracing_time_stamp_mode_open,
2c1ea60b195da6 Tom Zanussi                2018-01-15  6673  	.read		= seq_read,
2c1ea60b195da6 Tom Zanussi                2018-01-15  6674  	.llseek		= seq_lseek,
2c1ea60b195da6 Tom Zanussi                2018-01-15  6675  	.release	= tracing_single_release_tr,
2c1ea60b195da6 Tom Zanussi                2018-01-15  6676  };
2c1ea60b195da6 Tom Zanussi                2018-01-15  6677  
7a1d1e4b9639ff Steven Rostedt (Google     2024-06-12  6678) static const struct file_operations last_boot_fops = {
1bd25a6f7173c0 Steven Rostedt             2025-03-05  6679  	.open		= tracing_last_boot_open,
1bd25a6f7173c0 Steven Rostedt             2025-03-05  6680  	.read		= seq_read,
1bd25a6f7173c0 Steven Rostedt             2025-03-05  6681  	.llseek		= seq_lseek,
1bd25a6f7173c0 Steven Rostedt             2025-03-05  6682  	.release	= tracing_seq_release,
7a1d1e4b9639ff Steven Rostedt (Google     2024-06-12  6683) };
7a1d1e4b9639ff Steven Rostedt (Google     2024-06-12  6684) 
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6685  /*
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6686   * trace_min_max_write - Write a u64 value to a trace_min_max_param struct
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6687   * @filp: The active open file structure
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6688   * @ubuf: The userspace provided buffer to read value into
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6689   * @cnt: The maximum number of bytes to read
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6690   * @ppos: The current "file" position
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6691   *
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6692   * This function implements the write interface for a struct trace_min_max_param.
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6693   * The filp->private_data must point to a trace_min_max_param structure that
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6694   * defines where to write the value, the min and the max acceptable values,
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6695   * and a lock to protect the write.
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6696   */
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6697  static ssize_t
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6698  trace_min_max_write(struct file *filp, const char __user *ubuf, size_t cnt, loff_t *ppos)
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6699  {
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6700  	struct trace_min_max_param *param = filp->private_data;
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6701  	u64 val;
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6702  	int err;
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6703  
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6704  	if (!param)
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6705  		return -EFAULT;
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6706  
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6707  	err = kstrtoull_from_user(ubuf, cnt, 10, &val);
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6708  	if (err)
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6709  		return err;
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6710  
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6711  	if (param->lock)
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6712  		mutex_lock(param->lock);
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6713  
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6714  	if (param->min && val < *param->min)
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6715  		err = -EINVAL;
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6716  
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6717  	if (param->max && val > *param->max)
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6718  		err = -EINVAL;
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6719  
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6720  	if (!err)
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6721  		*param->val = val;
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6722  
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6723  	if (param->lock)
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6724  		mutex_unlock(param->lock);
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6725  
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6726  	if (err)
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6727  		return err;
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6728  
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6729  	return cnt;
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6730  }
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6731  
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6732  /*
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6733   * trace_min_max_read - Read a u64 value from a trace_min_max_param struct
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6734   * @filp: The active open file structure
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6735   * @ubuf: The userspace provided buffer to read value into
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6736   * @cnt: The maximum number of bytes to read
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6737   * @ppos: The current "file" position
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6738   *
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6739   * This function implements the read interface for a struct trace_min_max_param.
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6740   * The filp->private_data must point to a trace_min_max_param struct with valid
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6741   * data.
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6742   */
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6743  static ssize_t
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6744  trace_min_max_read(struct file *filp, char __user *ubuf, size_t cnt, loff_t *ppos)
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6745  {
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6746  	struct trace_min_max_param *param = filp->private_data;
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6747  	char buf[U64_STR_SIZE];
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6748  	int len;
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6749  	u64 val;
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6750  
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6751  	if (!param)
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6752  		return -EFAULT;
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6753  
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6754  	val = *param->val;
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6755  
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6756  	if (cnt > sizeof(buf))
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6757  		cnt = sizeof(buf);
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6758  
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6759  	len = snprintf(buf, sizeof(buf), "%llu\n", val);
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6760  
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6761  	return simple_read_from_buffer(ubuf, cnt, ppos, buf, len);
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6762  }
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6763  
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22 @6764  const struct file_operations trace_min_max_fops = {
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6765  	.open		= tracing_open_generic,
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6766  	.read		= trace_min_max_read,
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6767  	.write		= trace_min_max_write,
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6768  };
bc87cf0a08d437 Daniel Bristot de Oliveira 2021-06-22  6769  
8a062902be725f Tom Zanussi                2019-03-31  6770  #define TRACING_LOG_ERRS_MAX	8
8a062902be725f Tom Zanussi                2019-03-31  6771  #define TRACING_LOG_LOC_MAX	128
8a062902be725f Tom Zanussi                2019-03-31  6772  
8a062902be725f Tom Zanussi                2019-03-31  6773  #define CMD_PREFIX "  Command: "
8a062902be725f Tom Zanussi                2019-03-31  6774  
8a062902be725f Tom Zanussi                2019-03-31  6775  struct err_info {
8a062902be725f Tom Zanussi                2019-03-31  6776  	const char	**errs;	/* ptr to loc-specific array of err strings */
8a062902be725f Tom Zanussi                2019-03-31  6777  	u8		type;	/* index into errs -> specific err string */
1581a884b7ca55 Tom Zanussi                2022-01-27  6778  	u16		pos;	/* caret position */
8a062902be725f Tom Zanussi                2019-03-31  6779  	u64		ts;
8a062902be725f Tom Zanussi                2019-03-31  6780  };
8a062902be725f Tom Zanussi                2019-03-31  6781  
8a062902be725f Tom Zanussi                2019-03-31  6782  struct tracing_log_err {
8a062902be725f Tom Zanussi                2019-03-31  6783  	struct list_head	list;
8a062902be725f Tom Zanussi                2019-03-31  6784  	struct err_info		info;
8a062902be725f Tom Zanussi                2019-03-31  6785  	char			loc[TRACING_LOG_LOC_MAX]; /* err location */
1581a884b7ca55 Tom Zanussi                2022-01-27  6786  	char			*cmd;                     /* what caused err */
8a062902be725f Tom Zanussi                2019-03-31  6787  };
8a062902be725f Tom Zanussi                2019-03-31  6788  
8a062902be725f Tom Zanussi                2019-03-31  6789  static DEFINE_MUTEX(tracing_err_log_lock);
8a062902be725f Tom Zanussi                2019-03-31  6790  
1581a884b7ca55 Tom Zanussi                2022-01-27  6791  static struct tracing_log_err *alloc_tracing_log_err(int len)
8a062902be725f Tom Zanussi                2019-03-31  6792  {
8a062902be725f Tom Zanussi                2019-03-31  6793  	struct tracing_log_err *err;
8a062902be725f Tom Zanussi                2019-03-31  6794  
bf4afc53b77aea Linus Torvalds             2026-02-21  6795  	err = kzalloc_obj(*err);
8a062902be725f Tom Zanussi                2019-03-31  6796  	if (!err)
1581a884b7ca55 Tom Zanussi                2022-01-27  6797  		return ERR_PTR(-ENOMEM);
1581a884b7ca55 Tom Zanussi                2022-01-27  6798  
1581a884b7ca55 Tom Zanussi                2022-01-27  6799  	err->cmd = kzalloc(len, GFP_KERNEL);
1581a884b7ca55 Tom Zanussi                2022-01-27  6800  	if (!err->cmd) {
1581a884b7ca55 Tom Zanussi                2022-01-27  6801  		kfree(err);
1581a884b7ca55 Tom Zanussi                2022-01-27  6802  		return ERR_PTR(-ENOMEM);
1581a884b7ca55 Tom Zanussi                2022-01-27  6803  	}
1581a884b7ca55 Tom Zanussi                2022-01-27  6804  
1581a884b7ca55 Tom Zanussi                2022-01-27  6805  	return err;
1581a884b7ca55 Tom Zanussi                2022-01-27  6806  }
1581a884b7ca55 Tom Zanussi                2022-01-27  6807  
1581a884b7ca55 Tom Zanussi                2022-01-27  6808  static void free_tracing_log_err(struct tracing_log_err *err)
1581a884b7ca55 Tom Zanussi                2022-01-27  6809  {
1581a884b7ca55 Tom Zanussi                2022-01-27  6810  	kfree(err->cmd);
1581a884b7ca55 Tom Zanussi                2022-01-27  6811  	kfree(err);
1581a884b7ca55 Tom Zanussi                2022-01-27  6812  }
1581a884b7ca55 Tom Zanussi                2022-01-27  6813  
1581a884b7ca55 Tom Zanussi                2022-01-27  6814  static struct tracing_log_err *get_tracing_log_err(struct trace_array *tr,
1581a884b7ca55 Tom Zanussi                2022-01-27  6815  						   int len)
1581a884b7ca55 Tom Zanussi                2022-01-27  6816  {
1581a884b7ca55 Tom Zanussi                2022-01-27  6817  	struct tracing_log_err *err;
067df9e0ad48a9 Zheng Yejian               2022-11-14  6818  	char *cmd;
1581a884b7ca55 Tom Zanussi                2022-01-27  6819  
1581a884b7ca55 Tom Zanussi                2022-01-27  6820  	if (tr->n_err_log_entries < TRACING_LOG_ERRS_MAX) {
1581a884b7ca55 Tom Zanussi                2022-01-27  6821  		err = alloc_tracing_log_err(len);
1581a884b7ca55 Tom Zanussi                2022-01-27  6822  		if (PTR_ERR(err) != -ENOMEM)
2f754e771b1a6f Steven Rostedt (VMware     2019-04-01  6823) 			tr->n_err_log_entries++;
8a062902be725f Tom Zanussi                2019-03-31  6824  
8a062902be725f Tom Zanussi                2019-03-31  6825  		return err;
8a062902be725f Tom Zanussi                2019-03-31  6826  	}
067df9e0ad48a9 Zheng Yejian               2022-11-14  6827  	cmd = kzalloc(len, GFP_KERNEL);
067df9e0ad48a9 Zheng Yejian               2022-11-14  6828  	if (!cmd)
067df9e0ad48a9 Zheng Yejian               2022-11-14  6829  		return ERR_PTR(-ENOMEM);
2f754e771b1a6f Steven Rostedt (VMware     2019-04-01  6830) 	err = list_first_entry(&tr->err_log, struct tracing_log_err, list);
1581a884b7ca55 Tom Zanussi                2022-01-27  6831  	kfree(err->cmd);
067df9e0ad48a9 Zheng Yejian               2022-11-14  6832  	err->cmd = cmd;
8a062902be725f Tom Zanussi                2019-03-31  6833  	list_del(&err->list);
8a062902be725f Tom Zanussi                2019-03-31  6834  
8a062902be725f Tom Zanussi                2019-03-31  6835  	return err;
8a062902be725f Tom Zanussi                2019-03-31  6836  }
8a062902be725f Tom Zanussi                2019-03-31  6837  
8a062902be725f Tom Zanussi                2019-03-31  6838  /**
8a062902be725f Tom Zanussi                2019-03-31  6839   * err_pos - find the position of a string within a command for error careting
8a062902be725f Tom Zanussi                2019-03-31  6840   * @cmd: The tracing command that caused the error
8a062902be725f Tom Zanussi                2019-03-31  6841   * @str: The string to position the caret at within @cmd
8a062902be725f Tom Zanussi                2019-03-31  6842   *
f2cc020d7876de Ingo Molnar                2021-03-23  6843   * Finds the position of the first occurrence of @str within @cmd.  The
8a062902be725f Tom Zanussi                2019-03-31  6844   * return value can be passed to tracing_log_err() for caret placement
8a062902be725f Tom Zanussi                2019-03-31  6845   * within @cmd.
8a062902be725f Tom Zanussi                2019-03-31  6846   *
f2cc020d7876de Ingo Molnar                2021-03-23  6847   * Returns the index within @cmd of the first occurrence of @str or 0
8a062902be725f Tom Zanussi                2019-03-31  6848   * if @str was not found.
8a062902be725f Tom Zanussi                2019-03-31  6849   */
8a062902be725f Tom Zanussi                2019-03-31 @6850  unsigned int err_pos(char *cmd, const char *str)
8a062902be725f Tom Zanussi                2019-03-31  6851  {
8a062902be725f Tom Zanussi                2019-03-31  6852  	char *found;
8a062902be725f Tom Zanussi                2019-03-31  6853  
8a062902be725f Tom Zanussi                2019-03-31  6854  	if (WARN_ON(!strlen(cmd)))
8a062902be725f Tom Zanussi                2019-03-31  6855  		return 0;
8a062902be725f Tom Zanussi                2019-03-31  6856  
8a062902be725f Tom Zanussi                2019-03-31  6857  	found = strstr(cmd, str);
8a062902be725f Tom Zanussi                2019-03-31  6858  	if (found)
8a062902be725f Tom Zanussi                2019-03-31  6859  		return found - cmd;
8a062902be725f Tom Zanussi                2019-03-31  6860  
8a062902be725f Tom Zanussi                2019-03-31  6861  	return 0;
8a062902be725f Tom Zanussi                2019-03-31  6862  }
8a062902be725f Tom Zanussi                2019-03-31  6863  
8a062902be725f Tom Zanussi                2019-03-31  6864  /**
8a062902be725f Tom Zanussi                2019-03-31  6865   * tracing_log_err - write an error to the tracing error log
2f754e771b1a6f Steven Rostedt (VMware     2019-04-01  6866)  * @tr: The associated trace array for the error (NULL for top level array)
8a062902be725f Tom Zanussi                2019-03-31  6867   * @loc: A string describing where the error occurred
8a062902be725f Tom Zanussi                2019-03-31  6868   * @cmd: The tracing command that caused the error
8a062902be725f Tom Zanussi                2019-03-31  6869   * @errs: The array of loc-specific static error strings
8a062902be725f Tom Zanussi                2019-03-31  6870   * @type: The index into errs[], which produces the specific static err string
8a062902be725f Tom Zanussi                2019-03-31  6871   * @pos: The position the caret should be placed in the cmd
8a062902be725f Tom Zanussi                2019-03-31  6872   *
8a062902be725f Tom Zanussi                2019-03-31  6873   * Writes an error into tracing/error_log of the form:
8a062902be725f Tom Zanussi                2019-03-31  6874   *
8a062902be725f Tom Zanussi                2019-03-31  6875   * <loc>: error: <text>
8a062902be725f Tom Zanussi                2019-03-31  6876   *   Command: <cmd>
8a062902be725f Tom Zanussi                2019-03-31  6877   *              ^
8a062902be725f Tom Zanussi                2019-03-31  6878   *
8a062902be725f Tom Zanussi                2019-03-31  6879   * tracing/error_log is a small log file containing the last
8a062902be725f Tom Zanussi                2019-03-31  6880   * TRACING_LOG_ERRS_MAX errors (8).  Memory for errors isn't allocated
8a062902be725f Tom Zanussi                2019-03-31  6881   * unless there has been a tracing error, and the error log can be
8a062902be725f Tom Zanussi                2019-03-31  6882   * cleared and have its memory freed by writing the empty string in
8a062902be725f Tom Zanussi                2019-03-31  6883   * truncation mode to it i.e. echo > tracing/error_log.
8a062902be725f Tom Zanussi                2019-03-31  6884   *
8a062902be725f Tom Zanussi                2019-03-31  6885   * NOTE: the @errs array along with the @type param are used to
8a062902be725f Tom Zanussi                2019-03-31  6886   * produce a static error string - this string is not copied and saved
8a062902be725f Tom Zanussi                2019-03-31  6887   * when the error is logged - only a pointer to it is saved.  See
8a062902be725f Tom Zanussi                2019-03-31  6888   * existing callers for examples of how static strings are typically
8a062902be725f Tom Zanussi                2019-03-31  6889   * defined for use with tracing_log_err().
8a062902be725f Tom Zanussi                2019-03-31  6890   */
2f754e771b1a6f Steven Rostedt (VMware     2019-04-01 @6891) void tracing_log_err(struct trace_array *tr,
2f754e771b1a6f Steven Rostedt (VMware     2019-04-01  6892) 		     const char *loc, const char *cmd,
1581a884b7ca55 Tom Zanussi                2022-01-27  6893  		     const char **errs, u8 type, u16 pos)
8a062902be725f Tom Zanussi                2019-03-31  6894  {
8a062902be725f Tom Zanussi                2019-03-31  6895  	struct tracing_log_err *err;
1581a884b7ca55 Tom Zanussi                2022-01-27  6896  	int len = 0;
8a062902be725f Tom Zanussi                2019-03-31  6897  
2f754e771b1a6f Steven Rostedt (VMware     2019-04-01  6898) 	if (!tr)
2f754e771b1a6f Steven Rostedt (VMware     2019-04-01  6899) 		tr = &global_trace;
2f754e771b1a6f Steven Rostedt (VMware     2019-04-01  6900) 
1581a884b7ca55 Tom Zanussi                2022-01-27  6901  	len += sizeof(CMD_PREFIX) + 2 * sizeof("\n") + strlen(cmd) + 1;
1581a884b7ca55 Tom Zanussi                2022-01-27  6902  
d33b10c0c73adc Steven Rostedt             2024-12-24  6903  	guard(mutex)(&tracing_err_log_lock);
d33b10c0c73adc Steven Rostedt             2024-12-24  6904  
1581a884b7ca55 Tom Zanussi                2022-01-27  6905  	err = get_tracing_log_err(tr, len);
d33b10c0c73adc Steven Rostedt             2024-12-24  6906  	if (PTR_ERR(err) == -ENOMEM)
8a062902be725f Tom Zanussi                2019-03-31  6907  		return;
8a062902be725f Tom Zanussi                2019-03-31  6908  
8a062902be725f Tom Zanussi                2019-03-31  6909  	snprintf(err->loc, TRACING_LOG_LOC_MAX, "%s: error: ", loc);
1581a884b7ca55 Tom Zanussi                2022-01-27  6910  	snprintf(err->cmd, len, "\n" CMD_PREFIX "%s\n", cmd);
8a062902be725f Tom Zanussi                2019-03-31  6911  
8a062902be725f Tom Zanussi                2019-03-31  6912  	err->info.errs = errs;
8a062902be725f Tom Zanussi                2019-03-31  6913  	err->info.type = type;
8a062902be725f Tom Zanussi                2019-03-31  6914  	err->info.pos = pos;
8a062902be725f Tom Zanussi                2019-03-31  6915  	err->info.ts = local_clock();
8a062902be725f Tom Zanussi                2019-03-31  6916  
2f754e771b1a6f Steven Rostedt (VMware     2019-04-01  6917) 	list_add_tail(&err->list, &tr->err_log);
8a062902be725f Tom Zanussi                2019-03-31  6918  }
8a062902be725f Tom Zanussi                2019-03-31  6919  

:::::: The code at line 6764 was first introduced by commit
:::::: bc87cf0a08d437ea192b15f0918cb581a8698f15 trace: Add a generic function to read/write u64 values from tracefs

:::::: TO: Daniel Bristot de Oliveira <bristot@redhat.com>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
