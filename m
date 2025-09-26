Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F50E24DFF4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Sep 2025 06:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758868955; cv=none; b=ZPZtAVL0W0EPfgl4UY3S4vEGwM8RI+A182/XidRha65WkdH0i9ZaRqKgQinGecnURNen695eU+yz/UxLuXOTGSR1XqfrIW7ifhkxdNa1dRW+Rr+kSzSp7Mu6i13OBmtkminbWUfwzvu6ZOxA+pWTPkrnHpXejspHECXtWC0/80U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758868955; c=relaxed/simple;
	bh=vY41dDXJeLGV4+fHhjq3PRa4Ya8KnYvwDNNz4zd+JAI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DelvfjuLimBeqGJRWWKFnFMq2CQ7gaZ5vsOYCTcXpRn0mUxzZ6XKn3NBktqavVFdK5KHUryzT9Xao6m30ualolDjv8OdaMlaU7tEkyuRfxxfLxt0b8K0T4To7qWxvVj/QToQ5uadTqqMsLIYSn38I1R5Adqpg5uqccL8fw8RW+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X7I2gokS; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X7I2gokS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758868954; x=1790404954;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vY41dDXJeLGV4+fHhjq3PRa4Ya8KnYvwDNNz4zd+JAI=;
  b=X7I2gokS9ons2pdLE/Gkld+/fC5Rml/fSlyd6Lx8BIVEJKzEs8kGhZfc
   kW0qgVy1IlW0JvIRFMJrhze/XT/E9NWxpZB8AsxE6ukWeU07BPC344zBN
   wWlMQ43J54zAyiWXt7Hje3LnnHRtYKYssZEpKMOe2v91YBwlR1H2BvxGn
   HxyQuufxS4z/aNZQWtoKn8Cv07JkWutm+OqEv7qwI6qxCrWo2IH1Ff9vZ
   tH5e+6fWCj4K2SqnUNsqD/C/ZC2MosIiL5I0NkRyJXLadNyDYTuz0QLrh
   Zr8pT/fsP1r4pL5QBaymw3AAce7XVIy1JapO3SZ3rXdy63TuOvyjQ33ip
   w==;
X-CSE-ConnectionGUID: iZmQwSQaQk6fXV85MmfHdg==
X-CSE-MsgGUID: KbJe+n9eRymuMFCgcsdpmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="48760563"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; 
   d="scan'208";a="48760563"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 23:42:33 -0700
X-CSE-ConnectionGUID: KrLagLVGTUinXjbVlTGWLw==
X-CSE-MsgGUID: g85UY9HFS0WfwRC6Ma31lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; 
   d="scan'208";a="182800458"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 25 Sep 2025 23:42:31 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v22A1-0005yj-1L;
	Fri, 26 Sep 2025 06:42:29 +0000
Date: Fri, 26 Sep 2025 14:42:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2938/2938] include/trace/events/kmem.h:419:10:
 error: incompatible pointer types passing 'struct mem_sampling_record *' to
 parameter of type 'struct mem_sampling_record *'
Message-ID: <202509261405.3ek7Vlax-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   3e16741023a15d92f4be3343cb4d8b508327dda3
commit: 5c9754d56876f60e199456beda45715da2d1a20b [2938/2938] mm/mem_sampling: Add eBPF interface for memory access tracing
config: arm64-randconfig-004-20250926 (https://download.01.org/0day-ci/archive/20250926/202509261405.3ek7Vlax-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project cafc064fc7a96b3979a023ddae1da2b499d6c954)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250926/202509261405.3ek7Vlax-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509261405.3ek7Vlax-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/memory.c:83:
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
>> include/trace/events/kmem.h:419:10: error: incompatible pointer types passing 'struct mem_sampling_record *' to parameter of type 'struct mem_sampling_record *' [-Wincompatible-pointer-types]
     419 |         TP_ARGS(record),
         |                 ^~~~~~
   include/trace/events/kmem.h:417:39: note: passing argument to parameter 'record' here
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                                              ^
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
>> include/trace/events/kmem.h:419:10: error: incompatible pointer types passing 'struct mem_sampling_record *' to parameter of type 'struct mem_sampling_record *' [-Wincompatible-pointer-types]
     419 |         TP_ARGS(record),
         |                 ^~~~~~
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
   In file included from mm/slub.c:46:
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
>> include/trace/events/kmem.h:419:10: error: incompatible pointer types passing 'struct mem_sampling_record *' to parameter of type 'struct mem_sampling_record *' [-Wincompatible-pointer-types]
     419 |         TP_ARGS(record),
         |                 ^~~~~~
   include/trace/events/kmem.h:417:39: note: passing argument to parameter 'record' here
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                                              ^
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
>> include/trace/events/kmem.h:419:10: error: incompatible pointer types passing 'struct mem_sampling_record *' to parameter of type 'struct mem_sampling_record *' [-Wincompatible-pointer-types]
     419 |         TP_ARGS(record),
         |                 ^~~~~~
   include/trace/events/kmem.h:417:39: note: passing argument to parameter 'record' here
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                                              ^
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
   mm/slub.c:2281:15: warning: variable 'partial_slabs' set but not used [-Wunused-but-set-variable]
    2281 |         unsigned int partial_slabs = 0;
         |                      ^
   8 warnings and 2 errors generated.
--
   In file included from mm/slab_common.c:35:
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
>> include/trace/events/kmem.h:419:10: error: incompatible pointer types passing 'struct mem_sampling_record *' to parameter of type 'struct mem_sampling_record *' [-Wincompatible-pointer-types]
     419 |         TP_ARGS(record),
         |                 ^~~~~~
   include/trace/events/kmem.h:417:39: note: passing argument to parameter 'record' here
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                                              ^
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
>> include/trace/events/kmem.h:419:10: error: incompatible pointer types passing 'struct mem_sampling_record *' to parameter of type 'struct mem_sampling_record *' [-Wincompatible-pointer-types]
     419 |         TP_ARGS(record),
         |                 ^~~~~~
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
   <scratch space>:79:1: note: expanded from here
      79 | __traceiter_mm_spe_record
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
   <scratch space>:56:1: note: expanded from here
      56 | __traceiter_mm_spe_record
         | ^
   In file included from mm/slab_common.c:35:
   In file included from include/trace/events/kmem.h:441:
   In file included from include/trace/define_trace.h:95:
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
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
   <scratch space>:89:1: note: expanded from here
      89 | __traceiter_mm_spe_record
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
   <scratch space>:56:1: note: expanded from here
      56 | __traceiter_mm_spe_record
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
   <scratch space>:100:1: note: expanded from here
     100 | __probestub_mm_spe_record
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
   <scratch space>:80:1: note: expanded from here
      80 | __probestub_mm_spe_record
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
>> include/trace/events/kmem.h:419:10: error: incompatible pointer types passing 'struct mem_sampling_record *' to parameter of type 'struct mem_sampling_record *' [-Wincompatible-pointer-types]
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
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
     417 |         TP_PROTO(struct mem_sampling_record *record),
         |                         ^
>> include/trace/events/kmem.h:419:10: error: incompatible pointer types passing 'struct mem_sampling_record *' to parameter of type 'struct mem_sampling_record *' [-Wincompatible-pointer-types]
     419 |         TP_ARGS(record),
         |                 ^~~~~~
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
   <scratch space>:117:1: note: expanded from here
     117 | trace_event_raw_event_mm_spe_record
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
   <scratch space>:95:1: note: expanded from here
      95 | perf_trace_mm_spe_record
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
>> include/trace/events/kmem.h:419:10: error: incompatible pointer types passing 'struct mem_sampling_record *' to parameter of type 'struct mem_sampling_record *' [-Wincompatible-pointer-types]
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
   <scratch space>:101:1: note: expanded from here
     101 | perf_trace_mm_spe_record
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
   416	TRACE_EVENT(mm_spe_record,
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
