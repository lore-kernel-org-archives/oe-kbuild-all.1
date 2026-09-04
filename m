Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5778A2BFC85
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Sep 2026 22:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788561189; cv=none; b=ZBWc9emzPxzFwQ4GAqOLOc4vSR3Iviyd1k7+Ptv+nPdrS4iMe4oAUqZ+w2odad3tmKlOKuIfxj3DzxP9c3IkEuRK6QbApqLa+gDAmAsisXGgggja2CgumTfnEfRvc/kQvvnxsSKoDlPQvwZq2XsXeBU4LzCgDpy01U2hei8Q3ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788561189; c=relaxed/simple;
	bh=fLIPjH84awXkl9OF76aMc9JbZ4zsPlp/ykmTdZWcxdI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QzwKNphqHWL9LsDwymo7sObPJb826Z7yuUv9DkqBgLfVhrBnXDo3Et1nhdaVs+CfeHoicGOR0rX8/kUeOa1DYq/j6umRploi80pavKVNPvk/zEedv+NnXTcJI+yNszPHOWpadPN4+u4JnzulWS14pVE3+t8elO4bzuaao+iLIFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HT74Eo68; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HT74Eo68"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788561187; x=1820097187;
  h=date:from:to:cc:subject:message-id;
  bh=fLIPjH84awXkl9OF76aMc9JbZ4zsPlp/ykmTdZWcxdI=;
  b=HT74Eo68QbyrOXJo3BDfRBJyYoHXzmSt+DlkTslWsdNOwxiahxIwgFzN
   voVxFmrFymJepZ+zS4x1DvVE6nmZBPa2yZm3g8058KYYpS94idPk2TeEB
   ZQlqgM4kMwp8gRq/gZeQ6yabZhxDgLbzMNag9GlGh1vTcxd/QiBVeHBFr
   +FxLymv7x6A/rg5XJZCSaEmjiihnecH4tOagzGIserhUXMSCGeUsyJ/J3
   ORZcKy9xPU41EgBNo9XqE4NAIrrPi2Uamdjyy6tn88CRG/XqjGeUtVrXY
   JOiVeKwHwnwH8ai+8qOCTZWmlvpANzz14Ogfo65+3eSVP3dyAdwC1X5Mb
   w==;
X-CSE-ConnectionGUID: N6v0FxPLSk69E2dZiYT0Rg==
X-CSE-MsgGUID: y3QkXAV/Tp2uXPLUPGwSkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="106584640"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="106584640"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 15:33:06 -0700
X-CSE-ConnectionGUID: Mmzfx1udSsOC64NuZk+Wbw==
X-CSE-MsgGUID: 6WUYdIauQwS368Ri9uXt0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="270683250"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Sep 2026 15:33:06 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2cT0-00000000ADg-49HB;
	Fri, 04 Sep 2026 22:33:02 +0000
Date: Sat, 05 Sep 2026 06:32:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-09 0/1]
 drivers/android/binder/rust_binder_hooks.c:34:19: error: use of undeclared
 identifier 'rust_do_trace_android_vh_rust_binder_set_priority'; did you mean
 'trace_android_vh_rust_binder_set_priority'?
Message-ID: <202609050618.m1YczHzp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-09
head:   bab5f6aca819542b9dd13a70d3c62271e81b8e85
commit: 37d395f049443ba8fe571381a1b55aa025a00e13 [0/1] ANDROID: rust_binder: make rust_binder_hooks built-in
config: x86_64-randconfig-101-20260904 (https://download.01.org/0day-ci/archive/20260905/202609050618.m1YczHzp-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609050618.m1YczHzp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609050618.m1YczHzp-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/android/binder/rust_binder_hooks.c:28:1: note: '__tracepoint_android_vh_rust_binder_set_priority' declared here
      28 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_vh_rust_binder_set_priority);
         | ^
   include/linux/tracepoint.h:374:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     374 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^
   <scratch space>:63:1: note: expanded from here
      63 | __tracepoint_android_vh_rust_binder_set_priority
         | ^
   drivers/android/binder/rust_binder_hooks.c:29:1: error: use of undeclared identifier '__traceiter_android_vh_rust_binder_restore_priority'
      29 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_vh_rust_binder_restore_priority);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:375:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     375 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |                           ^~~~~~~~~~~~~~~~~~
   <scratch space>:25:1: note: expanded from here
      25 | __traceiter_android_vh_rust_binder_restore_priority
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/android/binder/rust_binder_hooks.c:29:1: error: use of undeclared identifier '__SCK__tp_func_android_vh_rust_binder_restore_priority'; did you mean '__SCK__tp_func_android_vh_rust_binder_set_priority'?
      29 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_vh_rust_binder_restore_priority);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:376:2: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     376 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:217:20: note: expanded from macro 'EXPORT_STATIC_CALL_GPL'
     217 |         EXPORT_SYMBOL_GPL(STATIC_CALL_KEY(name));                       \
         |                           ^~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:12:32: note: expanded from macro 'STATIC_CALL_KEY'
      12 | #define STATIC_CALL_KEY(name)           __PASTE(STATIC_CALL_KEY_PREFIX, name)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:97:22: note: expanded from macro '__PASTE'
      97 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~~~~~~
   include/linux/compiler_types.h:96:23: note: expanded from macro '___PASTE'
      96 | #define ___PASTE(a,b) a##b
         |                       ^~~~
   <scratch space>:33:1: note: expanded from here
      33 | __SCK__tp_func_android_vh_rust_binder_restore_priority
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/android/binder/rust_binder_hooks.c:28:1: note: '__SCK__tp_func_android_vh_rust_binder_set_priority' declared here
      28 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_vh_rust_binder_set_priority);
         | ^
   include/linux/tracepoint.h:376:2: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     376 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
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
   <scratch space>:4:1: note: expanded from here
       4 | __SCK__tp_func_android_vh_rust_binder_set_priority
         | ^
   drivers/android/binder/rust_binder_hooks.c:29:1: error: use of undeclared identifier '__SCT__tp_func_android_vh_rust_binder_restore_priority'; did you mean '__SCK__tp_func_android_vh_rust_binder_restore_priority'?
      29 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_vh_rust_binder_restore_priority);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:376:2: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     376 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:218:20: note: expanded from macro 'EXPORT_STATIC_CALL_GPL'
     218 |         EXPORT_SYMBOL_GPL(STATIC_CALL_TRAMP(name))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:18:34: note: expanded from macro 'STATIC_CALL_TRAMP'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:97:22: note: expanded from macro '__PASTE'
      97 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~~~~~~
   include/linux/compiler_types.h:96:23: note: expanded from macro '___PASTE'
      96 | #define ___PASTE(a,b) a##b
         |                       ^~~~
   <scratch space>:40:1: note: expanded from here
      40 | __SCT__tp_func_android_vh_rust_binder_restore_priority
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/android/binder/rust_binder_hooks.c:29:1: note: '__SCK__tp_func_android_vh_rust_binder_restore_priority' declared here
   include/linux/tracepoint.h:376:2: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     376 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
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
   <scratch space>:33:1: note: expanded from here
      33 | __SCK__tp_func_android_vh_rust_binder_restore_priority
         | ^
>> drivers/android/binder/rust_binder_hooks.c:34:19: error: use of undeclared identifier 'rust_do_trace_android_vh_rust_binder_set_priority'; did you mean 'trace_android_vh_rust_binder_set_priority'?
      34 | EXPORT_SYMBOL_GPL(rust_do_trace_android_vh_rust_binder_set_priority);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                   trace_android_vh_rust_binder_set_priority
   include/linux/export.h:90:48: note: expanded from macro 'EXPORT_SYMBOL_GPL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                                        ^~~
   include/linux/export.h:86:54: note: expanded from macro '_EXPORT_SYMBOL'
      86 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                                         ^~~
   include/linux/export.h:76:16: note: expanded from macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                       ^~~
   drivers/android/binder/rust_binder_hooks.h:23:1: note: 'trace_android_vh_rust_binder_set_priority' declared here
      23 | DECLARE_HOOK(android_vh_rust_binder_set_priority,
         | ^
   include/trace/hooks/vendor_hooks.h:127:22: note: expanded from macro 'DECLARE_HOOK'
     127 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:640:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     640 |         static inline void trace_##name(proto)                          \
         |                            ^
   <scratch space>:74:1: note: expanded from here
      74 | trace_android_vh_rust_binder_set_priority
         | ^
   drivers/android/binder/rust_binder_hooks.c:35:19: error: use of undeclared identifier 'rust_do_trace_android_vh_rust_binder_restore_priority'; did you mean 'rust_do_trace_android_vh_rust_binder_set_priority'?
      35 | EXPORT_SYMBOL_GPL(rust_do_trace_android_vh_rust_binder_restore_priority);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                   rust_do_trace_android_vh_rust_binder_set_priority
   include/linux/export.h:90:48: note: expanded from macro 'EXPORT_SYMBOL_GPL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                                        ^~~
   include/linux/export.h:86:54: note: expanded from macro '_EXPORT_SYMBOL'
      86 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                                         ^~~
   include/linux/export.h:76:16: note: expanded from macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                       ^~~
   drivers/android/binder/rust_binder_hooks.c:34:19: note: 'rust_do_trace_android_vh_rust_binder_set_priority' declared here
      34 | EXPORT_SYMBOL_GPL(rust_do_trace_android_vh_rust_binder_set_priority);
         |                   ^
   14 errors generated.


vim +34 drivers/android/binder/rust_binder_hooks.c

    30	
    31	/*
    32	 * Rust Binder itself calls these methods to trigger the vendor hook.
    33	 */
  > 34	EXPORT_SYMBOL_GPL(rust_do_trace_android_vh_rust_binder_set_priority);

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
