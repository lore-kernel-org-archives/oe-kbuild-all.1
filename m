Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD0237D108
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 18:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773943712; cv=none; b=fnlAMlHkXvDXn4u6JUPpmaRONbMJsgicZcY2pq6Ptqy94h5TLynSuTz5fbM30aXPNuIju3X5SowooH6B62NDXOl2bzN/4Cd5LqmcGekZLNOF4OmAlzFDjvTmfZ+i/ogJ+ONX339cXusxVB6Va+F2SfpLSHxBO22zyIvWiC7MymE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773943712; c=relaxed/simple;
	bh=dIW9EnOBRObCu/YNhiUWo5CgGZv+4DO7sDePQXJj2zM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=got5NmgdLVvj06Rm6G253SsxY3/gmBjAZ20/TEsGfQrMgD3foDrXF8Nun/41Dfo6aw+ghxUEYB3FOEG1Zcrcvy9D/n5tufNiHZm3Tx0zHvEe60cdp8bA52Pq43FkS47Xh4x55RtTfcQaYPiOwsQ88BBQgURb1NsFibKbys0Q/7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fIkEEOy5; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fIkEEOy5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773943711; x=1805479711;
  h=date:from:to:cc:subject:message-id;
  bh=dIW9EnOBRObCu/YNhiUWo5CgGZv+4DO7sDePQXJj2zM=;
  b=fIkEEOy5HaKw46RXfpEKg8yJk3+U0Rn5nFyQmJwnR9WhGek6CunJj9D5
   B3ThV22V4Kej1fx1b0ZcxZG0uuDaLLe9Zz9hmh4DcQHAAGi4HqvPgCAUD
   FI9TwvvEbLq1loBLaXur1S9PxgNp6OAjK9tiZCrIqv/NbvnnflxBzwTcI
   xF+/rv7AKFo6hMaII5FQIK23prmToNK7I6vGt+8ofUpfK04BXHFR3STTs
   SRqL3NVOKdLUsRb4+had9wSywuILRpce/UqYpOaPfSfKAPA8scjr9w1+9
   8juD+ddONqqHjF0ooq6o89hfWjox2cFuAavJAPaVzRBCiNVdyj+uK41pz
   A==;
X-CSE-ConnectionGUID: kSzqrtW2T5S7BF0U4vCT3A==
X-CSE-MsgGUID: EpzMI+ZQSMG/xbZfVV1ZLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="75210841"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="75210841"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 11:08:30 -0700
X-CSE-ConnectionGUID: CkfyE6xgTiuaHYaqTRUwqA==
X-CSE-MsgGUID: eKxMuQT5TtmXZPrUljyxgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="223028158"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 19 Mar 2026 11:08:29 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3HnF-000000001Un-40TN;
	Thu, 19 Mar 2026 18:08:25 +0000
Date: Fri, 20 Mar 2026 02:06:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/4]
 drivers/android/binder/rust_binder_hooks.c:34:19: error: use of undeclared
 identifier 'rust_do_trace_android_vh_rust_binder_set_priority'
Message-ID: <202603200237.WKXqF21s-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   ad412f4914e80981e1e746cfeae78b8e96c00668
commit: a4ca8aebedb19ec6733a911706a453fe882e9b28 [0/4] ANDROID: rust_binder: make rust_binder_hooks built-in
config: x86_64-buildonly-randconfig-001-20260319 (https://download.01.org/0day-ci/archive/20260320/202603200237.WKXqF21s-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603200237.WKXqF21s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603200237.WKXqF21s-lkp@intel.com/

All errors (new ones prefixed by >>):

         | ^
   drivers/android/binder/rust_binder_hooks.c:28:1: error: use of undeclared identifier '__traceiter_android_vh_rust_binder_set_priority'
   include/linux/tracepoint.h:386:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     386 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |                           ^
   <scratch space>:40:1: note: expanded from here
      40 | __traceiter_android_vh_rust_binder_set_priority
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
   <scratch space>:48:1: note: expanded from here
      48 | __SCK__tp_func_android_vh_rust_binder_set_priority
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
   <scratch space>:55:1: note: expanded from here
      55 | __SCT__tp_func_android_vh_rust_binder_set_priority
         | ^
   drivers/android/binder/rust_binder_hooks.c:29:1: error: use of undeclared identifier '__tracepoint_android_vh_rust_binder_restore_priority'
      29 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_vh_rust_binder_restore_priority);
         | ^
   include/linux/tracepoint.h:385:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     385 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^
   <scratch space>:62:1: note: expanded from here
      62 | __tracepoint_android_vh_rust_binder_restore_priority
         | ^
   drivers/android/binder/rust_binder_hooks.c:29:1: error: use of undeclared identifier '__traceiter_android_vh_rust_binder_restore_priority'
   include/linux/tracepoint.h:386:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     386 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |                           ^
   <scratch space>:7:1: note: expanded from here
       7 | __traceiter_android_vh_rust_binder_restore_priority
         | ^
   drivers/android/binder/rust_binder_hooks.c:29:1: error: use of undeclared identifier '__SCK__tp_func_android_vh_rust_binder_restore_priority'
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
   <scratch space>:15:1: note: expanded from here
      15 | __SCK__tp_func_android_vh_rust_binder_restore_priority
         | ^
   drivers/android/binder/rust_binder_hooks.c:29:1: error: use of undeclared identifier '__SCT__tp_func_android_vh_rust_binder_restore_priority'
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
   <scratch space>:22:1: note: expanded from here
      22 | __SCT__tp_func_android_vh_rust_binder_restore_priority
         | ^
>> drivers/android/binder/rust_binder_hooks.c:34:19: error: use of undeclared identifier 'rust_do_trace_android_vh_rust_binder_set_priority'
      34 | EXPORT_SYMBOL_GPL(rust_do_trace_android_vh_rust_binder_set_priority);
         |                   ^
>> drivers/android/binder/rust_binder_hooks.c:35:19: error: use of undeclared identifier 'rust_do_trace_android_vh_rust_binder_restore_priority'
      35 | EXPORT_SYMBOL_GPL(rust_do_trace_android_vh_rust_binder_restore_priority);
         |                   ^
   14 errors generated.


vim +/rust_do_trace_android_vh_rust_binder_set_priority +34 drivers/android/binder/rust_binder_hooks.c

    30	
    31	/*
    32	 * Rust Binder itself calls these methods to trigger the vendor hook.
    33	 */
  > 34	EXPORT_SYMBOL_GPL(rust_do_trace_android_vh_rust_binder_set_priority);
  > 35	EXPORT_SYMBOL_GPL(rust_do_trace_android_vh_rust_binder_restore_priority);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
