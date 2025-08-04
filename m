Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD3B26FA70
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Aug 2025 15:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754322379; cv=none; b=EpAdpO3b9UzD+dq8m+NaWE/zco0OjCNf+oyGhMO0CiWEYOln8HqP5OGSXWyRpTSayeMZYgRUdsY7nD+Vr1A9hAG2gFuMlrP2mwJWnylZa5trLYwY2N86LNW/4tCvyHQzqVn+lLnsXba/jqWBpUkqbhgwUptOQLPECVJ0G49dksA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754322379; c=relaxed/simple;
	bh=M2aGTCDfjjqmmYDNKjNpN4xeuSwj//4geg8JTv/+sJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lKpQSKAjwPEXr8qM5jPuzMhyrb3bJ3EtYksRD/CSNfsAHCZuJO8mpyr7tyclVXOcW4Fm0QQHRWsyR6U+G1DDy6hS/4+t3T5FjUwpjmjRNGRLssNhbEdduckwm2+VOTbPY+wQrjPOjX9H4MLyiOFhGDIRJWPpttZVv1aUedASxVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TIx89BVe; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TIx89BVe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754322375; x=1785858375;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M2aGTCDfjjqmmYDNKjNpN4xeuSwj//4geg8JTv/+sJ8=;
  b=TIx89BVeY3g6QxlduYJJgs7gs8IaR767bP5pGn53xOk3SmQ8HRcv3e1V
   fudSXnjep9YttPvBuniw2zLzwF7EKKXc8x0LjcWElsAl+lWvVHaoNmzfo
   0yFZuBFCYbKW5QCUFIC9uuQuNvClYIanu1nG6JfFiB7V20d2VIL69Ux1r
   bzH5hYnSZ/yFlOmPfVz07oRd5Hb3jA7y6nBuaUoF4AAGkQF7GjhEkwIKs
   b/sw/BJ8AwOXQs9WrFKRlFquT65MOxDnxRHQ1Z2OkmmKbZqJLwgL/x5Kd
   a7DS/2ydvH8BjMXTWp3O/xtG0cKxNK3+w67tFs/vdZFyQPoAyRS+JIXCt
   g==;
X-CSE-ConnectionGUID: o6t8jABvRky+2daaGl+Ybw==
X-CSE-MsgGUID: idzk806qRyWQCdWetPGQXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="56732903"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56732903"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 08:46:15 -0700
X-CSE-ConnectionGUID: 3J7D87z+SNSjM+kbh5e6VQ==
X-CSE-MsgGUID: riMOPsckTCOx7aezPYNWxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="164193904"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 04 Aug 2025 08:46:14 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uixO5-00006j-0Z;
	Mon, 04 Aug 2025 15:46:11 +0000
Date: Mon, 4 Aug 2025 23:45:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2630/2630] include/trace/events/kmem.h:438:1:
 error: conflicting types for '__traceiter_spe_boost_spe_record'
Message-ID: <202508042343.eV7Ma2ft-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e46fbbc0ad301c3517340bf966d39b8493a2ebb0
commit: c99ab2e30089c85721b1d05b616cfb7daacf32d6 [2630/2630] arm-spe: Export boost SPE sampling info via tracefs tracepoint
config: arm64-randconfig-r111-20250803 (https://download.01.org/0day-ci/archive/20250804/202508042343.eV7Ma2ft-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce: (https://download.01.org/0day-ci/archive/20250804/202508042343.eV7Ma2ft-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508042343.eV7Ma2ft-lkp@intel.com/

All errors (new ones prefixed by >>):

           DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
           ^
   include/linux/tracepoint.h:305:6: note: expanded from macro 'DEFINE_TRACE_FN'
           int __traceiter_##_name(void *__data, proto);                   \
               ^
   <scratch space>:127:1: note: expanded from here
   __traceiter_mm_spe_record
   ^
   include/trace/events/kmem.h:416:1: note: previous declaration is here
   TRACE_EVENT(mm_spe_record,
   ^
   include/linux/tracepoint.h:566:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:432:2: note: expanded from macro 'DECLARE_TRACE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:252:13: note: expanded from macro '__DECLARE_TRACE'
           extern int __traceiter_##name(data_proto);                      \
                      ^
   <scratch space>:50:1: note: expanded from here
   __traceiter_mm_spe_record
   ^
   In file included from mm/slab_common.c:35:
   In file included from include/trace/events/kmem.h:529:
   In file included from include/trace/define_trace.h:95:
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
           TP_PROTO(struct mem_sampling_record *record),
                           ^
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
   include/trace/events/kmem.h:416:1: error: conflicting types for '__traceiter_mm_spe_record'
   TRACE_EVENT(mm_spe_record,
   ^
   include/trace/define_trace.h:28:2: note: expanded from macro 'TRACE_EVENT'
           DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:341:2: note: expanded from macro 'DEFINE_TRACE'
           DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
           ^
   include/linux/tracepoint.h:319:6: note: expanded from macro 'DEFINE_TRACE_FN'
           int __traceiter_##_name(void *__data, proto)                    \
               ^
   <scratch space>:137:1: note: expanded from here
   __traceiter_mm_spe_record
   ^
   include/trace/events/kmem.h:416:1: note: previous declaration is here
   TRACE_EVENT(mm_spe_record,
   ^
   include/linux/tracepoint.h:566:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:432:2: note: expanded from macro 'DECLARE_TRACE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:252:13: note: expanded from macro '__DECLARE_TRACE'
           extern int __traceiter_##name(data_proto);                      \
                      ^
   <scratch space>:50:1: note: expanded from here
   __traceiter_mm_spe_record
   ^
   In file included from mm/slab_common.c:35:
   In file included from include/trace/events/kmem.h:529:
   In file included from include/trace/define_trace.h:95:
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
           TP_PROTO(struct mem_sampling_record *record),
                           ^
   include/trace/events/kmem.h:416:1: error: conflicting types for '__probestub_mm_spe_record'
   TRACE_EVENT(mm_spe_record,
   ^
   include/trace/define_trace.h:28:2: note: expanded from macro 'TRACE_EVENT'
           DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:341:2: note: expanded from macro 'DEFINE_TRACE'
           DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
           ^
   include/linux/tracepoint.h:335:7: note: expanded from macro 'DEFINE_TRACE_FN'
           void __probestub_##_name(void *__data, proto)                   \
                ^
   <scratch space>:2:1: note: expanded from here
   __probestub_mm_spe_record
   ^
   include/trace/events/kmem.h:416:1: note: previous declaration is here
   include/trace/define_trace.h:28:2: note: expanded from macro 'TRACE_EVENT'
           DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:341:2: note: expanded from macro 'DEFINE_TRACE'
           DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
           ^
   include/linux/tracepoint.h:306:7: note: expanded from macro 'DEFINE_TRACE_FN'
           void __probestub_##_name(void *__data, proto);                  \
                ^
   <scratch space>:128:1: note: expanded from here
   __probestub_mm_spe_record
   ^
   In file included from mm/slab_common.c:35:
   In file included from include/trace/events/kmem.h:529:
   In file included from include/trace/define_trace.h:95:
   include/trace/events/kmem.h:439:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
           TP_PROTO(struct mem_sampling_record *record),
                           ^
>> include/trace/events/kmem.h:438:1: error: conflicting types for '__traceiter_spe_boost_spe_record'
   TRACE_EVENT(spe_boost_spe_record,
   ^
   include/trace/define_trace.h:28:2: note: expanded from macro 'TRACE_EVENT'
           DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:341:2: note: expanded from macro 'DEFINE_TRACE'
           DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
           ^
   include/linux/tracepoint.h:305:6: note: expanded from macro 'DEFINE_TRACE_FN'
           int __traceiter_##_name(void *__data, proto);                   \
               ^
   <scratch space>:12:1: note: expanded from here
   __traceiter_spe_boost_spe_record
   ^
   include/trace/events/kmem.h:438:1: note: previous declaration is here
   TRACE_EVENT(spe_boost_spe_record,
   ^
   include/linux/tracepoint.h:566:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:432:2: note: expanded from macro 'DECLARE_TRACE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:252:13: note: expanded from macro '__DECLARE_TRACE'
           extern int __traceiter_##name(data_proto);                      \
                      ^
   <scratch space>:5:1: note: expanded from here
   __traceiter_spe_boost_spe_record
   ^
   In file included from mm/slab_common.c:35:
   In file included from include/trace/events/kmem.h:529:
   In file included from include/trace/define_trace.h:95:
   include/trace/events/kmem.h:439:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
           TP_PROTO(struct mem_sampling_record *record),
                           ^
   include/trace/events/kmem.h:439:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
>> include/trace/events/kmem.h:438:1: error: conflicting types for '__traceiter_spe_boost_spe_record'
   TRACE_EVENT(spe_boost_spe_record,
   ^
   include/trace/define_trace.h:28:2: note: expanded from macro 'TRACE_EVENT'
           DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:341:2: note: expanded from macro 'DEFINE_TRACE'
           DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
           ^
   include/linux/tracepoint.h:319:6: note: expanded from macro 'DEFINE_TRACE_FN'
           int __traceiter_##_name(void *__data, proto)                    \
               ^
   <scratch space>:22:1: note: expanded from here
   __traceiter_spe_boost_spe_record
   ^
   include/trace/events/kmem.h:438:1: note: previous declaration is here
   TRACE_EVENT(spe_boost_spe_record,
   ^
   include/linux/tracepoint.h:566:2: note: expanded from macro 'TRACE_EVENT'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:432:2: note: expanded from macro 'DECLARE_TRACE'
           __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
           ^
   include/linux/tracepoint.h:252:13: note: expanded from macro '__DECLARE_TRACE'
           extern int __traceiter_##name(data_proto);                      \
                      ^
   <scratch space>:5:1: note: expanded from here
   __traceiter_spe_boost_spe_record
   ^
   In file included from mm/slab_common.c:35:
   In file included from include/trace/events/kmem.h:529:
   In file included from include/trace/define_trace.h:95:
   include/trace/events/kmem.h:439:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
           TP_PROTO(struct mem_sampling_record *record),
                           ^
>> include/trace/events/kmem.h:438:1: error: conflicting types for '__probestub_spe_boost_spe_record'
   TRACE_EVENT(spe_boost_spe_record,
   ^
   include/trace/define_trace.h:28:2: note: expanded from macro 'TRACE_EVENT'
           DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:341:2: note: expanded from macro 'DEFINE_TRACE'
           DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
           ^
   include/linux/tracepoint.h:335:7: note: expanded from macro 'DEFINE_TRACE_FN'
           void __probestub_##_name(void *__data, proto)                   \
                ^
   <scratch space>:33:1: note: expanded from here
   __probestub_spe_boost_spe_record
   ^
   include/trace/events/kmem.h:438:1: note: previous declaration is here
   include/trace/define_trace.h:28:2: note: expanded from macro 'TRACE_EVENT'
           DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:341:2: note: expanded from macro 'DEFINE_TRACE'
           DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
           ^
   include/linux/tracepoint.h:306:7: note: expanded from macro 'DEFINE_TRACE_FN'
           void __probestub_##_name(void *__data, proto);                  \
                ^
   <scratch space>:13:1: note: expanded from here
   __probestub_spe_boost_spe_record
   ^
   In file included from mm/slab_common.c:35:
   In file included from include/trace/events/kmem.h:529:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:286:
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
           TP_PROTO(struct mem_sampling_record *record),
                           ^
   include/trace/events/kmem.h:439:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
           TP_PROTO(struct mem_sampling_record *record),
                           ^
   In file included from mm/slab_common.c:35:
   In file included from include/trace/events/kmem.h:529:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:460:
   include/trace/events/kmem.h:417:18: warning: declaration of 'struct mem_sampling_record' will not be visible outside of this function [-Wvisibility]
           TP_PROTO(struct mem_sampling_record *record),
                           ^
   include/trace/events/kmem.h:419:10: error: incompatible pointer types passing 'struct mem_sampling_record *' to parameter of type 'struct mem_sampling_record *' [-Werror,-Wincompatible-pointer-types]
           TP_ARGS(record),
                   ^~~~~~
   include/linux/tracepoint.h:148:26: note: expanded from macro 'TP_ARGS'
   #define TP_ARGS(args...)        args
                                   ^~~~
   include/trace/trace_events.h:42:16: note: expanded from macro 'TRACE_EVENT'
                                PARAMS(args),                     \
                                       ^~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
   #define PARAMS(args...) args
                           ^~~~
   include/trace/trace_events.h:427:51: note: expanded from macro 'DECLARE_EVENT_CLASS'
   __DECLARE_EVENT_CLASS(call, PARAMS(proto), PARAMS(args), PARAMS(tstruct), \
                                                     ^~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
   #define PARAMS(args...) args
                           ^~~~
   include/trace/trace_events.h:410:64: note: expanded from macro '\
   __DECLARE_EVENT_CLASS'
           __data_size = trace_event_get_offsets_##call(&__data_offsets, args); \
                                                                         ^~~~
   include/trace/events/kmem.h:417:39: note: passing argument to parameter 'record' here
           TP_PROTO(struct mem_sampling_record *record),
                                                ^
   In file included from mm/slab_common.c:35:
   In file included from include/trace/events/kmem.h:529:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:460:
   include/trace/events/kmem.h:428:26: error: incomplete definition of type 'struct mem_sampling_record'
                   __entry->vaddr = record->virt_addr;
                                    ~~~~~~^
   include/trace/stages/stage6_event_callback.h:135:33: note: expanded from macro 'TP_fast_assign'
   #define TP_fast_assign(args...) args
                                   ^~~~
   include/trace/trace_events.h:44:16: note: expanded from macro 'TRACE_EVENT'
                                PARAMS(assign),                   \
                                       ^~~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
   #define PARAMS(args...) args
                           ^~~~
   include/trace/trace_events.h:428:16: note: expanded from macro 'DECLARE_EVENT_CLASS'
                         PARAMS(assign), PARAMS(print))                    \
                                ^~~~~~
   include/linux/tracepoint.h:107:25: note: expanded from macro 'PARAMS'
   #define PARAMS(args...) args
                           ^~~~
   include/trace/trace_events.h:420:4: note: expanded from macro '\
   __DECLARE_EVENT_CLASS'
           { assign; }                                                     \
             ^~~~~~
   include/trace/events/kmem.h:417:18: note: forward declaration of 'struct mem_sampling_record'
           TP_PROTO(struct mem_sampling_record *record),
                           ^
   include/trace/events/kmem.h:429:26: error: incomplete definition of type 'struct mem_sampling_record'
                   __entry->paddr = record->phys_addr;

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RESCTRL_FS
   Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
   Selected by [y]:
   - ARM64_MPAM [=y]


vim +/__traceiter_spe_boost_spe_record +438 include/trace/events/kmem.h

   437	
 > 438	TRACE_EVENT(spe_boost_spe_record,
   439		TP_PROTO(struct mem_sampling_record *record),
   440	
   441		TP_ARGS(record),
   442	
   443		TP_STRUCT__entry(
   444			__field(u64, boost_spe_pa1)
   445			__field(u64, boost_spe_pa2)
   446			__field(u64, boost_spe_pa3)
   447			__field(u64, boost_spe_pa4)
   448			__field(u64, boost_spe_pa5)
   449			__field(u64, boost_spe_pa6)
   450			__field(u64, boost_spe_pa7)
   451			__field(u64, boost_spe_pa8)
   452		),
   453	
   454		TP_fast_assign(
   455			__entry->boost_spe_pa1 = record->boost_spe_addr[0];
   456			__entry->boost_spe_pa2 = record->boost_spe_addr[1];
   457			__entry->boost_spe_pa3 = record->boost_spe_addr[2];
   458			__entry->boost_spe_pa4 = record->boost_spe_addr[3];
   459			__entry->boost_spe_pa5 = record->boost_spe_addr[4];
   460			__entry->boost_spe_pa6 = record->boost_spe_addr[5];
   461			__entry->boost_spe_pa7 = record->boost_spe_addr[6];
   462			__entry->boost_spe_pa8 = record->boost_spe_addr[7];
   463		),
   464	
   465		TP_printk("boost_spe_addr[0]=0x%llx boost_spe_addr[1]=0x%llx tlb_addr[2]=0x%llx tlb_addr[3]=0x%llx tlb_addr[4]=0x%llx tlb_addr[5]=0x%llx tlb_addr[6]=0x%llx tlb_addr[7]=0x%llx",
   466			__entry->boost_spe_pa1, __entry->boost_spe_pa2,
   467			__entry->boost_spe_pa3, __entry->boost_spe_pa4,
   468			__entry->boost_spe_pa5, __entry->boost_spe_pa6,
   469			__entry->boost_spe_pa7, __entry->boost_spe_pa8)
   470	);
   471	#endif /* CONFIG_ARM_SPE_MEM_SAMPLING */
   472	
   473	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
