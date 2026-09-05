Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420CF27A10F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Sep 2026 04:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788582719; cv=none; b=NYPKPRB5GCEUnfSUwOnPdLdLJSHNqtL8AbvKf9IUnAZjpmUJ0whFLRYwYLJli2PeEpkX/vwe9BehNgPALo4h/ObmhDDCiVHPS9SV76+HxM5wKvl42rCkqOkCaJCBbxxdTJj2t6ZDISo2d1GHApjUTaJ0I72WaV6ZIhLNAD4cd+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788582719; c=relaxed/simple;
	bh=D3VVZyC4dteL8UPLIDSDD4jdZV2600xZ1GzgPVvJ8jY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CUJlixJv0/GQChY3JAC3+QImHImY1T4NHm7aAXuaG95wWxaHhLIJWl++B1JJtzNo+QCDg9oLP0dtY1avavwJZI2mqgqiGagnkVJpc1wk9m3tjUnYIy8mMUkZM5ZeHJFZQOE7dC8WkM7GvUNjynh7oRhvFALAd0G8XCvqEUDBNUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tm6++Rhk; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tm6++Rhk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788582716; x=1820118716;
  h=date:from:to:cc:subject:message-id;
  bh=D3VVZyC4dteL8UPLIDSDD4jdZV2600xZ1GzgPVvJ8jY=;
  b=Tm6++Rhk6S23b5m++jODyRMJRaQuRLQzcjZQySYHmhql/hcP5X6LZYhx
   olA0lbOW+D5nGYYIsfxgRj7zMCVzrLmHTSfdVtwc+MKBpwWTuMXVYycCp
   2cH/c3DHYMmj/jTi1pSN2PsGNgu6c0Er27QqCoirIx1pZJhz3RGcVEALK
   4CFbRoy3y6SBftZK75SnKSwCkQIrzNu6hOO5bENCA653X5m+c4Dcw/tiV
   pgQm9Mluj8i/jS2VPfYvCu0noueTGG58UJ9Baj/fJ2u6xbSmaOudt2Ust
   AwN+y/sfmqSpBNLyl9PzhP6pKGPnQjOgDVn1CSiG+nnG1KbgG5RPIVm3P
   w==;
X-CSE-ConnectionGUID: W/aVe2MzTOC8qk8u6DFq8w==
X-CSE-MsgGUID: wTFPM5sURTmyDjWshhznyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="100436289"
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="100436289"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 21:31:52 -0700
X-CSE-ConnectionGUID: yDKHf3aYRfesouQ5ZepuZw==
X-CSE-MsgGUID: 24Qt3xWIRwG7kPdweaDT3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,263,1779174000"; 
   d="scan'208";a="270180537"
Received: from lkp-server01.sh.intel.com (HELO 73f3364bc37e) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Sep 2026 21:31:50 -0700
Received: from kbuild by 73f3364bc37e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2i4C-00000000019-1WtA;
	Sat, 05 Sep 2026 04:31:48 +0000
Date: Sat, 05 Sep 2026 12:31:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-09 0/1] error[E0425]:
 cannot find value `__tracepoint_android_vh_rust_binder_looper_entry` in crate
 `$crate::bindings`
Message-ID: <202609051246.xfqcs4pN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-09
head:   bab5f6aca819542b9dd13a70d3c62271e81b8e85
commit: 4ff84a79852bb177a7d7f07edc3d9030d1b87c68 [0/1] ANDROID: rust_binder: vh for starting/stopping being a binder thread
config: x86_64-randconfig-101-20260904 (https://download.01.org/0day-ci/archive/20260905/202609051246.xfqcs4pN-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609051246.xfqcs4pN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609051246.xfqcs4pN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find value `__tracepoint_android_vh_rust_binder_looper_entry` in crate `$crate::bindings`
   --> drivers/android/binder/trace.rs:17:1
   |
   17 | / declare_trace! {
   18 | |     unsafe fn binder_ioctl(cmd: c_uint, arg: c_ulong);
   19 | |     unsafe fn binder_ioctl_done(ret: c_int);
   20 | |     unsafe fn binder_read_done(ret: c_int);
   ...  |
   51 | |     unsafe fn binder_return(ret: u32);
   52 | | }
   | |_^ not found in `$crate::bindings`
   |
   = note: this error originates in the macro `declare_trace` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0425]: cannot find function `rust_do_trace_android_vh_rust_binder_looper_entry` in crate `$crate::bindings`
   --> drivers/android/binder/trace.rs:17:1
   |
   17 | / declare_trace! {
   18 | |     unsafe fn binder_ioctl(cmd: c_uint, arg: c_ulong);
   19 | |     unsafe fn binder_ioctl_done(ret: c_int);
   20 | |     unsafe fn binder_read_done(ret: c_int);
   ...  |
   51 | |     unsafe fn binder_return(ret: u32);
   52 | | }
   | |_^ not found in `$crate::bindings`
   |
   = note: this error originates in the macro `declare_trace` (in Nightly builds, run with -Z macro-backtrace for more info)
--
         |                            ^
   <scratch space>:42:1: note: expanded from here
      42 | trace_android_vh_rust_binder_set_priority
         | ^
   include/trace/hooks/rust_binder.h:25:1: note: previous definition is here
      25 | DECLARE_HOOK(android_vh_rust_binder_set_priority,
         | ^
   include/trace/hooks/vendor_hooks.h:127:22: note: expanded from macro 'DECLARE_HOOK'
     127 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:640:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     640 |         static inline void trace_##name(proto)                          \
         |                            ^
   <scratch space>:32:1: note: expanded from here
      32 | trace_android_vh_rust_binder_set_priority
         | ^
   In file included from drivers/android/binder/rust_binder_hooks.c:16:
   In file included from include/trace/hooks/rust_binder.h:38:
   In file included from include/trace/define_trace.h:118:
   include/trace/hooks/rust_binder.h:25:1: error: redefinition of 'trace_android_vh_rust_binder_set_priority_enabled'
      25 | DECLARE_HOOK(android_vh_rust_binder_set_priority,
         | ^
   include/trace/hooks/vendor_hooks.h:127:22: note: expanded from macro 'DECLARE_HOOK'
     127 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:642:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     642 |         static inline bool trace_##name##_enabled(void)                 \
         |                            ^
   <scratch space>:44:1: note: expanded from here
      44 | trace_android_vh_rust_binder_set_priority_enabled
         | ^
   include/trace/hooks/rust_binder.h:25:1: note: previous definition is here
      25 | DECLARE_HOOK(android_vh_rust_binder_set_priority,
         | ^
   include/trace/hooks/vendor_hooks.h:127:22: note: expanded from macro 'DECLARE_HOOK'
     127 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:642:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     642 |         static inline bool trace_##name##_enabled(void)                 \
         |                            ^
   <scratch space>:34:1: note: expanded from here
      34 | trace_android_vh_rust_binder_set_priority_enabled
         | ^
   In file included from drivers/android/binder/rust_binder_hooks.c:16:
   In file included from include/trace/hooks/rust_binder.h:38:
   In file included from include/trace/define_trace.h:118:
   include/trace/hooks/rust_binder.h:28:1: error: redefinition of 'trace_android_vh_rust_binder_restore_priority'
      28 | DECLARE_HOOK(android_vh_rust_binder_restore_priority,
         | ^
   include/trace/hooks/vendor_hooks.h:127:22: note: expanded from macro 'DECLARE_HOOK'
     127 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:640:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     640 |         static inline void trace_##name(proto)                          \
         |                            ^
   <scratch space>:45:1: note: expanded from here
      45 | trace_android_vh_rust_binder_restore_priority
         | ^
   include/trace/hooks/rust_binder.h:28:1: note: previous definition is here
      28 | DECLARE_HOOK(android_vh_rust_binder_restore_priority,
         | ^
   include/trace/hooks/vendor_hooks.h:127:22: note: expanded from macro 'DECLARE_HOOK'
     127 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:640:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     640 |         static inline void trace_##name(proto)                          \
         |                            ^
   <scratch space>:35:1: note: expanded from here
      35 | trace_android_vh_rust_binder_restore_priority
         | ^
   In file included from drivers/android/binder/rust_binder_hooks.c:16:
   In file included from include/trace/hooks/rust_binder.h:38:
   In file included from include/trace/define_trace.h:118:
   include/trace/hooks/rust_binder.h:28:1: error: redefinition of 'trace_android_vh_rust_binder_restore_priority_enabled'
      28 | DECLARE_HOOK(android_vh_rust_binder_restore_priority,
         | ^
   include/trace/hooks/vendor_hooks.h:127:22: note: expanded from macro 'DECLARE_HOOK'
     127 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:642:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     642 |         static inline bool trace_##name##_enabled(void)                 \
         |                            ^
   <scratch space>:47:1: note: expanded from here
      47 | trace_android_vh_rust_binder_restore_priority_enabled
         | ^
   include/trace/hooks/rust_binder.h:28:1: note: previous definition is here
      28 | DECLARE_HOOK(android_vh_rust_binder_restore_priority,
         | ^
   include/trace/hooks/vendor_hooks.h:127:22: note: expanded from macro 'DECLARE_HOOK'
     127 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:642:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     642 |         static inline bool trace_##name##_enabled(void)                 \
         |                            ^
   <scratch space>:37:1: note: expanded from here
      37 | trace_android_vh_rust_binder_restore_priority_enabled
         | ^
   In file included from drivers/android/binder/rust_binder_hooks.c:16:
   In file included from include/trace/hooks/rust_binder.h:38:
   In file included from include/trace/define_trace.h:118:
>> include/trace/hooks/rust_binder.h:31:1: error: redefinition of 'trace_android_vh_rust_binder_looper_entry'
      31 | DECLARE_HOOK(android_vh_rust_binder_looper_entry,
         | ^
   include/trace/hooks/vendor_hooks.h:127:22: note: expanded from macro 'DECLARE_HOOK'
     127 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:640:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     640 |         static inline void trace_##name(proto)                          \
         |                            ^
   <scratch space>:48:1: note: expanded from here
      48 | trace_android_vh_rust_binder_looper_entry
         | ^
   include/trace/hooks/rust_binder.h:31:1: note: previous definition is here
      31 | DECLARE_HOOK(android_vh_rust_binder_looper_entry,
         | ^
   include/trace/hooks/vendor_hooks.h:127:22: note: expanded from macro 'DECLARE_HOOK'
     127 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:640:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     640 |         static inline void trace_##name(proto)                          \
         |                            ^
   <scratch space>:38:1: note: expanded from here
      38 | trace_android_vh_rust_binder_looper_entry
         | ^
   In file included from drivers/android/binder/rust_binder_hooks.c:16:
   In file included from include/trace/hooks/rust_binder.h:38:
   In file included from include/trace/define_trace.h:118:
>> include/trace/hooks/rust_binder.h:31:1: error: redefinition of 'trace_android_vh_rust_binder_looper_entry_enabled'
      31 | DECLARE_HOOK(android_vh_rust_binder_looper_entry,
         | ^
   include/trace/hooks/vendor_hooks.h:127:22: note: expanded from macro 'DECLARE_HOOK'
     127 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:642:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     642 |         static inline bool trace_##name##_enabled(void)                 \
         |                            ^
   <scratch space>:50:1: note: expanded from here
      50 | trace_android_vh_rust_binder_looper_entry_enabled
         | ^
   include/trace/hooks/rust_binder.h:31:1: note: previous definition is here
      31 | DECLARE_HOOK(android_vh_rust_binder_looper_entry,
         | ^
   include/trace/hooks/vendor_hooks.h:127:22: note: expanded from macro 'DECLARE_HOOK'
     127 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:642:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     642 |         static inline bool trace_##name##_enabled(void)                 \
         |                            ^
   <scratch space>:40:1: note: expanded from here
      40 | trace_android_vh_rust_binder_looper_entry_enabled
         | ^
   drivers/android/binder/rust_binder_hooks.c:28:1: error: use of undeclared identifier '__tracepoint_android_vh_rust_binder_set_priority'; did you mean 'trace_android_vh_rust_binder_set_priority'?
      28 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_vh_rust_binder_set_priority);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:374:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     374 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^~~~~~~~~~~~~~~~~~~
   <scratch space>:3:1: note: expanded from here
       3 | __tracepoint_android_vh_rust_binder_set_priority
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/hooks/rust_binder.h:25:1: note: 'trace_android_vh_rust_binder_set_priority' declared here
      25 | DECLARE_HOOK(android_vh_rust_binder_set_priority,
         | ^
   include/trace/hooks/vendor_hooks.h:127:22: note: expanded from macro 'DECLARE_HOOK'
     127 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:640:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     640 |         static inline void trace_##name(proto)                          \
         |                            ^
   <scratch space>:42:1: note: expanded from here
      42 | trace_android_vh_rust_binder_set_priority
         | ^
   drivers/android/binder/rust_binder_hooks.c:28:1: error: use of undeclared identifier '__traceiter_android_vh_rust_binder_set_priority'; did you mean '__tracepoint_android_vh_rust_binder_set_priority'?
      28 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_vh_rust_binder_set_priority);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:375:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     375 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |                           ^~~~~~~~~~~~~~~~~~
   <scratch space>:10:1: note: expanded from here
      10 | __traceiter_android_vh_rust_binder_set_priority
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/android/binder/rust_binder_hooks.c:28:1: note: '__tracepoint_android_vh_rust_binder_set_priority' declared here
   include/linux/tracepoint.h:374:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     374 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^
   <scratch space>:3:1: note: expanded from here
       3 | __tracepoint_android_vh_rust_binder_set_priority
         | ^
   drivers/android/binder/rust_binder_hooks.c:28:1: error: use of undeclared identifier '__SCK__tp_func_android_vh_rust_binder_set_priority'; did you mean '__tracepoint_android_vh_rust_binder_set_priority'?
      28 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_vh_rust_binder_set_priority);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   <scratch space>:18:1: note: expanded from here
      18 | __SCK__tp_func_android_vh_rust_binder_set_priority
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/android/binder/rust_binder_hooks.c:28:1: note: '__tracepoint_android_vh_rust_binder_set_priority' declared here
   include/linux/tracepoint.h:374:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     374 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^
   <scratch space>:3:1: note: expanded from here
       3 | __tracepoint_android_vh_rust_binder_set_priority
         | ^
   drivers/android/binder/rust_binder_hooks.c:28:1: error: use of undeclared identifier '__SCT__tp_func_android_vh_rust_binder_set_priority'; did you mean '__SCK__tp_func_android_vh_rust_binder_set_priority'?
      28 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_vh_rust_binder_set_priority);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:376:2: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     376 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:218:20: note: expanded from macro 'EXPORT_STATIC_CALL_GPL'
     218 |         EXPORT_SYMBOL_GPL(STATIC_CALL_TRAMP(name))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:18:34: note: expanded from macro 'STATIC_CALL_TRAMP'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   drivers/android/binder/rust_binder_hooks.c:28:1: note: '__tracepoint_android_vh_rust_binder_set_priority' declared here
      28 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_vh_rust_binder_set_priority);
         | ^
   include/linux/tracepoint.h:374:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     374 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^
   <scratch space>:3:1: note: expanded from here
       3 | __tracepoint_android_vh_rust_binder_set_priority
         | ^
   drivers/android/binder/rust_binder_hooks.c:29:1: error: use of undeclared identifier '__traceiter_android_vh_rust_binder_restore_priority'
      29 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_vh_rust_binder_restore_priority);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:375:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     375 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |                           ^~~~~~~~~~~~~~~~~~
   <scratch space>:39:1: note: expanded from here
      39 | __traceiter_android_vh_rust_binder_restore_priority
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
   <scratch space>:47:1: note: expanded from here
      47 | __SCK__tp_func_android_vh_rust_binder_restore_priority
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
   <scratch space>:18:1: note: expanded from here
      18 | __SCK__tp_func_android_vh_rust_binder_set_priority
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
   <scratch space>:4:1: note: expanded from here
       4 | __SCT__tp_func_android_vh_rust_binder_restore_priority
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
   <scratch space>:47:1: note: expanded from here
      47 | __SCK__tp_func_android_vh_rust_binder_restore_priority
         | ^
>> drivers/android/binder/rust_binder_hooks.c:30:1: error: use of undeclared identifier '__tracepoint_android_vh_rust_binder_looper_entry'; did you mean 'trace_android_vh_rust_binder_looper_entry'?
      30 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_vh_rust_binder_looper_entry);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:374:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     374 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^~~~~~~~~~~~~~~~~~~
   <scratch space>:11:1: note: expanded from here
      11 | __tracepoint_android_vh_rust_binder_looper_entry
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/hooks/rust_binder.h:31:1: note: 'trace_android_vh_rust_binder_looper_entry' declared here
      31 | DECLARE_HOOK(android_vh_rust_binder_looper_entry,
         | ^
   include/trace/hooks/vendor_hooks.h:127:22: note: expanded from macro 'DECLARE_HOOK'
     127 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:640:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     640 |         static inline void trace_##name(proto)                          \
         |                            ^
   <scratch space>:48:1: note: expanded from here
      48 | trace_android_vh_rust_binder_looper_entry
         | ^
>> drivers/android/binder/rust_binder_hooks.c:30:1: error: use of undeclared identifier '__traceiter_android_vh_rust_binder_looper_entry'; did you mean '__tracepoint_android_vh_rust_binder_looper_entry'?
      30 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_vh_rust_binder_looper_entry);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:375:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     375 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |                           ^~~~~~~~~~~~~~~~~~
   <scratch space>:18:1: note: expanded from here
      18 | __traceiter_android_vh_rust_binder_looper_entry
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/android/binder/rust_binder_hooks.c:30:1: note: '__tracepoint_android_vh_rust_binder_looper_entry' declared here
   include/linux/tracepoint.h:374:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     374 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^
   <scratch space>:11:1: note: expanded from here
      11 | __tracepoint_android_vh_rust_binder_looper_entry
         | ^
>> drivers/android/binder/rust_binder_hooks.c:30:1: error: use of undeclared identifier '__SCK__tp_func_android_vh_rust_binder_looper_entry'
      30 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_vh_rust_binder_looper_entry);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   <scratch space>:26:1: note: expanded from here
      26 | __SCK__tp_func_android_vh_rust_binder_looper_entry
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/android/binder/rust_binder_hooks.c:30:1: error: use of undeclared identifier '__SCT__tp_func_android_vh_rust_binder_looper_entry'; did you mean '__SCK__tp_func_android_vh_rust_binder_looper_entry'?
      30 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_vh_rust_binder_looper_entry);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   <scratch space>:33:1: note: expanded from here
      33 | __SCT__tp_func_android_vh_rust_binder_looper_entry
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/android/binder/rust_binder_hooks.c:30:1: note: '__SCK__tp_func_android_vh_rust_binder_looper_entry' declared here
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
   <scratch space>:26:1: note: expanded from here
      26 | __SCK__tp_func_android_vh_rust_binder_looper_entry
         | ^
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
   include/trace/hooks/vendor_hooks.h:127:22: note: expanded from macro 'DECLARE_HOOK'
     127 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:640:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     640 |         static inline void trace_##name(proto)                          \
         |                            ^
   <scratch space>:42:1: note: expanded from here
      42 | trace_android_vh_rust_binder_set_priority
         | ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
