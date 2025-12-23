Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6335F13DDAE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 11:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766490462; cv=none; b=QISV3OcIE/fiOQt8ZdKHKFfVlw1fXHqZW/hXPqlwwiYx8/MV9xi+s/u1RXQj6fyjuFyD2a9UOYDDJXOT8uBegT7TGS2JIxUNYIjpqDqPqqO6qi4b6w2lQFPd1zkXsX9lsba5utipVW1xbYNyoCxhYYRGr+dCBTIgKQKc7DfTn/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766490462; c=relaxed/simple;
	bh=vqktcWIH3dipFrkkbaS1j6td9/ckWlF/Wk2niyWH0U0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q6/jky/Sgvn1LtVEQFUC8/hs15vH742wleovD++0WGdCzKrkv2ej/a4s0WtzNQDrL86p6ZSdtPEwqMn5Mb62kQ7D/9RSt1K5QpOQYB5Yat/8xbKG3A6MC8t+Hbjl5cGs1CL4Wc5Pn+e8gdZiVwoyWZ2WPNj0RoK5T8aJqizcgtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WJnpxnSv; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WJnpxnSv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766490460; x=1798026460;
  h=date:from:to:cc:subject:message-id;
  bh=vqktcWIH3dipFrkkbaS1j6td9/ckWlF/Wk2niyWH0U0=;
  b=WJnpxnSvojRZ/H/xOD9hQ7poC2rtei9+mDNLCwA9lXpuXHjGFGCXd1AC
   P7WXKKhB0XUkHJ5GFo2zGXCArOm9ZdJ+b0l8jLHtWgXpAImnkj44uDg2X
   rm120dFYXRhcAZ7T1RQekwpaTQhAkVJBkn02V3UT03HoSabK7xgvhTUP4
   yGwKzKWj+773WDlTFhCGt+8CKHLRZ3cZ03pOSduthpPZEfraPpA8mau8J
   PYRoCIZ8UgT6sWyW7H8iSeOVNZ+7KCzFyRLA/Szeo+zdeu6JSZiXSJtHa
   iVoLaTVZjJhb3fqoj3W5jTeaswe0ec+0lUfsLmOnzNmRagtsukSfRbjzO
   g==;
X-CSE-ConnectionGUID: 2ZI3IqCVT+qNQ1DvkgYU2g==
X-CSE-MsgGUID: 7+44HteyRhm5D6r0L8xEEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="70914901"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="70914901"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 03:47:39 -0800
X-CSE-ConnectionGUID: d4hQg7w8TQqXNpZyJjrXPQ==
X-CSE-MsgGUID: YaiKJnuDQvW2YZfmgS701g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="204821831"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 23 Dec 2025 03:47:37 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY0rW-000000001pB-2aCm;
	Tue, 23 Dec 2025 11:47:34 +0000
Date: Tue, 23 Dec 2025 19:47:32 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [glemco:staging_rv_hybrid_automata 20/21]
 kernel/trace/rv/monitors/nomiss/nomiss.c:238:46: error: incompatible function
 pointer types passing 'void (struct uml_pt_regs *)' to parameter of type
 'void (*)(void *, struct pt_regs *, long)'
Message-ID: <202512231922.NWQ8jAqD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gmonaco/linux.git staging_rv_hybrid_automata
head:   4ee25b194d8ceffecc62e47ef7825e84ff983e2b
commit: 5d49442d8069b2f0242f3ee6a01868bc5fc83836 [20/21] rv: Add deadline monitors
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20251223/202512231922.NWQ8jAqD-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512231922.NWQ8jAqD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512231922.NWQ8jAqD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/trace/rv/monitors/nomiss/nomiss.c:2:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   kernel/trace/rv/monitors/nomiss/nomiss.c:200:13: error: conflicting types for 'handle_syscall'
     200 | static void handle_syscall(void *data, struct pt_regs *regs, long id)
         |             ^
   arch/um/include/shared/skas/skas.h:14:13: note: previous declaration is here
      14 | extern void handle_syscall(struct uml_pt_regs *regs);
         |             ^
>> kernel/trace/rv/monitors/nomiss/nomiss.c:238:46: error: incompatible function pointer types passing 'void (struct uml_pt_regs *)' to parameter of type 'void (*)(void *, struct pt_regs *, long)' [-Wincompatible-function-pointer-types]
     238 |                 rv_attach_trace_probe("nomiss", sys_enter, handle_syscall);
         |                                                            ^~~~~~~~~~~~~~
   include/rv/instrumentation.h:18:34: note: expanded from macro 'rv_attach_trace_probe'
      18 |                 check_trace_callback_type_##tp(rv_handler);                             \
         |                                                ^~~~~~~~~~
   include/trace/events/syscalls.h:18:1: note: passing argument to parameter 'cb' here
      18 | TRACE_EVENT_SYSCALL(sys_enter,
         | ^
   include/linux/tracepoint.h:646:2: note: expanded from macro 'TRACE_EVENT_SYSCALL'
     646 |         DECLARE_TRACE_EVENT_SYSCALL(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:504:2: note: expanded from macro 'DECLARE_TRACE_EVENT_SYSCALL'
     504 |         __DECLARE_TRACE_SYSCALL(name, PARAMS(proto), PARAMS(args),      \
         |         ^
   include/linux/tracepoint.h:299:2: note: expanded from macro '__DECLARE_TRACE_SYSCALL'
     299 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
         |         ^
   include/linux/tracepoint.h:269:42: note: expanded from macro '__DECLARE_TRACE_COMMON'
     269 |         check_trace_callback_type_##name(void (*cb)(data_proto))        \
         |                                                 ^
>> kernel/trace/rv/monitors/nomiss/nomiss.c:238:46: error: incompatible function pointer types passing 'void (struct uml_pt_regs *)' to parameter of type 'void (*)(void *, struct pt_regs *, long)' [-Wincompatible-function-pointer-types]
     238 |                 rv_attach_trace_probe("nomiss", sys_enter, handle_syscall);
         |                                                            ^~~~~~~~~~~~~~
   include/rv/instrumentation.h:19:33: note: expanded from macro 'rv_attach_trace_probe'
      19 |                 WARN_ONCE(register_trace_##tp(rv_handler, NULL),                        \
         |                                               ^~~~~~~~~~
   include/asm-generic/bug.h:185:18: note: expanded from macro 'WARN_ONCE'
     185 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |                         ^~~~~~~~~
   include/linux/once_lite.h:28:27: note: expanded from macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   include/trace/events/syscalls.h:18:1: note: passing argument to parameter 'probe' here
      18 | TRACE_EVENT_SYSCALL(sys_enter,
         | ^
   include/linux/tracepoint.h:646:2: note: expanded from macro 'TRACE_EVENT_SYSCALL'
     646 |         DECLARE_TRACE_EVENT_SYSCALL(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:504:2: note: expanded from macro 'DECLARE_TRACE_EVENT_SYSCALL'
     504 |         __DECLARE_TRACE_SYSCALL(name, PARAMS(proto), PARAMS(args),      \
         |         ^
   include/linux/tracepoint.h:299:2: note: expanded from macro '__DECLARE_TRACE_SYSCALL'
     299 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
         |         ^
   include/linux/tracepoint.h:250:31: note: expanded from macro '__DECLARE_TRACE_COMMON'
     250 |         register_trace_##name(void (*probe)(data_proto), void *data)    \
         |                                      ^
   kernel/trace/rv/monitors/nomiss/nomiss.c:253:46: error: incompatible function pointer types passing 'void (struct uml_pt_regs *)' to parameter of type 'void (*)(void *, struct pt_regs *, long)' [-Wincompatible-function-pointer-types]
     253 |                 rv_detach_trace_probe("nomiss", sys_enter, handle_syscall);
         |                                                            ^~~~~~~~~~~~~~
   include/rv/instrumentation.h:28:25: note: expanded from macro 'rv_detach_trace_probe'
      28 |                 unregister_trace_##tp(rv_handler, NULL);                                \
         |                                       ^~~~~~~~~~
   include/trace/events/syscalls.h:18:1: note: passing argument to parameter 'probe' here
      18 | TRACE_EVENT_SYSCALL(sys_enter,
         | ^
   include/linux/tracepoint.h:646:2: note: expanded from macro 'TRACE_EVENT_SYSCALL'
     646 |         DECLARE_TRACE_EVENT_SYSCALL(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:504:2: note: expanded from macro 'DECLARE_TRACE_EVENT_SYSCALL'
     504 |         __DECLARE_TRACE_SYSCALL(name, PARAMS(proto), PARAMS(args),      \
         |         ^
   include/linux/tracepoint.h:299:2: note: expanded from macro '__DECLARE_TRACE_SYSCALL'
     299 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
         |         ^
   include/linux/tracepoint.h:263:33: note: expanded from macro '__DECLARE_TRACE_COMMON'
     263 |         unregister_trace_##name(void (*probe)(data_proto), void *data)  \
         |                                        ^
   1 warning and 4 errors generated.
--
   In file included from kernel/trace/rv/monitors/throttle/throttle.c:2:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   kernel/trace/rv/monitors/throttle/throttle.c:157:13: error: conflicting types for 'handle_syscall'
     157 | static void handle_syscall(void *data, struct pt_regs *regs, long id)
         |             ^
   arch/um/include/shared/skas/skas.h:14:13: note: previous declaration is here
      14 | extern void handle_syscall(struct uml_pt_regs *regs);
         |             ^
>> kernel/trace/rv/monitors/throttle/throttle.c:198:48: error: incompatible function pointer types passing 'void (struct uml_pt_regs *)' to parameter of type 'void (*)(void *, struct pt_regs *, long)' [-Wincompatible-function-pointer-types]
     198 |                 rv_attach_trace_probe("throttle", sys_enter, handle_syscall);
         |                                                              ^~~~~~~~~~~~~~
   include/rv/instrumentation.h:18:34: note: expanded from macro 'rv_attach_trace_probe'
      18 |                 check_trace_callback_type_##tp(rv_handler);                             \
         |                                                ^~~~~~~~~~
   include/trace/events/syscalls.h:18:1: note: passing argument to parameter 'cb' here
      18 | TRACE_EVENT_SYSCALL(sys_enter,
         | ^
   include/linux/tracepoint.h:646:2: note: expanded from macro 'TRACE_EVENT_SYSCALL'
     646 |         DECLARE_TRACE_EVENT_SYSCALL(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:504:2: note: expanded from macro 'DECLARE_TRACE_EVENT_SYSCALL'
     504 |         __DECLARE_TRACE_SYSCALL(name, PARAMS(proto), PARAMS(args),      \
         |         ^
   include/linux/tracepoint.h:299:2: note: expanded from macro '__DECLARE_TRACE_SYSCALL'
     299 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
         |         ^
   include/linux/tracepoint.h:269:42: note: expanded from macro '__DECLARE_TRACE_COMMON'
     269 |         check_trace_callback_type_##name(void (*cb)(data_proto))        \
         |                                                 ^
>> kernel/trace/rv/monitors/throttle/throttle.c:198:48: error: incompatible function pointer types passing 'void (struct uml_pt_regs *)' to parameter of type 'void (*)(void *, struct pt_regs *, long)' [-Wincompatible-function-pointer-types]
     198 |                 rv_attach_trace_probe("throttle", sys_enter, handle_syscall);
         |                                                              ^~~~~~~~~~~~~~
   include/rv/instrumentation.h:19:33: note: expanded from macro 'rv_attach_trace_probe'
      19 |                 WARN_ONCE(register_trace_##tp(rv_handler, NULL),                        \
         |                                               ^~~~~~~~~~
   include/asm-generic/bug.h:185:18: note: expanded from macro 'WARN_ONCE'
     185 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |                         ^~~~~~~~~
   include/linux/once_lite.h:28:27: note: expanded from macro 'DO_ONCE_LITE_IF'
      28 |                 bool __ret_do_once = !!(condition);                     \
         |                                         ^~~~~~~~~
   include/trace/events/syscalls.h:18:1: note: passing argument to parameter 'probe' here
      18 | TRACE_EVENT_SYSCALL(sys_enter,
         | ^
   include/linux/tracepoint.h:646:2: note: expanded from macro 'TRACE_EVENT_SYSCALL'
     646 |         DECLARE_TRACE_EVENT_SYSCALL(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:504:2: note: expanded from macro 'DECLARE_TRACE_EVENT_SYSCALL'
     504 |         __DECLARE_TRACE_SYSCALL(name, PARAMS(proto), PARAMS(args),      \
         |         ^
   include/linux/tracepoint.h:299:2: note: expanded from macro '__DECLARE_TRACE_SYSCALL'
     299 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
         |         ^
   include/linux/tracepoint.h:250:31: note: expanded from macro '__DECLARE_TRACE_COMMON'
     250 |         register_trace_##name(void (*probe)(data_proto), void *data)    \
         |                                      ^
   kernel/trace/rv/monitors/throttle/throttle.c:214:48: error: incompatible function pointer types passing 'void (struct uml_pt_regs *)' to parameter of type 'void (*)(void *, struct pt_regs *, long)' [-Wincompatible-function-pointer-types]
     214 |                 rv_detach_trace_probe("throttle", sys_enter, handle_syscall);
         |                                                              ^~~~~~~~~~~~~~
   include/rv/instrumentation.h:28:25: note: expanded from macro 'rv_detach_trace_probe'
      28 |                 unregister_trace_##tp(rv_handler, NULL);                                \
         |                                       ^~~~~~~~~~
   include/trace/events/syscalls.h:18:1: note: passing argument to parameter 'probe' here
      18 | TRACE_EVENT_SYSCALL(sys_enter,
         | ^
   include/linux/tracepoint.h:646:2: note: expanded from macro 'TRACE_EVENT_SYSCALL'
     646 |         DECLARE_TRACE_EVENT_SYSCALL(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:504:2: note: expanded from macro 'DECLARE_TRACE_EVENT_SYSCALL'
     504 |         __DECLARE_TRACE_SYSCALL(name, PARAMS(proto), PARAMS(args),      \
         |         ^
   include/linux/tracepoint.h:299:2: note: expanded from macro '__DECLARE_TRACE_SYSCALL'
     299 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
         |         ^
   include/linux/tracepoint.h:263:33: note: expanded from macro '__DECLARE_TRACE_COMMON'
     263 |         unregister_trace_##name(void (*probe)(data_proto), void *data)  \
         |                                        ^
   1 warning and 4 errors generated.


vim +238 kernel/trace/rv/monitors/nomiss/nomiss.c

   199	
 > 200	static void handle_syscall(void *data, struct pt_regs *regs, long id)
   201	{
   202		struct task_struct *p;
   203		int new_policy = -1;
   204	
   205		new_policy = extract_params(regs, id, &p);
   206		if (new_policy < 0 || new_policy == p->policy)
   207			return;
   208		if (p->policy == SCHED_DEADLINE)
   209			da_reset(EXPAND_ID(&p->dl, DL_TASK));
   210		else if (new_policy == SCHED_DEADLINE)
   211			da_create_or_get(EXPAND_ID(&p->dl, DL_TASK));
   212	}
   213	
   214	static void handle_sched_wakeup(void *data, struct task_struct *tsk)
   215	{
   216		if (tsk->policy == SCHED_DEADLINE)
   217			da_handle_event(EXPAND_ID(&tsk->dl, task_cpu(tsk)), sched_wakeup_nomiss);
   218	}
   219	
   220	static int enable_nomiss(void)
   221	{
   222		int retval;
   223	
   224		retval = da_monitor_init();
   225		if (retval)
   226			return retval;
   227	
   228		retval = init_storage(false);
   229		if (retval)
   230			return retval;
   231		rv_attach_trace_probe("nomiss", sched_dl_replenish_tp, handle_dl_replenish);
   232		rv_attach_trace_probe("nomiss", sched_dl_throttle_tp, handle_dl_throttle);
   233		rv_attach_trace_probe("nomiss", sched_dl_server_start_tp, handle_dl_server_start);
   234		rv_attach_trace_probe("nomiss", sched_dl_server_stop_tp, handle_dl_server_stop);
   235		rv_attach_trace_probe("nomiss", sched_switch, handle_sched_switch);
   236		rv_attach_trace_probe("nomiss", sched_wakeup, handle_sched_wakeup);
   237		if (!should_skip_syscall_handle())
 > 238			rv_attach_trace_probe("nomiss", sys_enter, handle_syscall);
   239		rv_attach_trace_probe("nomiss", task_newtask, handle_newtask);
   240		rv_attach_trace_probe("nomiss", sched_process_exit, handle_exit);
   241	
   242		return 0;
   243	}
   244	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
