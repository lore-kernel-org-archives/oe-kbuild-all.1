Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EC748CFC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Nov 2025 22:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763851571; cv=none; b=RG2GRT6WW66/Zzv7W0V3sOSd+LPXpIuumHyP4LZxPTZRLCRMwOzUi5T5ZTQvwJ62laYMIosJcdWf5XPAeZy8tLiRXPK4asPb/ClFYLG8/M39LmFXodAIDH6jTHNopeoNNjv/E83zt6xCWPCA524Hi4vPB2XBV07zQHy+ITp2zqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763851571; c=relaxed/simple;
	bh=7kQtP14LcZdmpaclGYlsYZK4ooL9c52SWpkiQ9udj4w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=omyM2VDxs9q9ETOPViFu7PBy0264ANefB+5KdDO/nxuF9R1kePblfE3ahM5XuUGwyLK/TybLoWtj37H/w1i4Mc7mE4h6y24sxbxw0jIXrkpw7HsB2QgqAJFwKsA4OQQABm7iTl4i34KJkPaO9aoNTfIBZ3L0eydq3XWHnp7gfEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cUTut3gF; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cUTut3gF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763851569; x=1795387569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7kQtP14LcZdmpaclGYlsYZK4ooL9c52SWpkiQ9udj4w=;
  b=cUTut3gFma5a1Pj3az+Tgeq39qcWMARbGpnSpgCJfG5I4MmAZrJROO1Q
   ScVJaUFEgWIgkyxMls4RGDzSqI5PRJi18V4kTvO4r4PGfJQSE0kHxquf+
   RV3ERHb+Nlez5IBAbsngzLon9zCGHVSZyZV7KP632OZDhBGfRPNRFGd3a
   KHqJjpCVnZ7SDds/15O5jtfLm2klqLFOjz7ihEhNg2V0SCKCG4r1bRZQ2
   gPRo6G7De7VnTWUDZrCJ5pOHkvD82WkhxFCN/EfBOm2jSN99tdb9v+Oj2
   DaIeCZ61Ly8wXzwk+fISZNh9at3zQ8kchBFTmiK9fqQ3eoCri1ZOwrP0P
   g==;
X-CSE-ConnectionGUID: 41yahD6qQDCcx1X2N6mdxQ==
X-CSE-MsgGUID: eL4OJvQDT4uE9HiUIjsmLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="83525611"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="83525611"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 14:46:08 -0800
X-CSE-ConnectionGUID: O8vVvcBjSPa9rHY7V5NqPg==
X-CSE-MsgGUID: 2vNOZ/pqRCuX6+Q1NdiT9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="192241582"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 Nov 2025 14:46:07 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMwMm-0007t1-32;
	Sat, 22 Nov 2025 22:46:04 +0000
Date: Sun, 23 Nov 2025 06:45:52 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3306/3306] include/trace/events/kmem.h:416:1:
 error: incompatible function pointer types passing 'void (void *, struct
 mem_sampling_record *)' to parameter of type 'void (*)(void *, struct
 mem_sampling_record *)'
Message-ID: <202511230641.K6V35Qsp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ze,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ea193ff9f080f6657caa2b5f907d5465ca3147dc
commit: 5c9754d56876f60e199456beda45715da2d1a20b [3306/3306] mm/mem_sampling: Add eBPF interface for memory access tracing
config: arm64-randconfig-003-20251123 (https://download.01.org/0day-ci/archive/20251123/202511230641.K6V35Qsp-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511230641.K6V35Qsp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511230641.K6V35Qsp-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from mm/slub.c:46:
>> include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
>> include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
   include/trace/events/kmem.h:419:10: error: incompatible pointer types passing 'struct mem_sampling_record *' to parameter of type 'struct mem_sampling_record *' [-Wincompatible-pointer-types]
     419 |         TP_ARGS(record),
         |                 ^~~~~~
   include/trace/events/kmem.h:417:39: note: passing argument to parameter 'record' here
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                                              ^
>> include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
   include/trace/events/kmem.h:419:10: error: incompatible pointer types passing 'struct mem_sampling_record *' to parameter of type 'struct mem_sampling_record *' [-Wincompatible-pointer-types]
     419 |         TP_ARGS(record),
         |                 ^~~~~~
   include/trace/events/kmem.h:417:39: note: passing argument to parameter 'record' here
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                                              ^
>> include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
>> include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
>> include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
>> include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
   mm/slub.c:2281:15: warning: variable 'partial_slabs' set but not used [-Wunused-but-set-variable]
    2281 |         unsigned int partial_slabs = 0;
         |                      ^
   8 warnings and 2 errors generated.
--
   In file included from mm/slab_common.c:35:
>> include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
>> include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
   include/trace/events/kmem.h:419:10: error: incompatible pointer types passing 'struct mem_sampling_record *' to parameter of type 'struct mem_sampling_record *' [-Wincompatible-pointer-types]
     419 |         TP_ARGS(record),
         |                 ^~~~~~
   include/trace/events/kmem.h:417:39: note: passing argument to parameter 'record' here
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                                              ^
>> include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
   include/trace/events/kmem.h:419:10: error: incompatible pointer types passing 'struct mem_sampling_record *' to parameter of type 'struct mem_sampling_record *' [-Wincompatible-pointer-types]
     419 |         TP_ARGS(record),
         |                 ^~~~~~
   include/trace/events/kmem.h:417:39: note: passing argument to parameter 'record' here
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                                              ^
>> include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
>> include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
>> include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
>> include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
   In file included from mm/slab_common.c:35:
   In file included from include/trace/events/kmem.h:441:
   In file included from include/trace/define_trace.h:95:
>> include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
   include/trace/events/kmem.h:416:1: error: conflicting types for '__traceiter_mm_spe_record'
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
   <scratch space>:97:1: note: expanded from here
      97 | __traceiter_mm_spe_record
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
   <scratch space>:20:1: note: expanded from here
      20 | __traceiter_mm_spe_record
         | ^
   In file included from mm/slab_common.c:35:
   In file included from include/trace/events/kmem.h:441:
   In file included from include/trace/define_trace.h:95:
>> include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
>> include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
   include/trace/events/kmem.h:416:1: error: conflicting types for '__traceiter_mm_spe_record'
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
   <scratch space>:107:1: note: expanded from here
     107 | __traceiter_mm_spe_record
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
   <scratch space>:20:1: note: expanded from here
      20 | __traceiter_mm_spe_record
         | ^
   In file included from mm/slab_common.c:35:
   In file included from include/trace/events/kmem.h:441:
   In file included from include/trace/define_trace.h:95:
>> include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
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
   <scratch space>:118:1: note: expanded from here
     118 | __probestub_mm_spe_record
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
   <scratch space>:98:1: note: expanded from here
      98 | __probestub_mm_spe_record
         | ^
   In file included from mm/slab_common.c:35:
   In file included from include/trace/events/kmem.h:441:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:286:
>> include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
   In file included from mm/slab_common.c:35:
   In file included from include/trace/events/kmem.h:441:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:460:
>> include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
   include/trace/events/kmem.h:419:10: error: incompatible pointer types passing 'struct mem_sampling_record *' to parameter of type 'struct mem_sampling_record *' [-Wincompatible-pointer-types]
     419 |         TP_ARGS(record),
         |                 ^~~~~~
   include/trace/events/kmem.h:417:39: note: passing argument to parameter 'record' here
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                                              ^
   In file included from mm/slab_common.c:35:
   In file included from include/trace/events/kmem.h:441:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:460:
   include/trace/events/kmem.h:428:26: error: incomplete definition of type 'struct mem_sampling_record'
     428 |                 __entry->vaddr = record->virt_addr;
         |                                  ~~~~~~^
   include/trace/events/kmem.h:417:18: note: forward declaration of 'struct mem_sampling_record'
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
   include/trace/events/kmem.h:429:26: error: incomplete definition of type 'struct mem_sampling_record'
     429 |                 __entry->paddr = record->phys_addr;
         |                                  ~~~~~~^
   include/trace/events/kmem.h:417:18: note: forward declaration of 'struct mem_sampling_record'
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
   include/trace/events/kmem.h:430:24: error: incomplete definition of type 'struct mem_sampling_record'
     430 |                 __entry->pid = record->context_id;
         |                                ~~~~~~^
   include/trace/events/kmem.h:417:18: note: forward declaration of 'struct mem_sampling_record'
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
>> include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
   include/trace/events/kmem.h:419:10: error: incompatible pointer types passing 'struct mem_sampling_record *' to parameter of type 'struct mem_sampling_record *' [-Wincompatible-pointer-types]
     419 |         TP_ARGS(record),
         |                 ^~~~~~
   include/trace/events/kmem.h:417:39: note: passing argument to parameter 'record' here
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                                              ^
>> include/trace/events/kmem.h:416:1: error: incompatible function pointer types passing 'void (void *, struct mem_sampling_record *)' to parameter of type 'void (*)(void *, struct mem_sampling_record *)' [-Wincompatible-function-pointer-types]
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
   <scratch space>:129:1: note: expanded from here
     129 | trace_event_raw_event_mm_spe_record
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
>> include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
   In file included from mm/slab_common.c:35:
   In file included from include/trace/events/kmem.h:441:
   In file included from include/trace/define_trace.h:103:
   In file included from include/trace/perf.h:75:
>> include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
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
   <scratch space>:5:1: note: expanded from here
       5 | perf_trace_mm_spe_record
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
   <scratch space>:57:1: note: expanded from here
      57 | perf_trace_mm_spe_record
         | ^
   In file included from mm/slab_common.c:35:
   In file included from include/trace/events/kmem.h:441:
   In file included from include/trace/define_trace.h:103:
   In file included from include/trace/perf.h:75:
   include/trace/events/kmem.h:419:10: error: incompatible pointer types passing 'struct mem_sampling_record *' to parameter of type 'struct mem_sampling_record *' [-Wincompatible-pointer-types]
     419 |         TP_ARGS(record),
         |                 ^~~~~~
   include/trace/events/kmem.h:417:39: note: passing argument to parameter 'record' here
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                                              ^
   In file included from mm/slab_common.c:35:
   In file included from include/trace/events/kmem.h:441:
   In file included from include/trace/define_trace.h:103:
   In file included from include/trace/perf.h:75:
   include/trace/events/kmem.h:428:26: error: incomplete definition of type 'struct mem_sampling_record'
     428 |                 __entry->vaddr = record->virt_addr;
         |                                  ~~~~~~^
   include/trace/events/kmem.h:417:18: note: forward declaration of 'struct mem_sampling_record'
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
   include/trace/events/kmem.h:429:26: error: incomplete definition of type 'struct mem_sampling_record'
     429 |                 __entry->paddr = record->phys_addr;
         |                                  ~~~~~~^
   include/trace/events/kmem.h:417:18: note: forward declaration of 'struct mem_sampling_record'
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
   include/trace/events/kmem.h:430:24: error: incomplete definition of type 'struct mem_sampling_record'
     430 |                 __entry->pid = record->context_id;
         |                                ~~~~~~^
   include/trace/events/kmem.h:417:18: note: forward declaration of 'struct mem_sampling_record'
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
>> include/trace/events/kmem.h:416:1: error: incompatible function pointer types passing 'void (void *, struct mem_sampling_record *)' to parameter of type 'void (*)(void *, struct mem_sampling_record *)' [-Wincompatible-function-pointer-types]
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
   <scratch space>:11:1: note: expanded from here
      11 | perf_trace_mm_spe_record
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
   include/linux/tracepoint.h:287:42: note: expanded from macro '__DECLARE_TRACE'
     287 |         check_trace_callback_type_##name(void (*cb)(data_proto))        \
         |                                                 ^
   16 warnings and 17 errors generated.
..


vim +416 include/trace/events/kmem.h

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
 > 417		TP_PROTO(struct mem_sampling_record *record),
   418	
   419		TP_ARGS(record),
   420	
   421		TP_STRUCT__entry(
   422			__field(u64, vaddr)
   423			__field(u64, paddr)
   424			__field(int, pid)
   425		),
   426	
   427		TP_fast_assign(
   428			__entry->vaddr = record->virt_addr;
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
