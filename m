Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2940F370D69
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 16:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779379683; cv=none; b=HvbkPiFDIO5gzpTBFBx9DzXXxfQDP7Iv/ckCy6athaFB8GrYXPvQDBlyyvEM1loCycEq9KjYdzSJ6wapm8zM+rZgaI1QWkFSHAgkGZ5ax3kpTx4Pvhdpnyi57mhS3qQp/F+wqTFycv5BRMEU9vBHi5lmQTYWM18jySIcK3yQEhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779379683; c=relaxed/simple;
	bh=Zozr4cMEuNj+plabRa0jBTmYegYNyEzY1Me4eYdp42o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VqNb/3CyyjqyopDFMDuCatLRFzY+oFwXzuWhtTkXLelVduY6RwHWpBloMpc0w9xbrKmto5mccJVyOJNO/5qKkxqSwTLsvroVp9CSaSX6+hQ/wl7Mdjg6gGhHuXvkboAXnBq2nbBsnqlgsli69Ju3bKTXlu2q1YfrUqFMzKkCQxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RoM5dTrh; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RoM5dTrh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779379681; x=1810915681;
  h=date:from:to:cc:subject:message-id;
  bh=Zozr4cMEuNj+plabRa0jBTmYegYNyEzY1Me4eYdp42o=;
  b=RoM5dTrhLIwhv1xIYtiNOF1M7G6fifF4a+bCYEFiSPZ++GWKl5ARBfEq
   SsoYc3LR6967gVnVx0Z3+ZF8Xx159gvmcqQ7DOiShmbWUJlLA5PpCVq3w
   +bORGNtjbxSx5pSCcehsR+/KP0+9hqEJluX6FbqD2k4gYGIHwYSCmvDrl
   /+2p+ki35suqVq75GVe1VJiNxPwj193MgL80yo0WDE6H0oKpRRg9ds5c7
   aucOqA9QEuS4qP25TRwVtfK8yyicNJYlzTQMgxDWRRogkhcnqGvfkNqYA
   MoT1WJ+zOPBV8sFyocz4JAhlCH+3YEM4fViu3vgW0/nmSXaoh2ti4f6/x
   g==;
X-CSE-ConnectionGUID: f4TnEqbmSbaBLnyfOzXkMA==
X-CSE-MsgGUID: QJVJjEjjQ4qXfFczUNFSgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="82879841"
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; 
   d="scan'208";a="82879841"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 09:08:00 -0700
X-CSE-ConnectionGUID: +ZXDONC2QpOIADBTXazglA==
X-CSE-MsgGUID: 4it1lcGEQfCnqukP2sPzaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; 
   d="scan'208";a="245550541"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 May 2026 09:07:58 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ5wC-000000000lh-0V5p;
	Thu, 21 May 2026 16:07:56 +0000
Date: Fri, 22 May 2026 00:07:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/ring-buffer-bootid 4/4]
 include/linux/compiler.h:273:51: error: initializer element is not constant
Message-ID: <202605220018.OWbeaNRt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/ring-buffer-bootid
head:   11c7f327c260ca2dd626cb8e242b1aed41959caf
commit: 11c7f327c260ca2dd626cb8e242b1aed41959caf [4/4] tracing: Record and show boot ID in last_boot_info
config: i386-randconfig-141-20260521 (https://download.01.org/0day-ci/archive/20260522/202605220018.OWbeaNRt-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605220018.OWbeaNRt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605220018.OWbeaNRt-lkp@intel.com/

All errors (new ones prefixed by >>):

    8451 | static int allocate_trace_buffers(struct trace_array *tr, unsigned long size)
         |            ^~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:8466:13: error: invalid storage class for function 'free_trace_buffers'
    8466 | static void free_trace_buffers(struct trace_array *tr)
         |             ^~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:8479:13: error: invalid storage class for function 'init_trace_flags_index'
    8479 | static void init_trace_flags_index(struct trace_array *tr)
         |             ^~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:8488:12: error: invalid storage class for function '__update_tracer'
    8488 | static int __update_tracer(struct trace_array *tr)
         |            ^~~~~~~~~~~~~~~
   kernel/trace/trace.c:8499:19: error: invalid storage class for function '__update_tracer_options'
    8499 | static __init int __update_tracer_options(struct trace_array *tr)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:8513:20: error: invalid storage class for function 'update_tracer_options'
    8513 | static __init void update_tracer_options(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:8550:12: error: invalid storage class for function 'trace_array_create_dir'
    8550 | static int trace_array_create_dir(struct trace_array *tr)
         |            ^~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c: In function 'trace_array_create_dir':
   kernel/trace/trace.c:8564:9: error: implicit declaration of function 'init_tracer_tracefs'; did you mean 'init_trace_sysctls'? [-Wimplicit-function-declaration]
    8564 |         init_tracer_tracefs(tr, tr->dir);
         |         ^~~~~~~~~~~~~~~~~~~
         |         init_trace_sysctls
   kernel/trace/trace.c: In function 'show_last_boot_header':
   kernel/trace/trace.c:8575:1: error: invalid storage class for function 'trace_array_create_systems'
    8575 | trace_array_create_systems(const char *name, const char *systems,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:8674:28: error: invalid storage class for function 'trace_array_create'
    8674 | static struct trace_array *trace_array_create(const char *name)
         |                            ^~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:8679:12: error: invalid storage class for function 'instance_mkdir'
    8679 | static int instance_mkdir(const char *name)
         |            ^~~~~~~~~~~~~~
   kernel/trace/trace.c:8699:12: error: invalid storage class for function 'map_pages'
    8699 | static u64 map_pages(unsigned long start, unsigned long size)
         |            ^~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/printk.h:8,
                    from include/asm-generic/bug.h:31,
                    from arch/x86/include/asm/bug.h:193,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:7:
   kernel/trace/trace.c:8770:19: error: non-static declaration of 'trace_array_get_by_name' follows static declaration
    8770 | EXPORT_SYMBOL_GPL(trace_array_get_by_name);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:76:28: note: in definition of macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:90:41: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   kernel/trace/trace.c:8770:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    8770 | EXPORT_SYMBOL_GPL(trace_array_get_by_name);
         | ^~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:8745:21: note: previous definition of 'trace_array_get_by_name' with type 'struct trace_array *(const char *, const char *)'
    8745 | struct trace_array *trace_array_get_by_name(const char *name, const char *systems)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:8772:12: error: invalid storage class for function '__remove_instance'
    8772 | static int __remove_instance(struct trace_array *tr)
         |            ^~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:8847:19: error: non-static declaration of 'trace_array_destroy' follows static declaration
    8847 | EXPORT_SYMBOL_GPL(trace_array_destroy);
         |                   ^~~~~~~~~~~~~~~~~~~
   include/linux/export.h:76:28: note: in definition of macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:90:41: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   kernel/trace/trace.c:8847:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
    8847 | EXPORT_SYMBOL_GPL(trace_array_destroy);
         | ^~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:8828:5: note: previous definition of 'trace_array_destroy' with type 'int(struct trace_array *)'
    8828 | int trace_array_destroy(struct trace_array *this_tr)
         |     ^~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:8849:12: error: invalid storage class for function 'instance_rmdir'
    8849 | static int instance_rmdir(const char *name)
         |            ^~~~~~~~~~~~~~
   kernel/trace/trace.c:8863:20: error: invalid storage class for function 'create_trace_instances'
    8863 | static __init void create_trace_instances(struct dentry *d_tracer)
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:8886:1: error: invalid storage class for function 'init_tracer_tracefs'
    8886 | init_tracer_tracefs(struct trace_array *tr, struct dentry *d_tracer)
         | ^~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:8981:25: error: invalid storage class for function 'trace_automount'
    8981 | static struct vfsmount *trace_automount(struct dentry *mntpt, void *ingore)
         |                         ^~~~~~~~~~~~~~~
   kernel/trace/trace.c:9055:26: error: section attribute cannot be specified for local variables
    9055 | struct workqueue_struct *trace_init_wq __initdata;
         |                          ^~~~~~~~~~~~~
   kernel/trace/trace.c:9059:20: error: invalid storage class for function 'eval_map_work_func'
    9059 | static void __init eval_map_work_func(struct work_struct *work)
         |                    ^~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:9067:19: error: invalid storage class for function 'trace_eval_init'
    9067 | static int __init trace_eval_init(void)
         |                   ^~~~~~~~~~~~~~~
   In file included from include/asm-generic/bug.h:5:
>> include/linux/compiler.h:273:51: error: initializer element is not constant
     273 |         __UNIQUE_ID(__PASTE(addressable_, sym)) = (void *)(uintptr_t)&sym;
         |                                                   ^
   include/linux/compiler.h:276:9: note: in expansion of macro '___ADDRESSABLE'
     276 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/init.h:251:9: note: in expansion of macro '__ADDRESSABLE'
     251 |         __ADDRESSABLE(fn)
         |         ^~~~~~~~~~~~~
   include/linux/init.h:256:9: note: in expansion of macro '__define_initcall_stub'
     256 |         __define_initcall_stub(__stub, fn)                      \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/init.h:269:9: note: in expansion of macro '____define_initcall'
     269 |         ____define_initcall(fn,                                 \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/init.h:275:9: note: in expansion of macro '__unique_initcall'
     275 |         __unique_initcall(fn, id, __sec, __initcall_id(fn))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/init.h:277:35: note: in expansion of macro '___define_initcall'
     277 | #define __define_initcall(fn, id) ___define_initcall(fn, id, .initcall##id)
         |                                   ^~~~~~~~~~~~~~~~~~
   include/linux/init.h:301:41: note: in expansion of macro '__define_initcall'
     301 | #define subsys_initcall(fn)             __define_initcall(fn, 4)
         |                                         ^~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:9083:1: note: in expansion of macro 'subsys_initcall'
    9083 | subsys_initcall(trace_eval_init);
         | ^~~~~~~~~~~~~~~
   kernel/trace/trace.c:9085:19: error: invalid storage class for function 'trace_eval_sync'
    9085 | static int __init trace_eval_sync(void)
         |                   ^~~~~~~~~~~~~~~
>> include/linux/compiler.h:273:51: error: initializer element is not constant
     273 |         __UNIQUE_ID(__PASTE(addressable_, sym)) = (void *)(uintptr_t)&sym;
         |                                                   ^
   include/linux/compiler.h:276:9: note: in expansion of macro '___ADDRESSABLE'
     276 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/init.h:251:9: note: in expansion of macro '__ADDRESSABLE'
     251 |         __ADDRESSABLE(fn)
         |         ^~~~~~~~~~~~~
   include/linux/init.h:256:9: note: in expansion of macro '__define_initcall_stub'
     256 |         __define_initcall_stub(__stub, fn)                      \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/init.h:269:9: note: in expansion of macro '____define_initcall'
     269 |         ____define_initcall(fn,                                 \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/init.h:275:9: note: in expansion of macro '__unique_initcall'
     275 |         __unique_initcall(fn, id, __sec, __initcall_id(fn))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/init.h:277:35: note: in expansion of macro '___define_initcall'
     277 | #define __define_initcall(fn, id) ___define_initcall(fn, id, .initcall##id)
         |                                   ^~~~~~~~~~~~~~~~~~
   include/linux/init.h:309:41: note: in expansion of macro '__define_initcall'
     309 | #define late_initcall_sync(fn)          __define_initcall(fn, 7s)
         |                                         ^~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:9093:1: note: in expansion of macro 'late_initcall_sync'
    9093 | late_initcall_sync(trace_eval_sync);
         | ^~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:9115:13: error: invalid storage class for function 'trace_module_add_evals'
    9115 | static void trace_module_add_evals(struct module *mod)
         |             ^~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:9155:20: error: invalid storage class for function 'trace_module_remove_evals'
    9155 | static inline void trace_module_remove_evals(struct module *mod) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:9158:13: error: invalid storage class for function 'trace_module_record'
    9158 | static void trace_module_record(struct module *mod, bool add)
         |             ^~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:9176:12: error: invalid storage class for function 'trace_module_notify'
    9176 | static int trace_module_notify(struct notifier_block *self,
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
>> include/linux/compiler.h:273:51: error: initializer element is not constant
     273 |         __UNIQUE_ID(__PASTE(addressable_, sym)) = (void *)(uintptr_t)&sym;
         |                                                   ^
   include/linux/compiler.h:276:9: note: in expansion of macro '___ADDRESSABLE'
     276 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/init.h:251:9: note: in expansion of macro '__ADDRESSABLE'
     251 |         __ADDRESSABLE(fn)
         |         ^~~~~~~~~~~~~
   include/linux/init.h:256:9: note: in expansion of macro '__define_initcall_stub'
     256 |         __define_initcall_stub(__stub, fn)                      \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/init.h:269:9: note: in expansion of macro '____define_initcall'
     269 |         ____define_initcall(fn,                                 \
         |         ^~~~~~~~~~~~~~~~~~~
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
   kernel/trace/trace.c:9991:20: error: invalid storage class for function 'tracing_set_default_clock'
    9991 | __init static void tracing_set_default_clock(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/trace/trace.c:10012:19: error: invalid storage class for function 'late_trace_init'
   10012 | __init static int late_trace_init(void)
         |                   ^~~~~~~~~~~~~~~
>> include/linux/compiler.h:273:51: error: initializer element is not constant
     273 |         __UNIQUE_ID(__PASTE(addressable_, sym)) = (void *)(uintptr_t)&sym;
         |                                                   ^
   include/linux/compiler.h:276:9: note: in expansion of macro '___ADDRESSABLE'
     276 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/init.h:251:9: note: in expansion of macro '__ADDRESSABLE'
     251 |         __ADDRESSABLE(fn)
         |         ^~~~~~~~~~~~~
   include/linux/init.h:256:9: note: in expansion of macro '__define_initcall_stub'
     256 |         __define_initcall_stub(__stub, fn)                      \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/init.h:269:9: note: in expansion of macro '____define_initcall'
     269 |         ____define_initcall(fn,                                 \
         |         ^~~~~~~~~~~~~~~~~~~
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


vim +273 include/linux/compiler.h

0ef8047b737d74 Juergen Gross  2024-11-29  264  
7290d58095712a Ard Biesheuvel 2018-08-21  265  /*
7290d58095712a Ard Biesheuvel 2018-08-21  266   * Force the compiler to emit 'sym' as a symbol, so that we can reference
7290d58095712a Ard Biesheuvel 2018-08-21  267   * it from inline assembler. Necessary in case 'sym' could be inlined
7290d58095712a Ard Biesheuvel 2018-08-21  268   * otherwise, or eliminated entirely due to lack of references that are
7290d58095712a Ard Biesheuvel 2018-08-21  269   * visible to the compiler.
7290d58095712a Ard Biesheuvel 2018-08-21  270   */
92efda8eb15295 Sami Tolvanen  2022-09-08  271  #define ___ADDRESSABLE(sym, __attrs)						\
92efda8eb15295 Sami Tolvanen  2022-09-08  272  	static void * __used __attrs						\
9f14f1f91883aa Josh Poimboeuf 2025-09-17 @273  	__UNIQUE_ID(__PASTE(addressable_, sym)) = (void *)(uintptr_t)&sym;
0ef8047b737d74 Juergen Gross  2024-11-29  274  

:::::: The code at line 273 was first introduced by commit
:::::: 9f14f1f91883aa2bfd6663161d2002c8ce937c43 compiler.h: Make addressable symbols less of an eyesore

:::::: TO: Josh Poimboeuf <jpoimboe@kernel.org>
:::::: CC: Josh Poimboeuf <jpoimboe@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
