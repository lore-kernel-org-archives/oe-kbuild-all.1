Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494D5BE5E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Jul 2025 19:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751570369; cv=none; b=e6WgJdbVwe1fw6nBXHlTCEFHElMsxpmgROXtuL04uuKgZu4UNHEyWJ3FCz5Ut2+/wKSHrt4b1bDXVD6yAxrzoKGNc/2MC6qjy3G+J3DQjvHqbdBo9Fmr+LDNfwP/+Q6kBM2Gy9fo8pOpmG8uKIPItrRY1V4wPm/+IhPlQgX3EI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751570369; c=relaxed/simple;
	bh=K6k/OAj8bybjyK7CbAoKO3T8dPXdz2AUequ50QqCrns=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uoAHN1mQ/hSZIaktodO51Y83WUI7mHIx5la85beHLfQIdgeoV7KyUcAy/y6fwxAzwvnytUkw5DIGEhuYB5mefVZBsPSZPSmAvTDXqycpbh8G0U2Pg3qDzk4Pl1rKWcb5rBYQXflvGpQfvXalOF/vJgVMTs7XgfbXIExZ8K4HL08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M8gZ1OSW; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M8gZ1OSW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751570368; x=1783106368;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K6k/OAj8bybjyK7CbAoKO3T8dPXdz2AUequ50QqCrns=;
  b=M8gZ1OSWUHik5RT9Glbtw0L9dPfTcG78QkRQnZiX/dXxPO0w1gbOoCbj
   Nlc8ZkG5kBI8EW4y/bHrMc3CMVIVdz7RhEtOxXmoanlGkk1gTEFKdefrF
   CCrLDoz4FYMNaDKodkpg/BDyEyBBcnHgAlHWOXRfcKrRMf6FwufZilWtl
   KE5F/TsxXwrm56lEpggBrabUkjmA7/iqfIzwdg11d5AoE0phD12Zwvjhq
   ScMirtWb219AyxbPLPg5awYDLB2gnlAINugyPOL4xegzXU+lyifQH0fS9
   cEgkuDiiBUyVxdSzTI/CjULMzSobEEms42gi2lQy75pBsfxHU0GcRapAN
   w==;
X-CSE-ConnectionGUID: 5hQdJV0uTxSfGSQMhCCgkw==
X-CSE-MsgGUID: rB/tUH0yRXKZBXAklJkEWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="57683978"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="57683978"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 12:19:27 -0700
X-CSE-ConnectionGUID: OCA63kN+SraNBczjloTNVw==
X-CSE-MsgGUID: UJ0FLRW/Q7ywN3MyEFLQFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="158726409"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Jul 2025 12:19:25 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXPSs-0002vj-39;
	Thu, 03 Jul 2025 19:19:22 +0000
Date: Fri, 4 Jul 2025 03:18:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2455/2455] include/trace/events/kmem.h:428:26:
 error: invalid use of undefined type 'struct mem_sampling_record'
Message-ID: <202507040329.C58KAKhY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   9b85bcf0e6357841885264f42859bec05c9073f4
commit: 5c9754d56876f60e199456beda45715da2d1a20b [2455/2455] mm/mem_sampling: Add eBPF interface for memory access tracing
config: arm64-randconfig-004-20250704 (https://download.01.org/0day-ci/archive/20250704/202507040329.C58KAKhY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507040329.C58KAKhY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507040329.C58KAKhY-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                      ^~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:253:2: note: in expansion of macro 'DECLARE_STATIC_CALL'
     253 |  DECLARE_STATIC_CALL(tp_func_##name, __traceiter_##name); \
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:432:2: note: in expansion of macro '__DECLARE_TRACE'
     432 |  __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),  \
         |  ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:566:2: note: in expansion of macro 'DECLARE_TRACE'
     566 |  DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |  ^~~~~~~~~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
     416 | TRACE_EVENT(mm_spe_record,
         | ^~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/events/kmem.h:441,
                    from mm/slab_common.c:35:
   include/trace/events/kmem.h:417:18: warning: 'struct mem_sampling_record' declared inside parameter list will not be visible outside of this definition or declaration
     417 |  TP_PROTO(struct mem_sampling_record *record),
         |                  ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:261:58: note: in definition of macro 'DECLARE_EVENT_CLASS'
     261 |  struct trace_event_data_offsets_##call *__data_offsets, proto) \
         |                                                          ^~~~~
   include/trace/trace_events.h:41:9: note: in expansion of macro 'PARAMS'
      41 |         PARAMS(proto),         \
         |         ^~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
     416 | TRACE_EVENT(mm_spe_record,
         | ^~~~~~~~~~~
   include/trace/events/kmem.h:417:2: note: in expansion of macro 'TP_PROTO'
     417 |  TP_PROTO(struct mem_sampling_record *record),
         |  ^~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/events/kmem.h:441,
                    from mm/slab_common.c:35:
   include/trace/events/kmem.h:417:18: warning: 'struct mem_sampling_record' declared inside parameter list will not be visible outside of this definition or declaration
     417 |  TP_PROTO(struct mem_sampling_record *record),
         |                  ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:399:47: note: in definition of macro '__DECLARE_EVENT_CLASS'
     399 | do_trace_event_raw_event_##call(void *__data, proto)   \
         |                                               ^~~~~
   include/trace/trace_events.h:427:29: note: in expansion of macro 'PARAMS'
     427 | __DECLARE_EVENT_CLASS(call, PARAMS(proto), PARAMS(args), PARAMS(tstruct), \
         |                             ^~~~~~
   include/trace/trace_events.h:40:2: note: in expansion of macro 'DECLARE_EVENT_CLASS'
      40 |  DECLARE_EVENT_CLASS(name,          \
         |  ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:41:9: note: in expansion of macro 'PARAMS'
      41 |         PARAMS(proto),         \
         |         ^~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
     416 | TRACE_EVENT(mm_spe_record,
         | ^~~~~~~~~~~
   include/trace/events/kmem.h:417:2: note: in expansion of macro 'TP_PROTO'
     417 |  TP_PROTO(struct mem_sampling_record *record),
         |  ^~~~~~~~
   include/trace/events/kmem.h: In function 'do_trace_event_raw_event_mm_spe_record':
   include/trace/events/kmem.h:419:10: error: passing argument 2 of 'trace_event_get_offsets_mm_spe_record' from incompatible pointer type [-Werror=incompatible-pointer-types]
     419 |  TP_ARGS(record),
         |          ^~~~~~
         |          |
         |          struct mem_sampling_record *
   include/trace/trace_events.h:410:64: note: in definition of macro '__DECLARE_EVENT_CLASS'
     410 |  __data_size = trace_event_get_offsets_##call(&__data_offsets, args); \
         |                                                                ^~~~
   include/trace/trace_events.h:427:44: note: in expansion of macro 'PARAMS'
     427 | __DECLARE_EVENT_CLASS(call, PARAMS(proto), PARAMS(args), PARAMS(tstruct), \
         |                                            ^~~~~~
   include/trace/trace_events.h:40:2: note: in expansion of macro 'DECLARE_EVENT_CLASS'
      40 |  DECLARE_EVENT_CLASS(name,          \
         |  ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:42:9: note: in expansion of macro 'PARAMS'
      42 |         PARAMS(args),         \
         |         ^~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
     416 | TRACE_EVENT(mm_spe_record,
         | ^~~~~~~~~~~
   include/trace/events/kmem.h:419:2: note: in expansion of macro 'TP_ARGS'
     419 |  TP_ARGS(record),
         |  ^~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/events/kmem.h:441,
                    from mm/slab_common.c:35:
   include/trace/events/kmem.h:417:39: note: expected 'struct mem_sampling_record *' but argument is of type 'struct mem_sampling_record *'
     417 |  TP_PROTO(struct mem_sampling_record *record),
         |           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/trace/trace_events.h:261:58: note: in definition of macro 'DECLARE_EVENT_CLASS'
     261 |  struct trace_event_data_offsets_##call *__data_offsets, proto) \
         |                                                          ^~~~~
   include/trace/trace_events.h:41:9: note: in expansion of macro 'PARAMS'
      41 |         PARAMS(proto),         \
         |         ^~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
     416 | TRACE_EVENT(mm_spe_record,
         | ^~~~~~~~~~~
   include/trace/events/kmem.h:417:2: note: in expansion of macro 'TP_PROTO'
     417 |  TP_PROTO(struct mem_sampling_record *record),
         |  ^~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/events/kmem.h:441,
                    from mm/slab_common.c:35:
>> include/trace/events/kmem.h:428:26: error: invalid use of undefined type 'struct mem_sampling_record'
     428 |   __entry->vaddr = record->virt_addr;
         |                          ^~
   include/trace/trace_events.h:420:4: note: in definition of macro '__DECLARE_EVENT_CLASS'
     420 |  { assign; }       \
         |    ^~~~~~
   include/trace/trace_events.h:428:9: note: in expansion of macro 'PARAMS'
     428 |         PARAMS(assign), PARAMS(print))   \
         |         ^~~~~~
   include/trace/trace_events.h:40:2: note: in expansion of macro 'DECLARE_EVENT_CLASS'
      40 |  DECLARE_EVENT_CLASS(name,          \
         |  ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:44:9: note: in expansion of macro 'PARAMS'
      44 |         PARAMS(assign),         \
         |         ^~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
     416 | TRACE_EVENT(mm_spe_record,
         | ^~~~~~~~~~~
   include/trace/events/kmem.h:427:2: note: in expansion of macro 'TP_fast_assign'
     427 |  TP_fast_assign(
         |  ^~~~~~~~~~~~~~
   include/trace/events/kmem.h:429:26: error: invalid use of undefined type 'struct mem_sampling_record'
     429 |   __entry->paddr = record->phys_addr;
         |                          ^~
   include/trace/trace_events.h:420:4: note: in definition of macro '__DECLARE_EVENT_CLASS'
     420 |  { assign; }       \
         |    ^~~~~~
   include/trace/trace_events.h:428:9: note: in expansion of macro 'PARAMS'
     428 |         PARAMS(assign), PARAMS(print))   \
         |         ^~~~~~
   include/trace/trace_events.h:40:2: note: in expansion of macro 'DECLARE_EVENT_CLASS'
      40 |  DECLARE_EVENT_CLASS(name,          \
         |  ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:44:9: note: in expansion of macro 'PARAMS'
      44 |         PARAMS(assign),         \
         |         ^~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
     416 | TRACE_EVENT(mm_spe_record,
         | ^~~~~~~~~~~
   include/trace/events/kmem.h:427:2: note: in expansion of macro 'TP_fast_assign'
     427 |  TP_fast_assign(
         |  ^~~~~~~~~~~~~~
   include/trace/events/kmem.h:430:24: error: invalid use of undefined type 'struct mem_sampling_record'
     430 |   __entry->pid = record->context_id;
         |                        ^~
   include/trace/trace_events.h:420:4: note: in definition of macro '__DECLARE_EVENT_CLASS'
     420 |  { assign; }       \
         |    ^~~~~~
   include/trace/trace_events.h:428:9: note: in expansion of macro 'PARAMS'
     428 |         PARAMS(assign), PARAMS(print))   \
         |         ^~~~~~
   include/trace/trace_events.h:40:2: note: in expansion of macro 'DECLARE_EVENT_CLASS'
      40 |  DECLARE_EVENT_CLASS(name,          \
         |  ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:44:9: note: in expansion of macro 'PARAMS'
      44 |         PARAMS(assign),         \
         |         ^~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
     416 | TRACE_EVENT(mm_spe_record,
         | ^~~~~~~~~~~
   include/trace/events/kmem.h:427:2: note: in expansion of macro 'TP_fast_assign'
     427 |  TP_fast_assign(
         |  ^~~~~~~~~~~~~~
   include/trace/events/kmem.h: At top level:
   include/trace/events/kmem.h:417:18: warning: 'struct mem_sampling_record' declared inside parameter list will not be visible outside of this definition or declaration
     417 |  TP_PROTO(struct mem_sampling_record *record),
         |                  ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:430:44: note: in definition of macro 'DECLARE_EVENT_CLASS'
     430 | trace_event_raw_event_##call(void *__data, proto)   \
         |                                            ^~~~~
   include/trace/trace_events.h:41:9: note: in expansion of macro 'PARAMS'
      41 |         PARAMS(proto),         \
         |         ^~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
     416 | TRACE_EVENT(mm_spe_record,
         | ^~~~~~~~~~~
   include/trace/events/kmem.h:417:2: note: in expansion of macro 'TP_PROTO'
     417 |  TP_PROTO(struct mem_sampling_record *record),
         |  ^~~~~~~~
   include/trace/events/kmem.h: In function 'trace_event_raw_event_mm_spe_record':
   include/trace/events/kmem.h:419:10: error: passing argument 2 of 'do_trace_event_raw_event_mm_spe_record' from incompatible pointer type [-Werror=incompatible-pointer-types]
     419 |  TP_ARGS(record),
         |          ^~~~~~
         |          |
         |          struct mem_sampling_record *
   include/trace/trace_events.h:432:42: note: in definition of macro 'DECLARE_EVENT_CLASS'
     432 |  do_trace_event_raw_event_##call(__data, args);   \
         |                                          ^~~~
   include/trace/trace_events.h:42:9: note: in expansion of macro 'PARAMS'
      42 |         PARAMS(args),         \
         |         ^~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
     416 | TRACE_EVENT(mm_spe_record,
         | ^~~~~~~~~~~
   include/trace/events/kmem.h:419:2: note: in expansion of macro 'TP_ARGS'
     419 |  TP_ARGS(record),
         |  ^~~~~~~
   include/trace/events/kmem.h:417:39: note: expected 'struct mem_sampling_record *' but argument is of type 'struct mem_sampling_record *'
     417 |  TP_PROTO(struct mem_sampling_record *record),
         |           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/trace/trace_events.h:399:47: note: in definition of macro '__DECLARE_EVENT_CLASS'
--
         |                                  ^~~~~
   include/trace/trace_events.h:468:25: note: in expansion of macro 'PARAMS'
     468 | _TRACE_PERF_PROTO(call, PARAMS(proto));     \
         |                         ^~~~~~
   include/trace/trace_events.h:40:2: note: in expansion of macro 'DECLARE_EVENT_CLASS'
      40 |  DECLARE_EVENT_CLASS(name,          \
         |  ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:41:9: note: in expansion of macro 'PARAMS'
      41 |         PARAMS(proto),         \
         |         ^~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
     416 | TRACE_EVENT(mm_spe_record,
         | ^~~~~~~~~~~
   include/trace/events/kmem.h:417:2: note: in expansion of macro 'TP_PROTO'
     417 |  TP_PROTO(struct mem_sampling_record *record),
         |  ^~~~~~~~
   In file included from include/trace/define_trace.h:103,
                    from include/trace/events/kmem.h:441,
                    from mm/slab_common.c:35:
   include/trace/events/kmem.h:417:18: warning: 'struct mem_sampling_record' declared inside parameter list will not be visible outside of this definition or declaration
     417 |  TP_PROTO(struct mem_sampling_record *record),
         |                  ^~~~~~~~~~~~~~~~~~~
   include/trace/perf.h:18:33: note: in definition of macro 'DECLARE_EVENT_CLASS'
      18 | perf_trace_##call(void *__data, proto)     \
         |                                 ^~~~~
   include/trace/trace_events.h:41:9: note: in expansion of macro 'PARAMS'
      41 |         PARAMS(proto),         \
         |         ^~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
     416 | TRACE_EVENT(mm_spe_record,
         | ^~~~~~~~~~~
   include/trace/events/kmem.h:417:2: note: in expansion of macro 'TP_PROTO'
     417 |  TP_PROTO(struct mem_sampling_record *record),
         |  ^~~~~~~~
   include/trace/perf.h:18:1: error: conflicting types for 'perf_trace_mm_spe_record'
      18 | perf_trace_##call(void *__data, proto)     \
         | ^~~~~~~~~~~
   include/trace/trace_events.h:40:2: note: in expansion of macro 'DECLARE_EVENT_CLASS'
      40 |  DECLARE_EVENT_CLASS(name,          \
         |  ^~~~~~~~~~~~~~~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
     416 | TRACE_EVENT(mm_spe_record,
         | ^~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/events/kmem.h:441,
                    from mm/slab_common.c:35:
   include/trace/trace_events.h:383:2: note: previous declaration of 'perf_trace_mm_spe_record' was here
     383 |  perf_trace_##call(void *__data, proto);
         |  ^~~~~~~~~~~
   include/trace/trace_events.h:468:1: note: in expansion of macro '_TRACE_PERF_PROTO'
     468 | _TRACE_PERF_PROTO(call, PARAMS(proto));     \
         | ^~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:40:2: note: in expansion of macro 'DECLARE_EVENT_CLASS'
      40 |  DECLARE_EVENT_CLASS(name,          \
         |  ^~~~~~~~~~~~~~~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
     416 | TRACE_EVENT(mm_spe_record,
         | ^~~~~~~~~~~
   In file included from include/trace/define_trace.h:103,
                    from include/trace/events/kmem.h:441,
                    from mm/slab_common.c:35:
   include/trace/events/kmem.h: In function 'perf_trace_mm_spe_record':
   include/trace/events/kmem.h:419:10: error: passing argument 2 of 'trace_event_get_offsets_mm_spe_record' from incompatible pointer type [-Werror=incompatible-pointer-types]
     419 |  TP_ARGS(record),
         |          ^~~~~~
         |          |
         |          struct mem_sampling_record *
   include/trace/perf.h:31:64: note: in definition of macro 'DECLARE_EVENT_CLASS'
      31 |  __data_size = trace_event_get_offsets_##call(&__data_offsets, args); \
         |                                                                ^~~~
   include/trace/trace_events.h:42:9: note: in expansion of macro 'PARAMS'
      42 |         PARAMS(args),         \
         |         ^~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
     416 | TRACE_EVENT(mm_spe_record,
         | ^~~~~~~~~~~
   include/trace/events/kmem.h:419:2: note: in expansion of macro 'TP_ARGS'
     419 |  TP_ARGS(record),
         |  ^~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/events/kmem.h:441,
                    from mm/slab_common.c:35:
   include/trace/events/kmem.h:417:39: note: expected 'struct mem_sampling_record *' but argument is of type 'struct mem_sampling_record *'
     417 |  TP_PROTO(struct mem_sampling_record *record),
         |           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/trace/trace_events.h:261:58: note: in definition of macro 'DECLARE_EVENT_CLASS'
     261 |  struct trace_event_data_offsets_##call *__data_offsets, proto) \
         |                                                          ^~~~~
   include/trace/trace_events.h:41:9: note: in expansion of macro 'PARAMS'
      41 |         PARAMS(proto),         \
         |         ^~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
     416 | TRACE_EVENT(mm_spe_record,
         | ^~~~~~~~~~~
   include/trace/events/kmem.h:417:2: note: in expansion of macro 'TP_PROTO'
     417 |  TP_PROTO(struct mem_sampling_record *record),
         |  ^~~~~~~~
   In file included from include/trace/define_trace.h:103,
                    from include/trace/events/kmem.h:441,
                    from mm/slab_common.c:35:
>> include/trace/events/kmem.h:428:26: error: invalid use of undefined type 'struct mem_sampling_record'
     428 |   __entry->vaddr = record->virt_addr;
         |                          ^~
   include/trace/perf.h:51:4: note: in definition of macro 'DECLARE_EVENT_CLASS'
      51 |  { assign; }       \
         |    ^~~~~~
   include/trace/trace_events.h:44:9: note: in expansion of macro 'PARAMS'
      44 |         PARAMS(assign),         \
         |         ^~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
     416 | TRACE_EVENT(mm_spe_record,
         | ^~~~~~~~~~~
   include/trace/events/kmem.h:427:2: note: in expansion of macro 'TP_fast_assign'
     427 |  TP_fast_assign(
         |  ^~~~~~~~~~~~~~
   include/trace/events/kmem.h:429:26: error: invalid use of undefined type 'struct mem_sampling_record'
     429 |   __entry->paddr = record->phys_addr;
         |                          ^~
   include/trace/perf.h:51:4: note: in definition of macro 'DECLARE_EVENT_CLASS'
      51 |  { assign; }       \
         |    ^~~~~~
   include/trace/trace_events.h:44:9: note: in expansion of macro 'PARAMS'
      44 |         PARAMS(assign),         \
         |         ^~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
     416 | TRACE_EVENT(mm_spe_record,
         | ^~~~~~~~~~~
   include/trace/events/kmem.h:427:2: note: in expansion of macro 'TP_fast_assign'
     427 |  TP_fast_assign(
         |  ^~~~~~~~~~~~~~
   include/trace/events/kmem.h:430:24: error: invalid use of undefined type 'struct mem_sampling_record'
     430 |   __entry->pid = record->context_id;
         |                        ^~
   include/trace/perf.h:51:4: note: in definition of macro 'DECLARE_EVENT_CLASS'
      51 |  { assign; }       \
         |    ^~~~~~
   include/trace/trace_events.h:44:9: note: in expansion of macro 'PARAMS'
      44 |         PARAMS(assign),         \
         |         ^~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
     416 | TRACE_EVENT(mm_spe_record,
         | ^~~~~~~~~~~
   include/trace/events/kmem.h:427:2: note: in expansion of macro 'TP_fast_assign'
     427 |  TP_fast_assign(
         |  ^~~~~~~~~~~~~~
   include/trace/events/kmem.h: In function 'perf_test_probe_mm_spe_record':
   include/trace/perf.h:67:35: error: passing argument 1 of 'check_trace_callback_type_mm_spe_record' from incompatible pointer type [-Werror=incompatible-pointer-types]
      67 |  check_trace_callback_type_##call(perf_trace_##template); \
         |                                   ^~~~~~~~~~~
         |                                   |
         |                                   void (*)(void *, struct mem_sampling_record *)
   include/trace/trace_events.h:46:2: note: in expansion of macro 'DEFINE_EVENT'
      46 |  DEFINE_EVENT(name, name, PARAMS(proto), PARAMS(args));
         |  ^~~~~~~~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
     416 | TRACE_EVENT(mm_spe_record,
         | ^~~~~~~~~~~
   In file included from include/trace/events/kmem.h:9,
                    from mm/slab_common.c:35:
   include/linux/tracepoint.h:287:42: note: expected 'void (*)(void *, struct mem_sampling_record *)' but argument is of type 'void (*)(void *, struct mem_sampling_record *)'
     287 |  check_trace_callback_type_##name(void (*cb)(data_proto)) \
         |                                   ~~~~~~~^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:432:2: note: in expansion of macro '__DECLARE_TRACE'
     432 |  __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),  \
         |  ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:566:2: note: in expansion of macro 'DECLARE_TRACE'
     566 |  DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |  ^~~~~~~~~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
     416 | TRACE_EVENT(mm_spe_record,
         | ^~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/events/kmem.h:441,
                    from mm/slab_common.c:35:
   mm/slab_common.c: At top level:
   include/trace/trace_events.h:383:2: warning: 'perf_trace_mm_spe_record' used but never defined
     383 |  perf_trace_##call(void *__data, proto);
         |  ^~~~~~~~~~~
   include/trace/trace_events.h:468:1: note: in expansion of macro '_TRACE_PERF_PROTO'
     468 | _TRACE_PERF_PROTO(call, PARAMS(proto));     \
         | ^~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:40:2: note: in expansion of macro 'DECLARE_EVENT_CLASS'
      40 |  DECLARE_EVENT_CLASS(name,          \
         |  ^~~~~~~~~~~~~~~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
     416 | TRACE_EVENT(mm_spe_record,
         | ^~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RESCTRL_FS
   Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
   Selected by [y]:
   - ARM64_MPAM [=y]


vim +428 include/trace/events/kmem.h

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
   416	TRACE_EVENT(mm_spe_record,
   417		TP_PROTO(struct mem_sampling_record *record),
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
