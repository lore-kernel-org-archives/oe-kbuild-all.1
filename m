Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4372C190
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 07:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765006193; cv=none; b=dYHSe4G+tbe9WugmY5sjFPEKZifHvlq6H2Ju/24ksgDs+xWSfFEKZDEoJ4AHFjcZzqfZq0LLvzkzFF3W/qsMpBY3+BBmYALM35+1H5uBpSQ+Oa9rJWRky8yUMOGQCCidj+b0EVeQvGC3OdU6gvy+S3TjQAIhYm/s3WH5CuBatZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765006193; c=relaxed/simple;
	bh=2fI+8Kzi9wRBsaFcRFHLFl+9Own2LFGseyhAO83Sa9M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nV8a4CYLpKGZYgRf1mGzJreA5hDL5wO8C4IBuYfhqMqGn9lXV9XAsQdiWcUwteA05/809sfEXL4ehnIOc5+T2KU/Db8aN368Ka+z1Q33C6ZkAs0kht2Tzjtgzn7QcFMRkG7x/9XEThzrmb4yMy6cZFaCk6owj4JkRTyDdu3+Ttg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NSkVY1dw; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NSkVY1dw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765006191; x=1796542191;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2fI+8Kzi9wRBsaFcRFHLFl+9Own2LFGseyhAO83Sa9M=;
  b=NSkVY1dwuplMZDlROFospZ2rnedlENJ0L16QhnzponQnqjSIk4d587/Q
   MHmGYobb04eBu9UYnVfgeCoi1etJCcNa5C62eR7T1rD+KXOu/lxjejzxw
   xMWwNf6pETiEEhOhIwgta/myXSb0Tb6MjlHImQf8njXTQ3ghziIC7z/eA
   z4c6zXDS8pDW7/CcSFtYHDfvJz/BBsPXbWlPZj30ZCnGRYNQsNm822d8K
   5qsFiqfX3hieTHpJmIqioiW6FSXHF1FFzi01Bv+Epn5e/HDGm76aEI4c5
   YM76R/HdrBQ/nyzi75tgME3bwO4JCU/l9NOrbWz/Yr+/PaqnXKe6R7LRC
   w==;
X-CSE-ConnectionGUID: /uYFXhjhTuagOIllz1cNpQ==
X-CSE-MsgGUID: GfPT5PC+R6G+ZmfK0FblzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="54577271"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="54577271"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 23:29:49 -0800
X-CSE-ConnectionGUID: zz/wV92PS2q1a8Z2oPt9MQ==
X-CSE-MsgGUID: EleW0NX9QWaKBEsHiSfK0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="194780082"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Dec 2025 23:29:48 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRmjh-00000000Fz7-2EIk;
	Sat, 06 Dec 2025 07:29:45 +0000
Date: Sat, 6 Dec 2025 15:28:47 +0800
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [glemco:staging_rv_hybrid_automata 20/21]
 kernel/trace/rv/monitors/nomiss/nomiss.c:200:13: error: conflicting types
 for 'handle_syscall'
Message-ID: <202512061540.QbBlzfiC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gmonaco/linux.git staging_rv_hybrid_automata
head:   b0f3d844e192c90aac9dc773e82b8ee2b00e431b
commit: ae02391b17cdb838b0b2c99e53eac09e7b941e8a [20/21] rv: Add deadline monitors
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20251206/202512061540.QbBlzfiC-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061540.QbBlzfiC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512061540.QbBlzfiC-lkp@intel.com/

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
>> kernel/trace/rv/monitors/nomiss/nomiss.c:200:13: error: conflicting types for 'handle_syscall'
     200 | static void handle_syscall(void *data, struct pt_regs *regs, long id)
         |             ^
   arch/um/include/shared/skas/skas.h:14:13: note: previous declaration is here
      14 | extern void handle_syscall(struct uml_pt_regs *regs);
         |             ^
   kernel/trace/rv/monitors/nomiss/nomiss.c:238:46: error: incompatible function pointer types passing 'void (struct uml_pt_regs *)' to parameter of type 'void (*)(void *, struct pt_regs *, long)' [-Wincompatible-function-pointer-types]
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
   kernel/trace/rv/monitors/nomiss/nomiss.c:238:46: error: incompatible function pointer types passing 'void (struct uml_pt_regs *)' to parameter of type 'void (*)(void *, struct pt_regs *, long)' [-Wincompatible-function-pointer-types]
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
>> kernel/trace/rv/monitors/throttle/throttle.c:157:13: error: conflicting types for 'handle_syscall'
     157 | static void handle_syscall(void *data, struct pt_regs *regs, long id)
         |             ^
   arch/um/include/shared/skas/skas.h:14:13: note: previous declaration is here
      14 | extern void handle_syscall(struct uml_pt_regs *regs);
         |             ^
   kernel/trace/rv/monitors/throttle/throttle.c:198:48: error: incompatible function pointer types passing 'void (struct uml_pt_regs *)' to parameter of type 'void (*)(void *, struct pt_regs *, long)' [-Wincompatible-function-pointer-types]
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
   kernel/trace/rv/monitors/throttle/throttle.c:198:48: error: incompatible function pointer types passing 'void (struct uml_pt_regs *)' to parameter of type 'void (*)(void *, struct pt_regs *, long)' [-Wincompatible-function-pointer-types]
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


vim +/handle_syscall +200 kernel/trace/rv/monitors/nomiss/nomiss.c

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
