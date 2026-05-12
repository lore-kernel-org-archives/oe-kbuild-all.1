Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DB83A4531
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 08:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778576189; cv=none; b=tsbB7L2+eOhv1K9NcjG+JLGalje22QMdriXw/4PLvUxRfE/s+V9Lzi9iQb3IdMR9WS1uBD2IGkgIw3oBZ56fMti6gczsvhHnmapfqNoEqlYcH2ldlTYyp7GErICSQdLwTHKQ4wFyAS1aMoxXltqogiItkl1TQCZ+UwY4U6DB65c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778576189; c=relaxed/simple;
	bh=sbAHZnS7wFIqjuL+5UsVF4SgecC5xQ2dvkQft6+BCtM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Fqdpf3pScjhnuDHkF+uRI+jFEDGtY52Ha/WV8YKBR1q4tpkZWkGobFb6q9Wxq5DjcE8I+rUwvsWNnpiIhriWOm89l3Vkb1VZ5loEmal9rpseEaeRdtbs3RPVdPgoc5peuJngoARR6YKQGAvfo52TtLwdKgMo4eI3oDXE5bsHWVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aEWBzFgS; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aEWBzFgS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778576182; x=1810112182;
  h=date:from:to:cc:subject:message-id;
  bh=sbAHZnS7wFIqjuL+5UsVF4SgecC5xQ2dvkQft6+BCtM=;
  b=aEWBzFgSRsh/txduRCAExAFnu7WRgksqARWNAFQnlWBqTcqwqHqQXa7/
   pEXsz2uR2M2+n/HTnVlJcTYg5YQY45AlxwM5Kmz3aMGO3GGRbD+NrbvO/
   J4mrBkOoAGOmuC0Ct5CWutEJ0bDxTKXmxx0gejMvWlznI29jAH/5LuZT8
   kH7rxwtSlnuAhNbsw1IfocGD98oI9kjQGLC/Qf9OIQWnVzLB40ja5amsi
   dIi/v6/TjqzV2fjGiDDMB65DY/AlA3rh/XFpjtMnCSkdsBFzLXuHrig5N
   0kFcu+Ynz5ZM8qDal27PYW/RB8BvSrQgKMbp4wwV5cMJfMUnAuSj8Mr49
   Q==;
X-CSE-ConnectionGUID: UAFqz6vmTj6b7l9Cr6yMyg==
X-CSE-MsgGUID: kqRqSaOnSyqsDXEjB7DOAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="83094661"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="83094661"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 01:56:06 -0700
X-CSE-ConnectionGUID: DlWBidlHRgO1ObaMrWpA3A==
X-CSE-MsgGUID: LkHUJuIFQGyTI9QV3qZAqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="233231147"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 May 2026 01:56:04 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMiuH-000000001tW-3dOX;
	Tue, 12 May 2026 08:56:01 +0000
Date: Tue, 12 May 2026 16:55:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2026-03 0/2]
 include/trace/hooks/rust_binder.h:25:1: error: redefinition of
 'trace_android_vh_rust_binder_set_priority'
Message-ID: <202605121616.1oImU4nF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-2026-03
head:   5d2735b082b698444611c9114e672e1fea0f6a1d
commit: 0f0b6b27fd2d0cb34a84d991d308fd0927a5d044 [0/2] ANDROID: rust_binder: move rust_binder_hooks.h into include/trace/hooks
config: x86_64-randconfig-001-20260512 (https://download.01.org/0day-ci/archive/20260512/202605121616.1oImU4nF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605121616.1oImU4nF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605121616.1oImU4nF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/android/binder/rust_binder_hooks.c:16:
   In file included from include/trace/hooks/rust_binder.h:35:
   In file included from include/trace/define_trace.h:102:
>> include/trace/hooks/rust_binder.h:25:1: error: redefinition of 'trace_android_vh_rust_binder_set_priority'
      25 | DECLARE_HOOK(android_vh_rust_binder_set_priority,
         | ^
   include/trace/hooks/vendor_hooks.h:119:22: note: expanded from macro 'DECLARE_HOOK'
     119 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:625:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     625 |         static inline void trace_##name(proto)                          \
         |                            ^
   <scratch space>:41:1: note: expanded from here
      41 | trace_android_vh_rust_binder_set_priority
         | ^
   include/trace/hooks/rust_binder.h:25:1: note: previous definition is here
      25 | DECLARE_HOOK(android_vh_rust_binder_set_priority,
         | ^
   include/trace/hooks/vendor_hooks.h:119:22: note: expanded from macro 'DECLARE_HOOK'
     119 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:625:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     625 |         static inline void trace_##name(proto)                          \
         |                            ^
   <scratch space>:34:1: note: expanded from here
      34 | trace_android_vh_rust_binder_set_priority
         | ^
   In file included from drivers/android/binder/rust_binder_hooks.c:16:
   In file included from include/trace/hooks/rust_binder.h:35:
   In file included from include/trace/define_trace.h:102:
>> include/trace/hooks/rust_binder.h:25:1: error: redefinition of 'trace_android_vh_rust_binder_set_priority_enabled'
      25 | DECLARE_HOOK(android_vh_rust_binder_set_priority,
         | ^
   include/trace/hooks/vendor_hooks.h:119:22: note: expanded from macro 'DECLARE_HOOK'
     119 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:627:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     627 |         static inline bool trace_##name##_enabled(void)                 \
         |                            ^
   <scratch space>:43:1: note: expanded from here
      43 | trace_android_vh_rust_binder_set_priority_enabled
         | ^
   include/trace/hooks/rust_binder.h:25:1: note: previous definition is here
      25 | DECLARE_HOOK(android_vh_rust_binder_set_priority,
         | ^
   include/trace/hooks/vendor_hooks.h:119:22: note: expanded from macro 'DECLARE_HOOK'
     119 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:627:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     627 |         static inline bool trace_##name##_enabled(void)                 \
         |                            ^
   <scratch space>:36:1: note: expanded from here
      36 | trace_android_vh_rust_binder_set_priority_enabled
         | ^
   In file included from drivers/android/binder/rust_binder_hooks.c:16:
   In file included from include/trace/hooks/rust_binder.h:35:
   In file included from include/trace/define_trace.h:102:
>> include/trace/hooks/rust_binder.h:28:1: error: redefinition of 'trace_android_vh_rust_binder_restore_priority'
      28 | DECLARE_HOOK(android_vh_rust_binder_restore_priority,
         | ^
   include/trace/hooks/vendor_hooks.h:119:22: note: expanded from macro 'DECLARE_HOOK'
     119 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:625:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     625 |         static inline void trace_##name(proto)                          \
         |                            ^
   <scratch space>:44:1: note: expanded from here
      44 | trace_android_vh_rust_binder_restore_priority
         | ^
   include/trace/hooks/rust_binder.h:28:1: note: previous definition is here
      28 | DECLARE_HOOK(android_vh_rust_binder_restore_priority,
         | ^
   include/trace/hooks/vendor_hooks.h:119:22: note: expanded from macro 'DECLARE_HOOK'
     119 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:625:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     625 |         static inline void trace_##name(proto)                          \
         |                            ^
   <scratch space>:37:1: note: expanded from here
      37 | trace_android_vh_rust_binder_restore_priority
         | ^
   In file included from drivers/android/binder/rust_binder_hooks.c:16:
   In file included from include/trace/hooks/rust_binder.h:35:
   In file included from include/trace/define_trace.h:102:
>> include/trace/hooks/rust_binder.h:28:1: error: redefinition of 'trace_android_vh_rust_binder_restore_priority_enabled'
      28 | DECLARE_HOOK(android_vh_rust_binder_restore_priority,
         | ^
   include/trace/hooks/vendor_hooks.h:119:22: note: expanded from macro 'DECLARE_HOOK'
     119 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:627:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     627 |         static inline bool trace_##name##_enabled(void)                 \
         |                            ^
   <scratch space>:46:1: note: expanded from here
      46 | trace_android_vh_rust_binder_restore_priority_enabled
         | ^
   include/trace/hooks/rust_binder.h:28:1: note: previous definition is here
      28 | DECLARE_HOOK(android_vh_rust_binder_restore_priority,
         | ^
   include/trace/hooks/vendor_hooks.h:119:22: note: expanded from macro 'DECLARE_HOOK'
     119 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:627:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     627 |         static inline bool trace_##name##_enabled(void)                 \
         |                            ^
   <scratch space>:39:1: note: expanded from here
      39 | trace_android_vh_rust_binder_restore_priority_enabled
         | ^
   drivers/android/binder/rust_binder_hooks.c:28:1: error: use of undeclared identifier '__tracepoint_android_vh_rust_binder_set_priority'
      28 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_vh_rust_binder_set_priority);
         | ^
   include/linux/tracepoint.h:385:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     385 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^
   <scratch space>:71:1: note: expanded from here
      71 | __tracepoint_android_vh_rust_binder_set_priority
         | ^
   drivers/android/binder/rust_binder_hooks.c:28:1: error: use of undeclared identifier '__traceiter_android_vh_rust_binder_set_priority'
   include/linux/tracepoint.h:386:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     386 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |                           ^
   <scratch space>:78:1: note: expanded from here
      78 | __traceiter_android_vh_rust_binder_set_priority
         | ^
   drivers/android/binder/rust_binder_hooks.c:28:1: error: use of undeclared identifier '__SCK__tp_func_android_vh_rust_binder_set_priority'
   include/linux/tracepoint.h:387:2: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     387 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^
   include/linux/static_call.h:217:20: note: expanded from macro 'EXPORT_STATIC_CALL_GPL'
     217 |         EXPORT_SYMBOL_GPL(STATIC_CALL_KEY(name));                       \
         |                           ^
   include/linux/static_call_types.h:12:32: note: expanded from macro 'STATIC_CALL_KEY'
      12 | #define STATIC_CALL_KEY(name)           __PASTE(STATIC_CALL_KEY_PREFIX, name)
         |                                         ^
   include/linux/compiler_types.h:97:22: note: expanded from macro '__PASTE'
      97 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:96:23: note: expanded from macro '___PASTE'
      96 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:5:1: note: expanded from here
       5 | __SCK__tp_func_android_vh_rust_binder_set_priority
         | ^
   drivers/android/binder/rust_binder_hooks.c:28:1: error: use of undeclared identifier '__SCT__tp_func_android_vh_rust_binder_set_priority'
   include/linux/tracepoint.h:387:2: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     387 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^
   include/linux/static_call.h:218:20: note: expanded from macro 'EXPORT_STATIC_CALL_GPL'
     218 |         EXPORT_SYMBOL_GPL(STATIC_CALL_TRAMP(name))
         |                           ^
   include/linux/static_call_types.h:18:34: note: expanded from macro 'STATIC_CALL_TRAMP'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                         ^
   include/linux/compiler_types.h:97:22: note: expanded from macro '__PASTE'
      97 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:96:23: note: expanded from macro '___PASTE'
      96 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:12:1: note: expanded from here
      12 | __SCT__tp_func_android_vh_rust_binder_set_priority
         | ^
   drivers/android/binder/rust_binder_hooks.c:29:1: error: use of undeclared identifier '__tracepoint_android_vh_rust_binder_restore_priority'
      29 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_vh_rust_binder_restore_priority);
         | ^
   include/linux/tracepoint.h:385:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     385 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^
   <scratch space>:19:1: note: expanded from here
      19 | __tracepoint_android_vh_rust_binder_restore_priority
         | ^
   drivers/android/binder/rust_binder_hooks.c:29:1: error: use of undeclared identifier '__traceiter_android_vh_rust_binder_restore_priority'
   include/linux/tracepoint.h:386:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     386 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |                           ^
   <scratch space>:26:1: note: expanded from here
      26 | __traceiter_android_vh_rust_binder_restore_priority
         | ^
   drivers/android/binder/rust_binder_hooks.c:29:1: error: use of undeclared identifier '__SCK__tp_func_android_vh_rust_binder_restore_priority'
   include/linux/tracepoint.h:387:2: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     387 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^
   include/linux/static_call.h:217:20: note: expanded from macro 'EXPORT_STATIC_CALL_GPL'
     217 |         EXPORT_SYMBOL_GPL(STATIC_CALL_KEY(name));                       \
         |                           ^


vim +/trace_android_vh_rust_binder_set_priority +25 include/trace/hooks/rust_binder.h

    19	
    20	/*
    21	 * Following tracepoints are not exported in tracefs and provide a
    22	 * mechanism for vendor modules to hook and extend functionality
    23	 */
    24	
  > 25	DECLARE_HOOK(android_vh_rust_binder_set_priority,
    26		TP_PROTO(rust_binder_transaction t, struct task_struct *task),
    27		TP_ARGS(t, task));
  > 28	DECLARE_HOOK(android_vh_rust_binder_restore_priority,
    29		TP_PROTO(struct task_struct *task),
    30		TP_ARGS(task));
    31	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
