Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AAD3C4169
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Sep 2026 19:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788551464; cv=none; b=IyCO+78esePTmvbIrinmuMGLWj/8GIWFw3GB+mpN9mBKt/u4t5w4+mdNvND0znUxhcELIt5a9jh3+ghqz7LIWC0m22wpmgWEJtSszIrMuqBJOZc4uSM+Un2ICcWm3j5+0f48CBgN2f9ti+VEt0oGAHx+YdkKRqmk6rtnvvWFT7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788551464; c=relaxed/simple;
	bh=0HPDt3QePyYJyJpxNqYMAxYiE3V9WqobC6FZThqlH10=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cPBZFPhvJ1lUNBUt8+1h1FMvJDn2DIaxQNLXQl4GhoIBQ1ozvCfJ0zUwjsdfDc+2WLHRouAQFKVQIULEcP5Ib0dCKWFElMmKUeGQjrvP+hssBXeMhJD5pmyz/6VrNCzUXvIJXO7Cp9LcY3vC9gYiEYdfn+tdZSwJeAM3zbi2vAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VBjICk6q; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VBjICk6q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788551459; x=1820087459;
  h=date:from:to:cc:subject:message-id;
  bh=0HPDt3QePyYJyJpxNqYMAxYiE3V9WqobC6FZThqlH10=;
  b=VBjICk6qrwYrUZf9NfmUHg7Kew5hmzAFrBlhZWG5IE4NUfKSwWN1aAzv
   Ezbo8hd8lS4amWMayF7+i0WbVb1FT5sKhp1zBGKmObv1LCzEp9h9n7yQE
   GfPQOdmmtxlqBDOpQkdHiKmBdG4tHfum8tV2VwJnxLzwYmO108JhuHuQj
   fZHjxzW21a7OyV2AB8bQ6RS6+z781buEkQaqDU7iuLm4hj0DIMxG1v+Ty
   OEQSfYMKGv01Z9Z7T7w4Ntd0zXE6+W07F6SqRRo249MCPd3IvZdSAiixp
   U+p29Nm0S7ai7ofDEr/jP7OwrayIDdlZiTxUUWWCO/Hev9piUxIwVGrR2
   g==;
X-CSE-ConnectionGUID: YkDjgIQWSgmYDwU/FemOMA==
X-CSE-MsgGUID: 0SbTgvkOSGSLt8Kl+hDGfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="99655093"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="99655093"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 12:50:58 -0700
X-CSE-ConnectionGUID: I+vasHQhR5y34AvipEk6JA==
X-CSE-MsgGUID: Bv6kZeLVTtOIjuO14hDNvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="272067111"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Sep 2026 12:50:56 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2Zw5-00000000A6o-3xFT;
	Fri, 04 Sep 2026 19:50:53 +0000
Date: Sat, 05 Sep 2026 03:50:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-09 0/1] error[E0425]:
 cannot find value `__tracepoint_android_vh_rust_binder_set_priority` in crate
 `$crate::bindings`
Message-ID: <202609050309.gp4IvIgY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-09
head:   bab5f6aca819542b9dd13a70d3c62271e81b8e85
commit: ef05a784aa800974497a69f77b7d0302fdda70b4 [0/1] ANDROID: rust_binder: add vendor hooks for priority setting
config: x86_64-randconfig-101-20260904 (https://download.01.org/0day-ci/archive/20260905/202609050309.gp4IvIgY-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609050309.gp4IvIgY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609050309.gp4IvIgY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find value `__tracepoint_android_vh_rust_binder_set_priority` in crate `$crate::bindings`
   --> drivers/android/binder/trace.rs:17:1
   |
   17 | / declare_trace! {
   18 | |     unsafe fn binder_ioctl(cmd: c_uint, arg: c_ulong);
   19 | |     unsafe fn binder_ioctl_done(ret: c_int);
   20 | |     unsafe fn binder_read_done(ret: c_int);
   ...      |
   50 | |     unsafe fn binder_return(ret: u32);
   51 | | }
   | |_^
   |
   ::: rust/bindings/bindings_generated.rs:122172:5
   |
   122172 |       pub static mut __tracepoint_binder_set_priority: tracepoint;
   |       ----------------------------------------------------------- similarly named static `__tracepoint_binder_set_priority` defined here
   |
   = note: this error originates in the macro `declare_trace` (in Nightly builds, run with -Z macro-backtrace for more info)
   help: a static with a similar name exists
   -->    rust/kernel/tracepoint.rs:24:47
   |
   24 -                             $crate::bindings::[< __tracepoint_ $name >],
   24 +                             $crate::bindings::__tracepoint_binder_set_priority,
   |
--
>> error[E0425]: cannot find function `rust_do_trace_android_vh_rust_binder_set_priority` in crate `$crate::bindings`
   --> drivers/android/binder/trace.rs:17:1
   |
   17 | / declare_trace! {
   18 | |     unsafe fn binder_ioctl(cmd: c_uint, arg: c_ulong);
   19 | |     unsafe fn binder_ioctl_done(ret: c_int);
   20 | |     unsafe fn binder_read_done(ret: c_int);
   ...      |
   50 | |     unsafe fn binder_return(ret: u32);
   51 | | }
   | |_^
   |
   ::: rust/bindings/bindings_generated.rs:122175:5
   |
   122175 | /     pub fn rust_do_trace_binder_set_priority(
   122176 | |         thread: *mut task_struct,
   122177 | |         desired_prio: ffi::c_int,
   122178 | |         new_prio: ffi::c_int,
   122179 | |     );
   | |______- similarly named function `rust_do_trace_binder_set_priority` defined here
   |
   = note: this error originates in the macro `declare_trace` (in Nightly builds, run with -Z macro-backtrace for more info)
   help: a function with a similar name exists
   -->    rust/kernel/tracepoint.rs:34:52
   |
   34 -                         unsafe { $crate::bindings::[< rust_do_trace_ $name >]($($argname),*) };
   34 +                         unsafe { $crate::bindings::rust_do_trace_binder_set_priority($($argname),*) };
   |
--
>> error[E0425]: cannot find value `__tracepoint_android_vh_rust_binder_restore_priority` in crate `$crate::bindings`
   --> drivers/android/binder/trace.rs:17:1
   |
   17 | / declare_trace! {
   18 | |     unsafe fn binder_ioctl(cmd: c_uint, arg: c_ulong);
   19 | |     unsafe fn binder_ioctl_done(ret: c_int);
   20 | |     unsafe fn binder_read_done(ret: c_int);
   ...  |
   50 | |     unsafe fn binder_return(ret: u32);
   51 | | }
   | |_^ not found in `$crate::bindings`
   |
   = note: this error originates in the macro `declare_trace` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0425]: cannot find function `rust_do_trace_android_vh_rust_binder_restore_priority` in crate `$crate::bindings`
   --> drivers/android/binder/trace.rs:17:1
   |
   17 | / declare_trace! {
   18 | |     unsafe fn binder_ioctl(cmd: c_uint, arg: c_ulong);
   19 | |     unsafe fn binder_ioctl_done(ret: c_int);
   20 | |     unsafe fn binder_read_done(ret: c_int);
   ...  |
   50 | |     unsafe fn binder_return(ret: u32);
   51 | | }
   | |_^ not found in `$crate::bindings`
   |
   = note: this error originates in the macro `declare_trace` (in Nightly builds, run with -Z macro-backtrace for more info)
--
         |                      ^
   include/linux/tracepoint.h:640:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     640 |         static inline void trace_##name(proto)                          \
         |                            ^
   <scratch space>:74:1: note: expanded from here
      74 | trace_android_vh_rust_binder_set_priority
         | ^
   drivers/android/binder/rust_binder_hooks.h:23:1: note: previous definition is here
      23 | DECLARE_HOOK(android_vh_rust_binder_set_priority,
         | ^
   include/trace/hooks/vendor_hooks.h:127:22: note: expanded from macro 'DECLARE_HOOK'
     127 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:640:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     640 |         static inline void trace_##name(proto)                          \
         |                            ^
   <scratch space>:67:1: note: expanded from here
      67 | trace_android_vh_rust_binder_set_priority
         | ^
   In file included from drivers/android/binder/rust_binder_hooks.c:16:
   In file included from drivers/android/binder/rust_binder_hooks.h:33:
   In file included from include/trace/define_trace.h:118:
   drivers/android/binder/rust_binder_hooks.h:23:1: error: redefinition of 'trace_android_vh_rust_binder_set_priority_enabled'
      23 | DECLARE_HOOK(android_vh_rust_binder_set_priority,
         | ^
   include/trace/hooks/vendor_hooks.h:127:22: note: expanded from macro 'DECLARE_HOOK'
     127 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:642:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     642 |         static inline bool trace_##name##_enabled(void)                 \
         |                            ^
   <scratch space>:76:1: note: expanded from here
      76 | trace_android_vh_rust_binder_set_priority_enabled
         | ^
   drivers/android/binder/rust_binder_hooks.h:23:1: note: previous definition is here
      23 | DECLARE_HOOK(android_vh_rust_binder_set_priority,
         | ^
   include/trace/hooks/vendor_hooks.h:127:22: note: expanded from macro 'DECLARE_HOOK'
     127 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:642:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     642 |         static inline bool trace_##name##_enabled(void)                 \
         |                            ^
   <scratch space>:69:1: note: expanded from here
      69 | trace_android_vh_rust_binder_set_priority_enabled
         | ^
   In file included from drivers/android/binder/rust_binder_hooks.c:16:
   In file included from drivers/android/binder/rust_binder_hooks.h:33:
   In file included from include/trace/define_trace.h:118:
   drivers/android/binder/rust_binder_hooks.h:26:1: error: redefinition of 'trace_android_vh_rust_binder_restore_priority'
      26 | DECLARE_HOOK(android_vh_rust_binder_restore_priority,
         | ^
   include/trace/hooks/vendor_hooks.h:127:22: note: expanded from macro 'DECLARE_HOOK'
     127 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:640:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     640 |         static inline void trace_##name(proto)                          \
         |                            ^
   <scratch space>:77:1: note: expanded from here
      77 | trace_android_vh_rust_binder_restore_priority
         | ^
   drivers/android/binder/rust_binder_hooks.h:26:1: note: previous definition is here
      26 | DECLARE_HOOK(android_vh_rust_binder_restore_priority,
         | ^
   include/trace/hooks/vendor_hooks.h:127:22: note: expanded from macro 'DECLARE_HOOK'
     127 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:640:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     640 |         static inline void trace_##name(proto)                          \
         |                            ^
   <scratch space>:70:1: note: expanded from here
      70 | trace_android_vh_rust_binder_restore_priority
         | ^
   In file included from drivers/android/binder/rust_binder_hooks.c:16:
   In file included from drivers/android/binder/rust_binder_hooks.h:33:
   In file included from include/trace/define_trace.h:118:
   drivers/android/binder/rust_binder_hooks.h:26:1: error: redefinition of 'trace_android_vh_rust_binder_restore_priority_enabled'
      26 | DECLARE_HOOK(android_vh_rust_binder_restore_priority,
         | ^
   include/trace/hooks/vendor_hooks.h:127:22: note: expanded from macro 'DECLARE_HOOK'
     127 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:642:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     642 |         static inline bool trace_##name##_enabled(void)                 \
         |                            ^
   <scratch space>:79:1: note: expanded from here
      79 | trace_android_vh_rust_binder_restore_priority_enabled
         | ^
   drivers/android/binder/rust_binder_hooks.h:26:1: note: previous definition is here
      26 | DECLARE_HOOK(android_vh_rust_binder_restore_priority,
         | ^
   include/trace/hooks/vendor_hooks.h:127:22: note: expanded from macro 'DECLARE_HOOK'
     127 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:642:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     642 |         static inline bool trace_##name##_enabled(void)                 \
         |                            ^
   <scratch space>:72:1: note: expanded from here
      72 | trace_android_vh_rust_binder_restore_priority_enabled
         | ^
>> drivers/android/binder/rust_binder_hooks.c:22:1: error: use of undeclared identifier '__tracepoint_android_vh_rust_binder_set_priority'; did you mean 'trace_android_vh_rust_binder_set_priority'?
      22 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_vh_rust_binder_set_priority);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:374:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     374 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^~~~~~~~~~~~~~~~~~~
   <scratch space>:57:1: note: expanded from here
      57 | __tracepoint_android_vh_rust_binder_set_priority
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
>> drivers/android/binder/rust_binder_hooks.c:22:1: error: use of undeclared identifier '__traceiter_android_vh_rust_binder_set_priority'; did you mean '__tracepoint_android_vh_rust_binder_set_priority'?
      22 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_vh_rust_binder_set_priority);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:375:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     375 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |                           ^~~~~~~~~~~~~~~~~~
   <scratch space>:64:1: note: expanded from here
      64 | __traceiter_android_vh_rust_binder_set_priority
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/android/binder/rust_binder_hooks.c:22:1: note: '__tracepoint_android_vh_rust_binder_set_priority' declared here
   include/linux/tracepoint.h:374:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     374 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^
   <scratch space>:57:1: note: expanded from here
      57 | __tracepoint_android_vh_rust_binder_set_priority
         | ^
>> drivers/android/binder/rust_binder_hooks.c:22:1: error: use of undeclared identifier '__SCK__tp_func_android_vh_rust_binder_set_priority'; did you mean '__tracepoint_android_vh_rust_binder_set_priority'?
      22 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_vh_rust_binder_set_priority);
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
   <scratch space>:72:1: note: expanded from here
      72 | __SCK__tp_func_android_vh_rust_binder_set_priority
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/android/binder/rust_binder_hooks.c:22:1: note: '__tracepoint_android_vh_rust_binder_set_priority' declared here
   include/linux/tracepoint.h:374:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     374 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^
   <scratch space>:57:1: note: expanded from here
      57 | __tracepoint_android_vh_rust_binder_set_priority
         | ^
>> drivers/android/binder/rust_binder_hooks.c:22:1: error: use of undeclared identifier '__SCT__tp_func_android_vh_rust_binder_set_priority'; did you mean '__SCK__tp_func_android_vh_rust_binder_set_priority'?
      22 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_vh_rust_binder_set_priority);
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
   <scratch space>:5:1: note: expanded from here
       5 | __SCT__tp_func_android_vh_rust_binder_set_priority
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/android/binder/rust_binder_hooks.c:22:1: note: '__SCK__tp_func_android_vh_rust_binder_set_priority' declared here
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
   <scratch space>:72:1: note: expanded from here
      72 | __SCK__tp_func_android_vh_rust_binder_set_priority
         | ^
>> drivers/android/binder/rust_binder_hooks.c:23:1: error: use of undeclared identifier '__tracepoint_android_vh_rust_binder_restore_priority'; did you mean '__tracepoint_android_vh_rust_binder_set_priority'?
      23 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_vh_rust_binder_restore_priority);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:374:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     374 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^~~~~~~~~~~~~~~~~~~
   <scratch space>:12:1: note: expanded from here
      12 | __tracepoint_android_vh_rust_binder_restore_priority
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/android/binder/rust_binder_hooks.c:22:1: note: '__tracepoint_android_vh_rust_binder_set_priority' declared here
      22 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_vh_rust_binder_set_priority);
         | ^
   include/linux/tracepoint.h:374:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     374 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^
   <scratch space>:57:1: note: expanded from here
      57 | __tracepoint_android_vh_rust_binder_set_priority
         | ^
>> drivers/android/binder/rust_binder_hooks.c:23:1: error: use of undeclared identifier '__traceiter_android_vh_rust_binder_restore_priority'
      23 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_vh_rust_binder_restore_priority);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:375:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     375 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |                           ^~~~~~~~~~~~~~~~~~
   <scratch space>:19:1: note: expanded from here
      19 | __traceiter_android_vh_rust_binder_restore_priority
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/android/binder/rust_binder_hooks.c:23:1: error: use of undeclared identifier '__SCK__tp_func_android_vh_rust_binder_restore_priority'; did you mean '__SCK__tp_func_android_vh_rust_binder_set_priority'?
      23 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_vh_rust_binder_restore_priority);
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
   <scratch space>:27:1: note: expanded from here
      27 | __SCK__tp_func_android_vh_rust_binder_restore_priority
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/android/binder/rust_binder_hooks.c:22:1: note: '__SCK__tp_func_android_vh_rust_binder_set_priority' declared here
      22 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_vh_rust_binder_set_priority);
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
   <scratch space>:72:1: note: expanded from here
      72 | __SCK__tp_func_android_vh_rust_binder_set_priority
         | ^
>> drivers/android/binder/rust_binder_hooks.c:23:1: error: use of undeclared identifier '__SCT__tp_func_android_vh_rust_binder_restore_priority'; did you mean '__SCK__tp_func_android_vh_rust_binder_restore_priority'?
      23 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_vh_rust_binder_restore_priority);
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
   <scratch space>:34:1: note: expanded from here
      34 | __SCT__tp_func_android_vh_rust_binder_restore_priority
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/android/binder/rust_binder_hooks.c:23:1: note: '__SCK__tp_func_android_vh_rust_binder_restore_priority' declared here
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
   <scratch space>:27:1: note: expanded from here
      27 | __SCK__tp_func_android_vh_rust_binder_restore_priority
         | ^
   12 errors generated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
