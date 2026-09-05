Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B542282F1C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Sep 2026 01:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788572689; cv=none; b=ndQJyl71vh8zjS6WP24t0HEqzjnxTjBo9+zIdTQjplaxYd5U8ZQe+t3Yeza4yV1q2pjXbm/U2eLgWc2cKJe+ts1xBawimOSWKQX3mjAmVB+7333Sj0y1UkiGRXfqoAkws+PWN6x2z0R7KxvJfcU+Z7cpM+PZVjmM+oYmW8VOG5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788572689; c=relaxed/simple;
	bh=7+GHhXFVd94A+JEJ4Mfhrb3KSDOHam4/S0ALeZVw7dw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J3wARw/8eJ7DmR+jNbHc1wbdYmosWzacLcWg/83H2OkrCPuhzufe0l7ZoPh/fUh/bbGG5ogdyT231r57szufdnkFbnkjSyndruLPn1NqxzIWZZgFSuDVKHqZDxY/sCq3u1rPtbmo88mx0MRMDe1i+1GXQOOKXwb2PClnIWVzejU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HtakL2Sd; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HtakL2Sd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788572686; x=1820108686;
  h=date:from:to:cc:subject:message-id;
  bh=7+GHhXFVd94A+JEJ4Mfhrb3KSDOHam4/S0ALeZVw7dw=;
  b=HtakL2SdJ6CvZzNu4fBud2kQQiQe0pwcUzhbaRN2zAWmJON/I03A1kIj
   5pXr03ZljMVVwk6bg+UdPAVyQeYt7+noqe4Oj8mL2sMpL29CnrM1vBcKL
   1t4u2FsSg10YzDd0wF/R3JwcbauXLIsZm9cbIylFKTf8kbEWgCh0nwZri
   RljOMPBqVqlpd/rR8FE9BSIZSGb3UE8GTOgcXt9YxIkk9hdjU5tXUdueW
   ZeeEN3cuN8B5YwrORG2VWHZ6B7XKs7JsgvkGjgJcNaWY2Vect1YnSA2GU
   MG94N5q5FbB9FMqgZG0d85+5YWHtN0FqedcTE8fQ8CMWTR3EYE7r/jpCr
   w==;
X-CSE-ConnectionGUID: vu4mz0BJQN6nomUB1Fxn5g==
X-CSE-MsgGUID: UTj9lE4QRLSEvw9E6h7nKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="92774158"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="92774158"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 18:44:45 -0700
X-CSE-ConnectionGUID: 2rnNeWMOQ9unMV060ooiMA==
X-CSE-MsgGUID: pmtWq+ksRcWPae+ta8GFrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="263991576"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 Sep 2026 18:44:43 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2fST-00000000Ab0-1Bh0;
	Sat, 05 Sep 2026 01:44:41 +0000
Date: Sat, 05 Sep 2026 09:43:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-09 0/1]
 include/trace/hooks/rust_binder.h:25:1: error: redefinition of
 'trace_android_vh_rust_binder_set_priority'
Message-ID: <202609050933.4sUV6rjo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-09
head:   bab5f6aca819542b9dd13a70d3c62271e81b8e85
commit: 6a6602755e08abe3327610530b53c6c8c25d32ce [0/1] ANDROID: rust_binder: move rust_binder_hooks.h into include/trace/hooks
config: x86_64-randconfig-101-20260904 (https://download.01.org/0day-ci/archive/20260905/202609050933.4sUV6rjo-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609050933.4sUV6rjo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609050933.4sUV6rjo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/android/binder/rust_binder_hooks.c:16:
   In file included from include/trace/hooks/rust_binder.h:35:
   In file included from include/trace/define_trace.h:118:
>> include/trace/hooks/rust_binder.h:25:1: error: redefinition of 'trace_android_vh_rust_binder_set_priority'
      25 | DECLARE_HOOK(android_vh_rust_binder_set_priority,
         | ^
   include/trace/hooks/vendor_hooks.h:127:22: note: expanded from macro 'DECLARE_HOOK'
     127 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:640:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     640 |         static inline void trace_##name(proto)                          \
         |                            ^
   <scratch space>:39:1: note: expanded from here
      39 | trace_android_vh_rust_binder_set_priority
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
   In file included from include/trace/hooks/rust_binder.h:35:
   In file included from include/trace/define_trace.h:118:
>> include/trace/hooks/rust_binder.h:25:1: error: redefinition of 'trace_android_vh_rust_binder_set_priority_enabled'
      25 | DECLARE_HOOK(android_vh_rust_binder_set_priority,
         | ^
   include/trace/hooks/vendor_hooks.h:127:22: note: expanded from macro 'DECLARE_HOOK'
     127 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:642:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     642 |         static inline bool trace_##name##_enabled(void)                 \
         |                            ^
   <scratch space>:41:1: note: expanded from here
      41 | trace_android_vh_rust_binder_set_priority_enabled
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
   In file included from include/trace/hooks/rust_binder.h:35:
   In file included from include/trace/define_trace.h:118:
>> include/trace/hooks/rust_binder.h:28:1: error: redefinition of 'trace_android_vh_rust_binder_restore_priority'
      28 | DECLARE_HOOK(android_vh_rust_binder_restore_priority,
         | ^
   include/trace/hooks/vendor_hooks.h:127:22: note: expanded from macro 'DECLARE_HOOK'
     127 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:640:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     640 |         static inline void trace_##name(proto)                          \
         |                            ^
   <scratch space>:42:1: note: expanded from here
      42 | trace_android_vh_rust_binder_restore_priority
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
   In file included from include/trace/hooks/rust_binder.h:35:
   In file included from include/trace/define_trace.h:118:
>> include/trace/hooks/rust_binder.h:28:1: error: redefinition of 'trace_android_vh_rust_binder_restore_priority_enabled'
      28 | DECLARE_HOOK(android_vh_rust_binder_restore_priority,
         | ^
   include/trace/hooks/vendor_hooks.h:127:22: note: expanded from macro 'DECLARE_HOOK'
     127 | #define DECLARE_HOOK DECLARE_EVENT_NOP
         |                      ^
   include/linux/tracepoint.h:642:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     642 |         static inline bool trace_##name##_enabled(void)                 \
         |                            ^
   <scratch space>:44:1: note: expanded from here
      44 | trace_android_vh_rust_binder_restore_priority_enabled
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
   drivers/android/binder/rust_binder_hooks.c:28:1: error: use of undeclared identifier '__tracepoint_android_vh_rust_binder_set_priority'; did you mean 'trace_android_vh_rust_binder_set_priority'?
      28 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_vh_rust_binder_set_priority);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:374:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     374 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^~~~~~~~~~~~~~~~~~~
   <scratch space>:62:1: note: expanded from here
      62 | __tracepoint_android_vh_rust_binder_set_priority
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
   <scratch space>:39:1: note: expanded from here
      39 | trace_android_vh_rust_binder_set_priority
         | ^
   drivers/android/binder/rust_binder_hooks.c:28:1: error: use of undeclared identifier '__traceiter_android_vh_rust_binder_set_priority'; did you mean '__tracepoint_android_vh_rust_binder_set_priority'?
      28 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_vh_rust_binder_set_priority);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:375:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     375 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |                           ^~~~~~~~~~~~~~~~~~
   <scratch space>:69:1: note: expanded from here
      69 | __traceiter_android_vh_rust_binder_set_priority
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/android/binder/rust_binder_hooks.c:28:1: note: '__tracepoint_android_vh_rust_binder_set_priority' declared here
   include/linux/tracepoint.h:374:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     374 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^
   <scratch space>:62:1: note: expanded from here
      62 | __tracepoint_android_vh_rust_binder_set_priority
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
   <scratch space>:77:1: note: expanded from here
      77 | __SCK__tp_func_android_vh_rust_binder_set_priority
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/android/binder/rust_binder_hooks.c:28:1: note: '__tracepoint_android_vh_rust_binder_set_priority' declared here
   include/linux/tracepoint.h:374:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     374 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^
   <scratch space>:62:1: note: expanded from here
      62 | __tracepoint_android_vh_rust_binder_set_priority
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
