Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A90C1B0439
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 21:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766698826; cv=none; b=tEjHrcX3/f7XPgYrm5vbEB/LcbOztsOuwCkEHITUYnonBQyygfO3XKHEXPl/vL1rrjwGBT7lDWc7uxM3obpoEn87HzOL8GSZKP4vxkGiny0GDMm0/KAw/SkfK2ZElT1qfIJwUfC9jfcD6V/11/CH0Fe96SXOVqjfp2nnKr1KtBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766698826; c=relaxed/simple;
	bh=VGQIU2dxB5xdXxxAedLCPp142bcRAzmnrdeH9YXOaE4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fgQIk0v5YE/hFF8YgqWrHGQdC4sgkQEKeuv7j/GQ6q5gfV8daZu/SkZc2f9u/VcizBdfiTOM+ZfDK3wKYUH9EwvRxSShOeRv2E1v4GK0w44CoWmzT5oQiNebL49awaccXLn41+X0Md2FrZu4N9HtLlHYrBpasu9jBQU4R30W/BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UFlEpSTn; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UFlEpSTn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766698824; x=1798234824;
  h=date:from:to:cc:subject:message-id;
  bh=VGQIU2dxB5xdXxxAedLCPp142bcRAzmnrdeH9YXOaE4=;
  b=UFlEpSTnpPbmICho6njXZgr6zmghqOh/Cbgimw5KT0fxAvgfvpi3MHIf
   PBqcyvHGPMdODD+PpIPt0F9OZ4ImxWEW1Pz0lSZe1Pdaw78FINsO1kesN
   y1a1gaCLGuRXCxFJKXhl1NPoW19F8t/3Knf0ISQy67lIjXzjjF9za0LWy
   O1nvjJM4uFc06F525CDWR6viwEoRP84buoBatGR8PD06FB1bpn8la+b2+
   tMxM3q5SvGoBL8y80uL9gxWAdZ79Pp5YAHXyvszzyAmAyAeu17BMwZMVM
   ZwY6SpfqyOuuUnUC7sCqMQlgwoTm1AjqAGDNqG4vLRCPE8+kj7Zc2VctQ
   Q==;
X-CSE-ConnectionGUID: 7CAQubQUQM20G0mwDqoBvg==
X-CSE-MsgGUID: TaSHgX9IRoq1EeYILGUwKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="67679305"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="67679305"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 13:40:22 -0800
X-CSE-ConnectionGUID: CfnrzVRDSHyLmjTWo73sag==
X-CSE-MsgGUID: 7PrcD5ZkRfmZBZEg/BWQNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="237672420"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 25 Dec 2025 13:40:20 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYt4D-000000004Tn-3wCC;
	Thu, 25 Dec 2025 21:40:17 +0000
Date: Fri, 26 Dec 2025 05:40:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13/13]
 include/trace/events/kmem.h:419:10: error: incompatible pointer types passing
 'struct mem_sampling_record *' to parameter of type 'struct
 mem_sampling_record *'
Message-ID: <202512260557.iKOSRQRF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ze,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   52a3b0aa13aa2325ca2caf528fbcaba06ad3bab5
commit: 5c9754d56876f60e199456beda45715da2d1a20b [13/13] mm/mem_sampling: Add eBPF interface for memory access tracing
config: arm64-randconfig-001-20251226 (https://download.01.org/0day-ci/archive/20251226/202512260557.iKOSRQRF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512260557.iKOSRQRF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512260557.iKOSRQRF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/slub.c:46:
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
>> include/trace/events/kmem.h:419:10: error: incompatible pointer types passing 'struct mem_sampling_record *' to parameter of type 'struct mem_sampling_record *' [-Werror,-Wincompatible-pointer-types]
     419 |         TP_ARGS(record),
         |                 ^~~~~~
   include/linux/tracepoint.h:148:26: note: expanded from macro 'TP_ARGS'
     148 | #define TP_ARGS(args...)        args
         |                                 ^~~~
   include/linux/tracepoint.h:566:44: note: expanded from macro 'TRACE_EVENT'
     566 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                                                   ^~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
     107 | #define PARAMS(args...) args
         |                         ^~~~
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/tracepoint.h:217:33: note: expanded from macro '__DO_TRACE'
     217 |                 __DO_TRACE_CALL(name, TP_ARGS(args));                   \
         |                                               ^~~~
   include/linux/tracepoint.h:148:26: note: expanded from macro 'TP_ARGS'
     148 | #define TP_ARGS(args...)        args
         |                                 ^~~~
   include/linux/tracepoint.h:177:62: note: expanded from macro '__DO_TRACE_CALL'
     177 | #define __DO_TRACE_CALL(name, args)     __traceiter_##name(NULL, args)
         |                                                                  ^~~~
   include/trace/events/kmem.h:417:39: note: passing argument to parameter 'record' here
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                                              ^
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
>> include/trace/events/kmem.h:419:10: error: incompatible pointer types passing 'struct mem_sampling_record *' to parameter of type 'struct mem_sampling_record *' [-Werror,-Wincompatible-pointer-types]
     419 |         TP_ARGS(record),
         |                 ^~~~~~
   include/linux/tracepoint.h:148:26: note: expanded from macro 'TP_ARGS'
     148 | #define TP_ARGS(args...)        args
         |                                 ^~~~
   include/linux/tracepoint.h:566:44: note: expanded from macro 'TRACE_EVENT'
     566 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                                                   ^~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
     107 | #define PARAMS(args...) args
         |                         ^~~~
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/tracepoint.h:217:33: note: expanded from macro '__DO_TRACE'
     217 |                 __DO_TRACE_CALL(name, TP_ARGS(args));                   \
         |                                               ^~~~
   include/linux/tracepoint.h:148:26: note: expanded from macro 'TP_ARGS'
     148 | #define TP_ARGS(args...)        args
         |                                 ^~~~
   include/linux/tracepoint.h:177:62: note: expanded from macro '__DO_TRACE_CALL'
     177 | #define __DO_TRACE_CALL(name, args)     __traceiter_##name(NULL, args)
         |                                                                  ^~~~
   include/trace/events/kmem.h:417:39: note: passing argument to parameter 'record' here
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                                              ^
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
   7 warnings and 2 errors generated.
--
   In file included from mm/memory.c:83:
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
>> include/trace/events/kmem.h:419:10: error: incompatible pointer types passing 'struct mem_sampling_record *' to parameter of type 'struct mem_sampling_record *' [-Werror,-Wincompatible-pointer-types]
     419 |         TP_ARGS(record),
         |                 ^~~~~~
   include/linux/tracepoint.h:148:26: note: expanded from macro 'TP_ARGS'
     148 | #define TP_ARGS(args...)        args
         |                                 ^~~~
   include/linux/tracepoint.h:566:44: note: expanded from macro 'TRACE_EVENT'
     566 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                                                   ^~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
     107 | #define PARAMS(args...) args
         |                         ^~~~
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/tracepoint.h:217:33: note: expanded from macro '__DO_TRACE'
     217 |                 __DO_TRACE_CALL(name, TP_ARGS(args));                   \
         |                                               ^~~~
   include/linux/tracepoint.h:148:26: note: expanded from macro 'TP_ARGS'
     148 | #define TP_ARGS(args...)        args
         |                                 ^~~~
   include/linux/tracepoint.h:177:62: note: expanded from macro '__DO_TRACE_CALL'
     177 | #define __DO_TRACE_CALL(name, args)     __traceiter_##name(NULL, args)
         |                                                                  ^~~~
   include/trace/events/kmem.h:417:39: note: passing argument to parameter 'record' here
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                                              ^
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
>> include/trace/events/kmem.h:419:10: error: incompatible pointer types passing 'struct mem_sampling_record *' to parameter of type 'struct mem_sampling_record *' [-Werror,-Wincompatible-pointer-types]
     419 |         TP_ARGS(record),
         |                 ^~~~~~
   include/linux/tracepoint.h:148:26: note: expanded from macro 'TP_ARGS'
     148 | #define TP_ARGS(args...)        args
         |                                 ^~~~
   include/linux/tracepoint.h:566:44: note: expanded from macro 'TRACE_EVENT'
     566 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                                                   ^~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
     107 | #define PARAMS(args...) args
         |                         ^~~~
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/tracepoint.h:217:33: note: expanded from macro '__DO_TRACE'
     217 |                 __DO_TRACE_CALL(name, TP_ARGS(args));                   \
         |                                               ^~~~
   include/linux/tracepoint.h:148:26: note: expanded from macro 'TP_ARGS'
     148 | #define TP_ARGS(args...)        args
         |                                 ^~~~
   include/linux/tracepoint.h:177:62: note: expanded from macro '__DO_TRACE_CALL'
     177 | #define __DO_TRACE_CALL(name, args)     __traceiter_##name(NULL, args)
         |                                                                  ^~~~
   include/trace/events/kmem.h:417:39: note: passing argument to parameter 'record' here
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                                              ^
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
   mm/memory.c:5502:17: warning: variable 'nr_pages' set but not used [-Wunused-but-set-variable]
    5502 |         int flags = 0, nr_pages;
         |                        ^
   8 warnings and 2 errors generated.
--
   In file included from mm/page_alloc.c:41:
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
>> include/trace/events/kmem.h:419:10: error: incompatible pointer types passing 'struct mem_sampling_record *' to parameter of type 'struct mem_sampling_record *' [-Werror,-Wincompatible-pointer-types]
     419 |         TP_ARGS(record),
         |                 ^~~~~~
   include/linux/tracepoint.h:148:26: note: expanded from macro 'TP_ARGS'
     148 | #define TP_ARGS(args...)        args
         |                                 ^~~~
   include/linux/tracepoint.h:566:44: note: expanded from macro 'TRACE_EVENT'
     566 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                                                   ^~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
     107 | #define PARAMS(args...) args
         |                         ^~~~
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/tracepoint.h:217:33: note: expanded from macro '__DO_TRACE'
     217 |                 __DO_TRACE_CALL(name, TP_ARGS(args));                   \
         |                                               ^~~~
   include/linux/tracepoint.h:148:26: note: expanded from macro 'TP_ARGS'
     148 | #define TP_ARGS(args...)        args
         |                                 ^~~~
   include/linux/tracepoint.h:177:62: note: expanded from macro '__DO_TRACE_CALL'
     177 | #define __DO_TRACE_CALL(name, args)     __traceiter_##name(NULL, args)
         |                                                                  ^~~~
   include/trace/events/kmem.h:417:39: note: passing argument to parameter 'record' here
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                                              ^
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
>> include/trace/events/kmem.h:419:10: error: incompatible pointer types passing 'struct mem_sampling_record *' to parameter of type 'struct mem_sampling_record *' [-Werror,-Wincompatible-pointer-types]
     419 |         TP_ARGS(record),
         |                 ^~~~~~
   include/linux/tracepoint.h:148:26: note: expanded from macro 'TP_ARGS'
     148 | #define TP_ARGS(args...)        args
         |                                 ^~~~
   include/linux/tracepoint.h:566:44: note: expanded from macro 'TRACE_EVENT'
     566 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                                                   ^~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
     107 | #define PARAMS(args...) args
         |                         ^~~~
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/tracepoint.h:217:33: note: expanded from macro '__DO_TRACE'
     217 |                 __DO_TRACE_CALL(name, TP_ARGS(args));                   \
         |                                               ^~~~
   include/linux/tracepoint.h:148:26: note: expanded from macro 'TP_ARGS'
     148 | #define TP_ARGS(args...)        args
         |                                 ^~~~
   include/linux/tracepoint.h:177:62: note: expanded from macro '__DO_TRACE_CALL'
     177 | #define __DO_TRACE_CALL(name, args)     __traceiter_##name(NULL, args)
         |                                                                  ^~~~
   include/trace/events/kmem.h:417:39: note: passing argument to parameter 'record' here
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                                              ^
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
   mm/page_alloc.c:4143:9: error: call to undeclared function 'dynamic_pool_should_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4143 |         return dynamic_pool_should_alloc(gfp_mask & ~GFP_RELIABLE, order);
         |                ^
   7 warnings and 3 errors generated.
--
   In file included from mm/slab_common.c:35:
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
>> include/trace/events/kmem.h:419:10: error: incompatible pointer types passing 'struct mem_sampling_record *' to parameter of type 'struct mem_sampling_record *' [-Werror,-Wincompatible-pointer-types]
     419 |         TP_ARGS(record),
         |                 ^~~~~~
   include/linux/tracepoint.h:148:26: note: expanded from macro 'TP_ARGS'
     148 | #define TP_ARGS(args...)        args
         |                                 ^~~~
   include/linux/tracepoint.h:566:44: note: expanded from macro 'TRACE_EVENT'
     566 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                                                   ^~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
     107 | #define PARAMS(args...) args
         |                         ^~~~
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/tracepoint.h:217:33: note: expanded from macro '__DO_TRACE'
     217 |                 __DO_TRACE_CALL(name, TP_ARGS(args));                   \
         |                                               ^~~~
   include/linux/tracepoint.h:148:26: note: expanded from macro 'TP_ARGS'
     148 | #define TP_ARGS(args...)        args
         |                                 ^~~~
   include/linux/tracepoint.h:177:62: note: expanded from macro '__DO_TRACE_CALL'
     177 | #define __DO_TRACE_CALL(name, args)     __traceiter_##name(NULL, args)
         |                                                                  ^~~~
   include/trace/events/kmem.h:417:39: note: passing argument to parameter 'record' here
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                                              ^
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
>> include/trace/events/kmem.h:419:10: error: incompatible pointer types passing 'struct mem_sampling_record *' to parameter of type 'struct mem_sampling_record *' [-Werror,-Wincompatible-pointer-types]
     419 |         TP_ARGS(record),
         |                 ^~~~~~
   include/linux/tracepoint.h:148:26: note: expanded from macro 'TP_ARGS'
     148 | #define TP_ARGS(args...)        args
         |                                 ^~~~
   include/linux/tracepoint.h:566:44: note: expanded from macro 'TRACE_EVENT'
     566 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                                                   ^~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
     107 | #define PARAMS(args...) args
         |                         ^~~~
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/tracepoint.h:217:33: note: expanded from macro '__DO_TRACE'
     217 |                 __DO_TRACE_CALL(name, TP_ARGS(args));                   \
         |                                               ^~~~
   include/linux/tracepoint.h:148:26: note: expanded from macro 'TP_ARGS'
     148 | #define TP_ARGS(args...)        args
         |                                 ^~~~
   include/linux/tracepoint.h:177:62: note: expanded from macro '__DO_TRACE_CALL'
     177 | #define __DO_TRACE_CALL(name, args)     __traceiter_##name(NULL, args)
         |                                                                  ^~~~
   include/trace/events/kmem.h:417:39: note: passing argument to parameter 'record' here
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                                              ^
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
   In file included from mm/slab_common.c:35:
   In file included from include/trace/events/kmem.h:441:
   In file included from include/trace/define_trace.h:95:
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
>> include/trace/events/kmem.h:416:1: error: conflicting types for '__traceiter_mm_spe_record'
     416 | TRACE_EVENT(mm_spe_record,
         | ^
   include/trace/define_trace.h:28:2: note: expanded from macro 'TRACE_EVENT'
      28 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:341:2: note: expanded from macro 'DEFINE_TRACE'
     341 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |         ^
   include/linux/tracepoint.h:305:6: note: expanded from macro 'DEFINE_TRACE_FN'
     305 |         int __traceiter_##_name(void *__data, proto);                   \
         |             ^
   <scratch space>:54:1: note: expanded from here
      54 | __traceiter_mm_spe_record
         | ^
   include/trace/events/kmem.h:416:1: note: previous declaration is here
     416 | TRACE_EVENT(mm_spe_record,
         | ^
   include/linux/tracepoint.h:566:2: note: expanded from macro 'TRACE_EVENT'
     566 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:432:2: note: expanded from macro 'DECLARE_TRACE'
     432 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^
   include/linux/tracepoint.h:252:13: note: expanded from macro '__DECLARE_TRACE'
     252 |         extern int __traceiter_##name(data_proto);                      \
         |                    ^
   <scratch space>:57:1: note: expanded from here
      57 | __traceiter_mm_spe_record
         | ^
   In file included from mm/slab_common.c:35:
   In file included from include/trace/events/kmem.h:441:
   In file included from include/trace/define_trace.h:95:
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
>> include/trace/events/kmem.h:416:1: error: conflicting types for '__traceiter_mm_spe_record'
     416 | TRACE_EVENT(mm_spe_record,
         | ^
   include/trace/define_trace.h:28:2: note: expanded from macro 'TRACE_EVENT'
      28 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:341:2: note: expanded from macro 'DEFINE_TRACE'
     341 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |         ^
   include/linux/tracepoint.h:319:6: note: expanded from macro 'DEFINE_TRACE_FN'
     319 |         int __traceiter_##_name(void *__data, proto)                    \
         |             ^
   <scratch space>:64:1: note: expanded from here
      64 | __traceiter_mm_spe_record
         | ^
   include/trace/events/kmem.h:416:1: note: previous declaration is here
     416 | TRACE_EVENT(mm_spe_record,
         | ^
   include/linux/tracepoint.h:566:2: note: expanded from macro 'TRACE_EVENT'
     566 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:432:2: note: expanded from macro 'DECLARE_TRACE'
     432 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^
   include/linux/tracepoint.h:252:13: note: expanded from macro '__DECLARE_TRACE'
     252 |         extern int __traceiter_##name(data_proto);                      \
         |                    ^
   <scratch space>:57:1: note: expanded from here
      57 | __traceiter_mm_spe_record
         | ^
   In file included from mm/slab_common.c:35:
   In file included from include/trace/events/kmem.h:441:
   In file included from include/trace/define_trace.h:95:
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
   include/trace/events/kmem.h:416:1: error: conflicting types for '__probestub_mm_spe_record'
     416 | TRACE_EVENT(mm_spe_record,
         | ^
   include/trace/define_trace.h:28:2: note: expanded from macro 'TRACE_EVENT'
      28 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:341:2: note: expanded from macro 'DEFINE_TRACE'
     341 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |         ^
   include/linux/tracepoint.h:335:7: note: expanded from macro 'DEFINE_TRACE_FN'
     335 |         void __probestub_##_name(void *__data, proto)                   \
         |              ^
   <scratch space>:75:1: note: expanded from here
      75 | __probestub_mm_spe_record
         | ^
   include/trace/events/kmem.h:416:1: note: previous declaration is here
   include/trace/define_trace.h:28:2: note: expanded from macro 'TRACE_EVENT'
      28 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:341:2: note: expanded from macro 'DEFINE_TRACE'
     341 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |         ^
   include/linux/tracepoint.h:306:7: note: expanded from macro 'DEFINE_TRACE_FN'
     306 |         void __probestub_##_name(void *__data, proto);                  \
         |              ^
   <scratch space>:55:1: note: expanded from here
      55 | __probestub_mm_spe_record
         | ^
   In file included from mm/slab_common.c:35:
   In file included from include/trace/events/kmem.h:441:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:286:
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
   In file included from mm/slab_common.c:35:
   In file included from include/trace/events/kmem.h:441:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:460:
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
>> include/trace/events/kmem.h:419:10: error: incompatible pointer types passing 'struct mem_sampling_record *' to parameter of type 'struct mem_sampling_record *' [-Werror,-Wincompatible-pointer-types]
     419 |         TP_ARGS(record),
         |                 ^~~~~~
   include/linux/tracepoint.h:148:26: note: expanded from macro 'TP_ARGS'
     148 | #define TP_ARGS(args...)        args
         |                                 ^~~~
   include/trace/trace_events.h:42:16: note: expanded from macro 'TRACE_EVENT'
      42 |                              PARAMS(args),                     \
         |                                     ^~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
     107 | #define PARAMS(args...) args
         |                         ^~~~
   include/trace/trace_events.h:427:51: note: expanded from macro 'DECLARE_EVENT_CLASS'
     427 | __DECLARE_EVENT_CLASS(call, PARAMS(proto), PARAMS(args), PARAMS(tstruct), \
         |                                                   ^~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
     107 | #define PARAMS(args...) args
         |                         ^~~~
   include/trace/trace_events.h:410:64: note: expanded from macro '\
   __DECLARE_EVENT_CLASS'
     410 |         __data_size = trace_event_get_offsets_##call(&__data_offsets, args); \
         |                                                                       ^~~~
   include/trace/events/kmem.h:417:39: note: passing argument to parameter 'record' here
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                                              ^
   In file included from mm/slab_common.c:35:
   In file included from include/trace/events/kmem.h:441:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:460:
>> include/trace/events/kmem.h:428:26: error: incomplete definition of type 'struct mem_sampling_record'
     428 |                 __entry->vaddr = record->virt_addr;
         |                                  ~~~~~~^
   include/trace/stages/stage6_event_callback.h:135:33: note: expanded from macro 'TP_fast_assign'
     135 | #define TP_fast_assign(args...) args
         |                                 ^~~~
   include/trace/trace_events.h:44:16: note: expanded from macro 'TRACE_EVENT'
      44 |                              PARAMS(assign),                   \
         |                                     ^~~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
     107 | #define PARAMS(args...) args
         |                         ^~~~
   include/trace/trace_events.h:428:16: note: expanded from macro 'DECLARE_EVENT_CLASS'
     428 |                       PARAMS(assign), PARAMS(print))                    \
         |                              ^~~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
     107 | #define PARAMS(args...) args
         |                         ^~~~
   include/trace/trace_events.h:420:4: note: expanded from macro '\
   __DECLARE_EVENT_CLASS'
     420 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/events/kmem.h:417:18: note: forward declaration of 'struct mem_sampling_record'
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
   include/trace/events/kmem.h:429:26: error: incomplete definition of type 'struct mem_sampling_record'
     429 |                 __entry->paddr = record->phys_addr;
         |                                  ~~~~~~^
   include/trace/stages/stage6_event_callback.h:135:33: note: expanded from macro 'TP_fast_assign'
     135 | #define TP_fast_assign(args...) args
         |                                 ^~~~
   include/trace/trace_events.h:44:16: note: expanded from macro 'TRACE_EVENT'
      44 |                              PARAMS(assign),                   \
         |                                     ^~~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
     107 | #define PARAMS(args...) args
         |                         ^~~~
   include/trace/trace_events.h:428:16: note: expanded from macro 'DECLARE_EVENT_CLASS'
     428 |                       PARAMS(assign), PARAMS(print))                    \
         |                              ^~~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
     107 | #define PARAMS(args...) args
         |                         ^~~~
   include/trace/trace_events.h:420:4: note: expanded from macro '\
   __DECLARE_EVENT_CLASS'
     420 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/events/kmem.h:417:18: note: forward declaration of 'struct mem_sampling_record'
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
   include/trace/events/kmem.h:430:24: error: incomplete definition of type 'struct mem_sampling_record'
     430 |                 __entry->pid = record->context_id;
         |                                ~~~~~~^
   include/trace/stages/stage6_event_callback.h:135:33: note: expanded from macro 'TP_fast_assign'
     135 | #define TP_fast_assign(args...) args
         |                                 ^~~~
   include/trace/trace_events.h:44:16: note: expanded from macro 'TRACE_EVENT'
      44 |                              PARAMS(assign),                   \
         |                                     ^~~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
     107 | #define PARAMS(args...) args
         |                         ^~~~
   include/trace/trace_events.h:428:16: note: expanded from macro 'DECLARE_EVENT_CLASS'
     428 |                       PARAMS(assign), PARAMS(print))                    \
         |                              ^~~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
     107 | #define PARAMS(args...) args
         |                         ^~~~
   include/trace/trace_events.h:420:4: note: expanded from macro '\
   __DECLARE_EVENT_CLASS'
     420 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/events/kmem.h:417:18: note: forward declaration of 'struct mem_sampling_record'
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
>> include/trace/events/kmem.h:419:10: error: incompatible pointer types passing 'struct mem_sampling_record *' to parameter of type 'struct mem_sampling_record *' [-Werror,-Wincompatible-pointer-types]
     419 |         TP_ARGS(record),
         |                 ^~~~~~
   include/linux/tracepoint.h:148:26: note: expanded from macro 'TP_ARGS'
     148 | #define TP_ARGS(args...)        args
         |                                 ^~~~
   include/trace/trace_events.h:42:16: note: expanded from macro 'TRACE_EVENT'
      42 |                              PARAMS(args),                     \
         |                                     ^~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
     107 | #define PARAMS(args...) args
         |                         ^~~~
   include/trace/trace_events.h:432:42: note: expanded from macro 'DECLARE_EVENT_CLASS'
     432 |         do_trace_event_raw_event_##call(__data, args);                  \
         |                                                 ^~~~
   include/trace/events/kmem.h:417:39: note: passing argument to parameter 'record' here
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                                              ^
   include/trace/events/kmem.h:416:1: error: incompatible function pointer types passing 'void (void *, struct mem_sampling_record *)' to parameter of type 'void (*)(void *, struct mem_sampling_record *)' [-Wincompatible-function-pointer-types]
     416 | TRACE_EVENT(mm_spe_record,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     418 | 
     419 |         TP_ARGS(record),
         |         ~~~~~~~~~~~~~~~~
     420 | 
     421 |         TP_STRUCT__entry(
         |         ~~~~~~~~~~~~~~~~~
     422 |                 __field(u64, vaddr)
         |                 ~~~~~~~~~~~~~~~~~~~
     423 |                 __field(u64, paddr)
         |                 ~~~~~~~~~~~~~~~~~~~
     424 |                 __field(int, pid)
         |                 ~~~~~~~~~~~~~~~~~
     425 |         ),
         |         ~~
     426 | 
     427 |         TP_fast_assign(
         |         ~~~~~~~~~~~~~~~
     428 |                 __entry->vaddr = record->virt_addr;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     429 |                 __entry->paddr = record->phys_addr;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     430 |                 __entry->pid = record->context_id;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     431 | 
   include/trace/trace_events.h:46:2: note: expanded from macro 'TRACE_EVENT'
      46 |         DEFINE_EVENT(name, name, PARAMS(proto), PARAMS(args));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:457:35: note: expanded from macro 'DEFINE_EVENT'
     457 |         check_trace_callback_type_##call(trace_event_raw_event_##template); \
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:118:1: note: expanded from here
     118 | trace_event_raw_event_mm_spe_record
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/events/kmem.h:416:1: note: passing argument to parameter 'cb' here
     416 | TRACE_EVENT(mm_spe_record,
         | ^
   include/linux/tracepoint.h:566:2: note: expanded from macro 'TRACE_EVENT'
     566 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:432:2: note: expanded from macro 'DECLARE_TRACE'
     432 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^
   include/linux/tracepoint.h:287:42: note: expanded from macro '__DECLARE_TRACE'
     287 |         check_trace_callback_type_##name(void (*cb)(data_proto))        \
         |                                                 ^
   In file included from mm/slab_common.c:35:
   In file included from include/trace/events/kmem.h:441:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:512:
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
   In file included from mm/slab_common.c:35:
   In file included from include/trace/events/kmem.h:441:
   In file included from include/trace/define_trace.h:103:
   In file included from include/trace/perf.h:75:
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
   include/trace/events/kmem.h:416:1: error: conflicting types for 'perf_trace_mm_spe_record'
     416 | TRACE_EVENT(mm_spe_record,
         | ^
   include/trace/trace_events.h:40:2: note: expanded from macro 'TRACE_EVENT'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ^
   include/trace/perf.h:17:27: note: expanded from macro 'DECLARE_EVENT_CLASS'
      17 | static notrace void                                                     \
         |                                                                         ^
   <scratch space>:93:1: note: expanded from here
      93 | perf_trace_mm_spe_record
         | ^
   include/trace/events/kmem.h:416:1: note: previous declaration is here
     416 | TRACE_EVENT(mm_spe_record,
         | ^
   include/trace/trace_events.h:40:2: note: expanded from macro 'TRACE_EVENT'
      40 |         DECLARE_EVENT_CLASS(name,                              \
         |         ^
   include/trace/trace_events.h:467:72: note: expanded from macro 'DECLARE_EVENT_CLASS'
     467 | #define DECLARE_EVENT_CLASS(call, proto, args, tstruct, assign, print)  \
         |                                                                         ^
   include/trace/trace_events.h:383:2: note: expanded from macro '\
   _TRACE_PERF_PROTO'
     383 |         perf_trace_##call(void *__data, proto);
         |         ^
   <scratch space>:27:1: note: expanded from here
      27 | perf_trace_mm_spe_record
         | ^
   In file included from mm/slab_common.c:35:
   In file included from include/trace/events/kmem.h:441:
   In file included from include/trace/define_trace.h:103:
   In file included from include/trace/perf.h:75:
>> include/trace/events/kmem.h:419:10: error: incompatible pointer types passing 'struct mem_sampling_record *' to parameter of type 'struct mem_sampling_record *' [-Werror,-Wincompatible-pointer-types]
     419 |         TP_ARGS(record),
         |                 ^~~~~~
   include/linux/tracepoint.h:148:26: note: expanded from macro 'TP_ARGS'
     148 | #define TP_ARGS(args...)        args
         |                                 ^~~~
   include/trace/trace_events.h:42:16: note: expanded from macro 'TRACE_EVENT'
      42 |                              PARAMS(args),                     \
         |                                     ^~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
     107 | #define PARAMS(args...) args
         |                         ^~~~
   include/trace/perf.h:31:64: note: expanded from macro 'DECLARE_EVENT_CLASS'
      31 |         __data_size = trace_event_get_offsets_##call(&__data_offsets, args); \
         |                                                                       ^~~~
   include/trace/events/kmem.h:417:39: note: passing argument to parameter 'record' here
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                                              ^
   In file included from mm/slab_common.c:35:
   In file included from include/trace/events/kmem.h:441:
   In file included from include/trace/define_trace.h:103:
   In file included from include/trace/perf.h:75:
>> include/trace/events/kmem.h:428:26: error: incomplete definition of type 'struct mem_sampling_record'
     428 |                 __entry->vaddr = record->virt_addr;
         |                                  ~~~~~~^
   include/trace/stages/stage6_event_callback.h:135:33: note: expanded from macro 'TP_fast_assign'
     135 | #define TP_fast_assign(args...) args
         |                                 ^~~~
   include/trace/trace_events.h:44:16: note: expanded from macro 'TRACE_EVENT'
      44 |                              PARAMS(assign),                   \
         |                                     ^~~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
     107 | #define PARAMS(args...) args
         |                         ^~~~
   include/trace/perf.h:51:4: note: expanded from macro 'DECLARE_EVENT_CLASS'
      51 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/events/kmem.h:417:18: note: forward declaration of 'struct mem_sampling_record'
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
   include/trace/events/kmem.h:429:26: error: incomplete definition of type 'struct mem_sampling_record'
     429 |                 __entry->paddr = record->phys_addr;
         |                                  ~~~~~~^
   include/trace/stages/stage6_event_callback.h:135:33: note: expanded from macro 'TP_fast_assign'
     135 | #define TP_fast_assign(args...) args
         |                                 ^~~~
   include/trace/trace_events.h:44:16: note: expanded from macro 'TRACE_EVENT'
      44 |                              PARAMS(assign),                   \
         |                                     ^~~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
     107 | #define PARAMS(args...) args
         |                         ^~~~
   include/trace/perf.h:51:4: note: expanded from macro 'DECLARE_EVENT_CLASS'
      51 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/events/kmem.h:417:18: note: forward declaration of 'struct mem_sampling_record'
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
   include/trace/events/kmem.h:430:24: error: incomplete definition of type 'struct mem_sampling_record'
     430 |                 __entry->pid = record->context_id;
         |                                ~~~~~~^
   include/trace/stages/stage6_event_callback.h:135:33: note: expanded from macro 'TP_fast_assign'
     135 | #define TP_fast_assign(args...) args
         |                                 ^~~~
   include/trace/trace_events.h:44:16: note: expanded from macro 'TRACE_EVENT'
      44 |                              PARAMS(assign),                   \
         |                                     ^~~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
     107 | #define PARAMS(args...) args
         |                         ^~~~
   include/trace/perf.h:51:4: note: expanded from macro 'DECLARE_EVENT_CLASS'
      51 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/events/kmem.h:417:18: note: forward declaration of 'struct mem_sampling_record'
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
   include/trace/events/kmem.h:416:1: error: incompatible function pointer types passing 'void (void *, struct mem_sampling_record *)' to parameter of type 'void (*)(void *, struct mem_sampling_record *)' [-Wincompatible-function-pointer-types]
     416 | TRACE_EVENT(mm_spe_record,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     418 | 
     419 |         TP_ARGS(record),
         |         ~~~~~~~~~~~~~~~~
     420 | 
     421 |         TP_STRUCT__entry(
         |         ~~~~~~~~~~~~~~~~~
     422 |                 __field(u64, vaddr)
         |                 ~~~~~~~~~~~~~~~~~~~
     423 |                 __field(u64, paddr)
         |                 ~~~~~~~~~~~~~~~~~~~
     424 |                 __field(int, pid)
         |                 ~~~~~~~~~~~~~~~~~
     425 |         ),
         |         ~~
     426 | 
     427 |         TP_fast_assign(
         |         ~~~~~~~~~~~~~~~
     428 |                 __entry->vaddr = record->virt_addr;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     429 |                 __entry->paddr = record->phys_addr;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     430 |                 __entry->pid = record->context_id;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     431 | 
   include/trace/trace_events.h:46:2: note: expanded from macro 'TRACE_EVENT'
      46 |         DEFINE_EVENT(name, name, PARAMS(proto), PARAMS(args));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/perf.h:67:35: note: expanded from macro 'DEFINE_EVENT'
      67 |         check_trace_callback_type_##call(perf_trace_##template);        \
         |                                          ^~~~~~~~~~~~~~~~~~~~~
   <scratch space>:99:1: note: expanded from here
      99 | perf_trace_mm_spe_record
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/events/kmem.h:416:1: note: passing argument to parameter 'cb' here
     416 | TRACE_EVENT(mm_spe_record,
         | ^
   include/linux/tracepoint.h:566:2: note: expanded from macro 'TRACE_EVENT'
     566 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:432:2: note: expanded from macro 'DECLARE_TRACE'
     432 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HALTPOLL_CPUIDLE
   Depends on [n]: CPU_IDLE [=n] && ARCH_CPUIDLE_HALTPOLL [=y] && ARCH_HAS_OPTIMIZED_POLL [=y]
   Selected by [y]:
   - ARM64 [=y]
   WARNING: unmet direct dependencies detected for RESCTRL_FS
   Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
   Selected by [y]:
   - ARM64_MPAM [=y]


vim +419 include/trace/events/kmem.h

   388	
   389		TP_PROTO(struct mm_struct *mm,
   390			int member),
   391	
   392		TP_ARGS(mm, member),
   393	
   394		TP_STRUCT__entry(
   395			__field(unsigned int, mm_id)
   396			__field(unsigned int, curr)
   397			__field(int, member)
   398			__field(long, size)
   399		),
   400	
   401		TP_fast_assign(
   402			__entry->mm_id = mm_ptr_to_hash(mm);
   403			__entry->curr = !!(current->mm == mm);
   404			__entry->member = member;
   405			__entry->size = (mm_counter_sum_positive(mm, member)
   406								<< PAGE_SHIFT);
   407		),
   408	
   409		TP_printk("mm_id=%u curr=%d type=%s size=%ldB",
   410			__entry->mm_id,
   411			__entry->curr,
   412			__print_symbolic(__entry->member, TRACE_MM_PAGES),
   413			__entry->size)
   414		);
   415	#ifdef CONFIG_ARM_SPE_MEM_SAMPLING
 > 416	TRACE_EVENT(mm_spe_record,
   417		TP_PROTO(struct mem_sampling_record *record),
   418	
 > 419		TP_ARGS(record),
   420	
   421		TP_STRUCT__entry(
   422			__field(u64, vaddr)
   423			__field(u64, paddr)
   424			__field(int, pid)
   425		),
   426	
   427		TP_fast_assign(
 > 428			__entry->vaddr = record->virt_addr;
   429			__entry->paddr = record->phys_addr;
   430			__entry->pid = record->context_id;
   431	
   432		),
   433	
   434		TP_printk("vaddr=%llu paddr=%llu pid=%d",
   435			__entry->vaddr, __entry->paddr, __entry->pid)
   436	);
   437	#endif /* CONFIG_ARM_SPE_MEM_SAMPLING */
   438	#endif /* _TRACE_KMEM_H */
   439	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
