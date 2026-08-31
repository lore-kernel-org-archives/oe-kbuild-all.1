Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5924AEBED
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Aug 2026 15:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788190582; cv=none; b=AwYGy9G37wecL89l2uixKd4Nyg9JAH2lAHPJTjiFjMVHUW+60sufz7Zd5Cj10CKDXAYkr2ZE8KYING/sL0GL6KWOr1LjDDp8KeCsNj4FrKWXU3N/nuxxa8s6jBr4+AYpTcxbjAP0Ak7TJAOHx/0/CY5tJDe6wIh9GeTad1lNSAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788190582; c=relaxed/simple;
	bh=+rHY+mn3kjMSEawX0iEPW4oBKgFMgJruju/vJ4jHjBI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V4WeUHmkUUBLEtqC3BAc3AMy2wdGyb/ZSYkprOMc/KrHPjowae7TCttAxr4eAoTMhgyZMC6CYZnN5/21PGVH/rpVJ8NC/tVbV2YI2afLNFFs+e0AlESLl7b2psfLLO3X1Im4xG1zG8JXohQ+bn+Rj3dQopDKOa8iZLoobjHZCk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hG3cdR2r; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hG3cdR2r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788190579; x=1819726579;
  h=date:from:to:cc:subject:message-id;
  bh=+rHY+mn3kjMSEawX0iEPW4oBKgFMgJruju/vJ4jHjBI=;
  b=hG3cdR2r/0cNAfz2qflnGgrqM1l2GNAmtp9GfojDticDl1D5v5G2QyUH
   w6SGGiuuZgDyHScT41lai5vofbHOrF8DqRX9I159eqsBgJpYSoDgL3Hky
   oJV0uudlM+RTS6j34zyLRy8wfrOBcIqqk/ht9hoU0xLMsMDQmk86a83GX
   9BxVdyLQJeUKvwXoM+I5LYnAtgqnash0Djnn3CJiKz3M5sPfLeyNtJkyJ
   sx3OVbrOeNVlMk+/6QX0Law96lmAp6T/H7o5ATF+Qo9D5IKXxKWekwbvA
   BkSStecw0nDXpKtTsvoOzQLuD2i2WJdkz9ibArge/K758ZgZT5YayT3od
   A==;
X-CSE-ConnectionGUID: qjJ8GsOMQ0eVsBSSiZ+3Eg==
X-CSE-MsgGUID: WsG4PP3uRiGYNvYWucAy8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="99203231"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="99203231"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 08:36:15 -0700
X-CSE-ConnectionGUID: O1Ofje80QeuQVD8dnqXJHA==
X-CSE-MsgGUID: 0caVurdpQmuhn1lCNTgakA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="298733442"
Received: from lkp-server01.sh.intel.com (HELO 78edef60ff5d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 31 Aug 2026 08:36:13 -0700
Received: from kbuild by 78edef60ff5d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x143P-000000000nX-2L4H;
	Mon, 31 Aug 2026 15:36:11 +0000
Date: Mon, 31 Aug 2026 23:35:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 drivers/android/binder/rust_binder_hooks.c:37:19: error: use of undeclared
 identifier 'rust_do_trace_android_vh_rust_binder_looper_entry'; did you mean
 'trace_android_vh_rust_binder_looper_entry'?
Message-ID: <202608312342.CvJC48fK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   96b3287eace89e145c28c3461ed3d8c8ea0b2baa
commit: 182d9bdc4d3105680e461fe23e8be25386b7fb3b [1/1] ANDROID: rust_binder: vh for starting/stopping being a binder thread
config: arm64-randconfig-002-20260831 (https://download.01.org/0day-ci/archive/20260831/202608312342.CvJC48fK-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 316b0edee400b3ef72ed0a082dae9bd337ac01a0)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260831/202608312342.CvJC48fK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608312342.CvJC48fK-lkp@intel.com/

All errors (new ones prefixed by >>):

         | ^
   drivers/android/binder/rust_binder_hooks.c:30:1: error: use of undeclared identifier '__tracepoint_android_vh_rust_binder_looper_entry'; did you mean 'trace_android_vh_rust_binder_looper_entry'?
      30 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_vh_rust_binder_looper_entry);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:385:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     385 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^~~~~~~~~~~~~~~~~~~
   <scratch space>:33:1: note: expanded from here
      33 | __tracepoint_android_vh_rust_binder_looper_entry
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/hooks/rust_binder.h:31:1: note: 'trace_android_vh_rust_binder_looper_entry' declared here
      31 | DECLARE_HOOK(android_vh_rust_binder_looper_entry,
         | ^
   include/trace/hooks/vendor_hooks.h:119:22: note: expanded from macro 'DECLARE_HOOK'
     119 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:625:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     625 |         static inline void trace_##name(proto)                          \
         |                            ^
   <scratch space>:177:1: note: expanded from here
     177 | trace_android_vh_rust_binder_looper_entry
         | ^
   drivers/android/binder/rust_binder_hooks.c:30:1: error: use of undeclared identifier '__traceiter_android_vh_rust_binder_looper_entry'; did you mean '__tracepoint_android_vh_rust_binder_looper_entry'?
      30 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_vh_rust_binder_looper_entry);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:386:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     386 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |                           ^~~~~~~~~~~~~~~~~~
   <scratch space>:40:1: note: expanded from here
      40 | __traceiter_android_vh_rust_binder_looper_entry
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/android/binder/rust_binder_hooks.c:30:1: note: '__tracepoint_android_vh_rust_binder_looper_entry' declared here
   include/linux/tracepoint.h:385:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     385 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^
   <scratch space>:33:1: note: expanded from here
      33 | __tracepoint_android_vh_rust_binder_looper_entry
         | ^
   drivers/android/binder/rust_binder_hooks.c:30:1: error: use of undeclared identifier '__SCK__tp_func_android_vh_rust_binder_looper_entry'
      30 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_vh_rust_binder_looper_entry);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:387:2: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     387 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:348:56: note: expanded from macro 'EXPORT_STATIC_CALL_GPL'
     348 | #define EXPORT_STATIC_CALL_GPL(name)    EXPORT_SYMBOL_GPL(STATIC_CALL_KEY(name))
         |                                                           ^~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:12:32: note: expanded from macro 'STATIC_CALL_KEY'
      12 | #define STATIC_CALL_KEY(name)           __PASTE(STATIC_CALL_KEY_PREFIX, name)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:97:22: note: expanded from macro '__PASTE'
      97 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~~~~~~
   include/linux/compiler_types.h:96:23: note: expanded from macro '___PASTE'
      96 | #define ___PASTE(a,b) a##b
         |                       ^~~~
   <scratch space>:48:1: note: expanded from here
      48 | __SCK__tp_func_android_vh_rust_binder_looper_entry
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/android/binder/rust_binder_hooks.c:35:19: error: use of undeclared identifier 'rust_do_trace_android_vh_rust_binder_set_priority'; did you mean 'trace_android_vh_rust_binder_set_priority'?
      35 | EXPORT_SYMBOL_GPL(rust_do_trace_android_vh_rust_binder_set_priority);
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
   include/trace/hooks/rust_binder.h:25:1: note: 'trace_android_vh_rust_binder_set_priority' declared here
      25 | DECLARE_HOOK(android_vh_rust_binder_set_priority,
         | ^
   include/trace/hooks/vendor_hooks.h:119:22: note: expanded from macro 'DECLARE_HOOK'
     119 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:625:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     625 |         static inline void trace_##name(proto)                          \
         |                            ^
   <scratch space>:171:1: note: expanded from here
     171 | trace_android_vh_rust_binder_set_priority
         | ^
   drivers/android/binder/rust_binder_hooks.c:36:19: error: use of undeclared identifier 'rust_do_trace_android_vh_rust_binder_restore_priority'; did you mean 'rust_do_trace_android_vh_rust_binder_set_priority'?
      36 | EXPORT_SYMBOL_GPL(rust_do_trace_android_vh_rust_binder_restore_priority);
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
   drivers/android/binder/rust_binder_hooks.c:35:19: note: 'rust_do_trace_android_vh_rust_binder_set_priority' declared here
      35 | EXPORT_SYMBOL_GPL(rust_do_trace_android_vh_rust_binder_set_priority);
         |                   ^
>> drivers/android/binder/rust_binder_hooks.c:37:19: error: use of undeclared identifier 'rust_do_trace_android_vh_rust_binder_looper_entry'; did you mean 'trace_android_vh_rust_binder_looper_entry'?
      37 | EXPORT_SYMBOL_GPL(rust_do_trace_android_vh_rust_binder_looper_entry);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                   trace_android_vh_rust_binder_looper_entry
   include/linux/export.h:90:48: note: expanded from macro 'EXPORT_SYMBOL_GPL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                                        ^~~
   include/linux/export.h:86:54: note: expanded from macro '_EXPORT_SYMBOL'
      86 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                                         ^~~
   include/linux/export.h:76:16: note: expanded from macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                       ^~~
   include/trace/hooks/rust_binder.h:31:1: note: 'trace_android_vh_rust_binder_looper_entry' declared here
      31 | DECLARE_HOOK(android_vh_rust_binder_looper_entry,
         | ^
   include/trace/hooks/vendor_hooks.h:119:22: note: expanded from macro 'DECLARE_HOOK'
     119 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:625:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     625 |         static inline void trace_##name(proto)                          \
         |                            ^
   <scratch space>:177:1: note: expanded from here
     177 | trace_android_vh_rust_binder_looper_entry
         | ^
   18 errors generated.


vim +37 drivers/android/binder/rust_binder_hooks.c

    31	
    32	/*
    33	 * Rust Binder itself calls these methods to trigger the vendor hook.
    34	 */
  > 35	EXPORT_SYMBOL_GPL(rust_do_trace_android_vh_rust_binder_set_priority);
    36	EXPORT_SYMBOL_GPL(rust_do_trace_android_vh_rust_binder_restore_priority);
  > 37	EXPORT_SYMBOL_GPL(rust_do_trace_android_vh_rust_binder_looper_entry);

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
