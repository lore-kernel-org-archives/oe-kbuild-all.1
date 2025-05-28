Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AADE288C19
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 May 2025 17:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748452596; cv=none; b=IQ+OXmr7Szk4iyj7bknSqUUOsmf2PNlr9ZhpkTpDlr/rA8dJ1/+bEJXXNiI6yyd2MoEyrkXOLNULilKp2n3sziDZJFWJKoysy+lwB5F5d+XVCGXfTLPfdl3lvFNMcVZklbaTYKr4Lo9pIuyZNXO3N8qfv82c6yELPDTKHoM6smg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748452596; c=relaxed/simple;
	bh=p0ydgA1iGBa7iIzBj7XsyHHmjlsb+ljfDcqOzIi4JGA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XFYHXX8/SEYdnDlZfPbkmaKIix/g5FHdWqMpNu8tVC5WkUaNVOOgCxX8fTYBr8/dqluO3HE7D8r3kJYMTZIZ4wIcrCIcV865/cB4BNFcOc3Kt0Mgfuw/Zxw8VGwE+1D8zvENoj3RPCO53Cg6y9xQydnQaPjYIpPPZo5aweolFtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bj4pcosF; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bj4pcosF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748452593; x=1779988593;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p0ydgA1iGBa7iIzBj7XsyHHmjlsb+ljfDcqOzIi4JGA=;
  b=bj4pcosFRT/XfRPS/JbeMRmWF1J9vlXoxtJCdGqC2QTX58Ac6wTisBCh
   HAmIotlSyNXG7CP5aA6oZrFFgehhljea3qNSwDTUPlhUC1eopwiDouyst
   OWTLfGptyUb7Zpx6HNoBvYaRQH44QDJrcmqy4HkrDp6FEsU4sAeIDJgtK
   B+U14hhtp9F+/O1eyy6LSfzCtFYEAVl6gfuV/+I8+uc0ZT1ubyQ+Od53+
   6LpN3BoLEFWJMZPMESv9lMA4SkT5kGlQzDM+9bZqHh67U7DKkhEQvYqF/
   kNUhVXPVC+KJvNwn/mO29YMgm4S2VSPWiMxjmOt2JfLmH3Z054OL9djNN
   A==;
X-CSE-ConnectionGUID: 9mMfXnUCQ8S2aEnUTo/Vww==
X-CSE-MsgGUID: mgCUg99NTZarauCnTK3d5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61842639"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="61842639"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 10:16:33 -0700
X-CSE-ConnectionGUID: xrjUi37JRkeqobJCFplhRQ==
X-CSE-MsgGUID: yeGrFtc1QOWaNNIgmY54tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="143334330"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 May 2025 10:16:31 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKKOD-000Vvq-0L;
	Wed, 28 May 2025 17:16:29 +0000
Date: Thu, 29 May 2025 01:15:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2329/2329] include/trace/events/kmem.h:419:10:
 error: passing argument 2 of '__traceiter_mm_spe_record' from incompatible
 pointer type
Message-ID: <202505290104.80vmONol-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   66b0cef2a959be1562a528e3d8cc260dc3803e61
commit: 5c9754d56876f60e199456beda45715da2d1a20b [2329/2329] mm/mem_sampling: Add eBPF interface for memory access tracing
config: arm64-randconfig-003-20250529 (https://download.01.org/0day-ci/archive/20250529/202505290104.80vmONol-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250529/202505290104.80vmONol-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505290104.80vmONol-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/trace/events/kmem.h:9,
                    from mm/slab_common.c:35:
>> include/trace/events/kmem.h:417:18: warning: 'struct mem_sampling_record' declared inside parameter list will not be visible outside of this definition or declaration
     TP_PROTO(struct mem_sampling_record *record),
                     ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:252:32: note: in definition of macro '__DECLARE_TRACE'
     extern int __traceiter_##name(data_proto);   \
                                   ^~~~~~~~~~
   include/linux/tracepoint.h:434:4: note: in expansion of macro 'PARAMS'
       PARAMS(void *__data, proto))
       ^~~~~~
   include/linux/tracepoint.h:566:2: note: in expansion of macro 'DECLARE_TRACE'
     DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
     ^~~~~~~~~~~~~
   include/linux/tracepoint.h:566:22: note: in expansion of macro 'PARAMS'
     DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
                         ^~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(mm_spe_record,
    ^~~~~~~~~~~
   include/trace/events/kmem.h:417:2: note: in expansion of macro 'TP_PROTO'
     TP_PROTO(struct mem_sampling_record *record),
     ^~~~~~~~
>> include/trace/events/kmem.h:417:18: warning: 'struct mem_sampling_record' declared inside parameter list will not be visible outside of this definition or declaration
     TP_PROTO(struct mem_sampling_record *record),
                     ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:255:34: note: in definition of macro '__DECLARE_TRACE'
     static inline void trace_##name(proto)    \
                                     ^~~~~
   include/linux/tracepoint.h:432:24: note: in expansion of macro 'PARAMS'
     __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),  \
                           ^~~~~~
   include/linux/tracepoint.h:566:2: note: in expansion of macro 'DECLARE_TRACE'
     DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
     ^~~~~~~~~~~~~
   include/linux/tracepoint.h:566:22: note: in expansion of macro 'PARAMS'
     DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
                         ^~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(mm_spe_record,
    ^~~~~~~~~~~
   include/trace/events/kmem.h:417:2: note: in expansion of macro 'TP_PROTO'
     TP_PROTO(struct mem_sampling_record *record),
     ^~~~~~~~
   include/trace/events/kmem.h: In function 'trace_mm_spe_record':
>> include/trace/events/kmem.h:419:10: error: passing argument 2 of '__traceiter_mm_spe_record' from incompatible pointer type [-Werror=incompatible-pointer-types]
     TP_ARGS(record),
             ^~~~~~
   include/linux/tracepoint.h:177:62: note: in definition of macro '__DO_TRACE_CALL'
    #define __DO_TRACE_CALL(name, args) __traceiter_##name(NULL, args)
                                                                 ^~~~
   include/linux/tracepoint.h:217:25: note: in expansion of macro 'TP_ARGS'
      __DO_TRACE_CALL(name, TP_ARGS(args));   \
                            ^~~~~~~
   include/linux/tracepoint.h:258:4: note: in expansion of macro '__DO_TRACE'
       __DO_TRACE(name,    \
       ^~~~~~~~~~
   include/linux/tracepoint.h:259:5: note: in expansion of macro 'TP_ARGS'
        TP_ARGS(args),    \
        ^~~~~~~
   include/linux/tracepoint.h:432:2: note: in expansion of macro '__DECLARE_TRACE'
     __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),  \
     ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:432:39: note: in expansion of macro 'PARAMS'
     __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),  \
                                          ^~~~~~
   include/linux/tracepoint.h:566:2: note: in expansion of macro 'DECLARE_TRACE'
     DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
     ^~~~~~~~~~~~~
   include/linux/tracepoint.h:566:37: note: in expansion of macro 'PARAMS'
     DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
                                        ^~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(mm_spe_record,
    ^~~~~~~~~~~
   include/trace/events/kmem.h:419:2: note: in expansion of macro 'TP_ARGS'
     TP_ARGS(record),
     ^~~~~~~
   include/trace/events/kmem.h:417:39: note: expected 'struct mem_sampling_record *' but argument is of type 'struct mem_sampling_record *'
     TP_PROTO(struct mem_sampling_record *record),
              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/linux/tracepoint.h:252:32: note: in definition of macro '__DECLARE_TRACE'
     extern int __traceiter_##name(data_proto);   \
                                   ^~~~~~~~~~
   include/linux/tracepoint.h:434:4: note: in expansion of macro 'PARAMS'
       PARAMS(void *__data, proto))
       ^~~~~~
   include/linux/tracepoint.h:566:2: note: in expansion of macro 'DECLARE_TRACE'
     DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
     ^~~~~~~~~~~~~
   include/linux/tracepoint.h:566:22: note: in expansion of macro 'PARAMS'
     DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
                         ^~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(mm_spe_record,
    ^~~~~~~~~~~
   include/trace/events/kmem.h:417:2: note: in expansion of macro 'TP_PROTO'
     TP_PROTO(struct mem_sampling_record *record),
     ^~~~~~~~
   include/trace/events/kmem.h: At top level:
>> include/trace/events/kmem.h:417:18: warning: 'struct mem_sampling_record' declared inside parameter list will not be visible outside of this definition or declaration
     TP_PROTO(struct mem_sampling_record *record),
                     ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:229:44: note: in definition of macro '__DECLARE_TRACE_RCU'
     static inline void trace_##name##_rcuidle(proto)  \
                                               ^~~~~
   include/linux/tracepoint.h:265:28: note: in expansion of macro 'PARAMS'
     __DECLARE_TRACE_RCU(name, PARAMS(proto), PARAMS(args),  \
                               ^~~~~~
   include/linux/tracepoint.h:432:2: note: in expansion of macro '__DECLARE_TRACE'
     __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),  \
     ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:432:24: note: in expansion of macro 'PARAMS'
     __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),  \
                           ^~~~~~
   include/linux/tracepoint.h:566:2: note: in expansion of macro 'DECLARE_TRACE'
     DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
     ^~~~~~~~~~~~~
   include/linux/tracepoint.h:566:22: note: in expansion of macro 'PARAMS'
     DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
                         ^~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(mm_spe_record,
    ^~~~~~~~~~~
   include/trace/events/kmem.h:417:2: note: in expansion of macro 'TP_PROTO'
     TP_PROTO(struct mem_sampling_record *record),
     ^~~~~~~~
   include/trace/events/kmem.h: In function 'trace_mm_spe_record_rcuidle':
>> include/trace/events/kmem.h:419:10: error: passing argument 2 of '__traceiter_mm_spe_record' from incompatible pointer type [-Werror=incompatible-pointer-types]
     TP_ARGS(record),
             ^~~~~~
   include/linux/tracepoint.h:177:62: note: in definition of macro '__DO_TRACE_CALL'
    #define __DO_TRACE_CALL(name, args) __traceiter_##name(NULL, args)
                                                                 ^~~~
   include/linux/tracepoint.h:217:25: note: in expansion of macro 'TP_ARGS'
      __DO_TRACE_CALL(name, TP_ARGS(args));   \
                            ^~~~~~~
   include/linux/tracepoint.h:232:4: note: in expansion of macro '__DO_TRACE'
       __DO_TRACE(name,    \
       ^~~~~~~~~~
   include/linux/tracepoint.h:233:5: note: in expansion of macro 'TP_ARGS'
        TP_ARGS(args),    \
        ^~~~~~~
   include/linux/tracepoint.h:265:2: note: in expansion of macro '__DECLARE_TRACE_RCU'
     __DECLARE_TRACE_RCU(name, PARAMS(proto), PARAMS(args),  \
     ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:265:43: note: in expansion of macro 'PARAMS'
     __DECLARE_TRACE_RCU(name, PARAMS(proto), PARAMS(args),  \
                                              ^~~~~~
   include/linux/tracepoint.h:432:2: note: in expansion of macro '__DECLARE_TRACE'
     __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),  \
     ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:432:39: note: in expansion of macro 'PARAMS'
     __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),  \
                                          ^~~~~~
   include/linux/tracepoint.h:566:2: note: in expansion of macro 'DECLARE_TRACE'
     DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
     ^~~~~~~~~~~~~
   include/linux/tracepoint.h:566:37: note: in expansion of macro 'PARAMS'
     DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
                                        ^~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(mm_spe_record,
    ^~~~~~~~~~~
   include/trace/events/kmem.h:419:2: note: in expansion of macro 'TP_ARGS'
     TP_ARGS(record),
     ^~~~~~~
   include/trace/events/kmem.h:417:39: note: expected 'struct mem_sampling_record *' but argument is of type 'struct mem_sampling_record *'
     TP_PROTO(struct mem_sampling_record *record),
              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/linux/tracepoint.h:252:32: note: in definition of macro '__DECLARE_TRACE'
     extern int __traceiter_##name(data_proto);   \
                                   ^~~~~~~~~~
   include/linux/tracepoint.h:434:4: note: in expansion of macro 'PARAMS'
       PARAMS(void *__data, proto))
       ^~~~~~
   include/linux/tracepoint.h:566:2: note: in expansion of macro 'DECLARE_TRACE'
     DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
     ^~~~~~~~~~~~~
   include/linux/tracepoint.h:566:22: note: in expansion of macro 'PARAMS'
     DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
                         ^~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(mm_spe_record,
    ^~~~~~~~~~~
   include/trace/events/kmem.h:417:2: note: in expansion of macro 'TP_PROTO'
     TP_PROTO(struct mem_sampling_record *record),
     ^~~~~~~~
   include/trace/events/kmem.h: At top level:
>> include/trace/events/kmem.h:417:18: warning: 'struct mem_sampling_record' declared inside parameter list will not be visible outside of this definition or declaration
     TP_PROTO(struct mem_sampling_record *record),
                     ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:268:38: note: in definition of macro '__DECLARE_TRACE'
     register_trace_##name(void (*probe)(data_proto), void *data) \
                                         ^~~~~~~~~~
   include/linux/tracepoint.h:434:4: note: in expansion of macro 'PARAMS'
       PARAMS(void *__data, proto))
       ^~~~~~
   include/linux/tracepoint.h:566:2: note: in expansion of macro 'DECLARE_TRACE'
     DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
     ^~~~~~~~~~~~~
   include/linux/tracepoint.h:566:22: note: in expansion of macro 'PARAMS'
     DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
                         ^~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(mm_spe_record,
    ^~~~~~~~~~~
   include/trace/events/kmem.h:417:2: note: in expansion of macro 'TP_PROTO'
     TP_PROTO(struct mem_sampling_record *record),
     ^~~~~~~~
>> include/trace/events/kmem.h:417:18: warning: 'struct mem_sampling_record' declared inside parameter list will not be visible outside of this definition or declaration
     TP_PROTO(struct mem_sampling_record *record),
                     ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:274:43: note: in definition of macro '__DECLARE_TRACE'
     register_trace_prio_##name(void (*probe)(data_proto), void *data,\
                                              ^~~~~~~~~~
   include/linux/tracepoint.h:434:4: note: in expansion of macro 'PARAMS'
       PARAMS(void *__data, proto))
       ^~~~~~
   include/linux/tracepoint.h:566:2: note: in expansion of macro 'DECLARE_TRACE'
     DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
     ^~~~~~~~~~~~~
   include/linux/tracepoint.h:566:22: note: in expansion of macro 'PARAMS'
     DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
                         ^~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(mm_spe_record,
    ^~~~~~~~~~~
   include/trace/events/kmem.h:417:2: note: in expansion of macro 'TP_PROTO'
     TP_PROTO(struct mem_sampling_record *record),
     ^~~~~~~~
>> include/trace/events/kmem.h:417:18: warning: 'struct mem_sampling_record' declared inside parameter list will not be visible outside of this definition or declaration
     TP_PROTO(struct mem_sampling_record *record),
                     ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:281:40: note: in definition of macro '__DECLARE_TRACE'
     unregister_trace_##name(void (*probe)(data_proto), void *data) \
                                           ^~~~~~~~~~
   include/linux/tracepoint.h:434:4: note: in expansion of macro 'PARAMS'
       PARAMS(void *__data, proto))
       ^~~~~~
   include/linux/tracepoint.h:566:2: note: in expansion of macro 'DECLARE_TRACE'
     DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
     ^~~~~~~~~~~~~
   include/linux/tracepoint.h:566:22: note: in expansion of macro 'PARAMS'
     DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
                         ^~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(mm_spe_record,
    ^~~~~~~~~~~
   include/trace/events/kmem.h:417:2: note: in expansion of macro 'TP_PROTO'
     TP_PROTO(struct mem_sampling_record *record),
     ^~~~~~~~
>> include/trace/events/kmem.h:417:18: warning: 'struct mem_sampling_record' declared inside parameter list will not be visible outside of this definition or declaration
     TP_PROTO(struct mem_sampling_record *record),
                     ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:287:46: note: in definition of macro '__DECLARE_TRACE'
     check_trace_callback_type_##name(void (*cb)(data_proto)) \
                                                 ^~~~~~~~~~
   include/linux/tracepoint.h:434:4: note: in expansion of macro 'PARAMS'
       PARAMS(void *__data, proto))
       ^~~~~~
   include/linux/tracepoint.h:566:2: note: in expansion of macro 'DECLARE_TRACE'
     DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
     ^~~~~~~~~~~~~
   include/linux/tracepoint.h:566:22: note: in expansion of macro 'PARAMS'
     DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
                         ^~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(mm_spe_record,
    ^~~~~~~~~~~
   include/trace/events/kmem.h:417:2: note: in expansion of macro 'TP_PROTO'
     TP_PROTO(struct mem_sampling_record *record),
     ^~~~~~~~
>> include/trace/events/kmem.h:417:18: warning: 'struct mem_sampling_record' declared inside parameter list will not be visible outside of this definition or declaration
     TP_PROTO(struct mem_sampling_record *record),
                     ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:305:40: note: in definition of macro 'DEFINE_TRACE_FN'
     int __traceiter_##_name(void *__data, proto);   \
                                           ^~~~~
   include/linux/tracepoint.h:341:36: note: in expansion of macro 'PARAMS'
     DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
                                       ^~~~~~
   include/trace/define_trace.h:28:2: note: in expansion of macro 'DEFINE_TRACE'
     DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
     ^~~~~~~~~~~~
   include/trace/define_trace.h:28:21: note: in expansion of macro 'PARAMS'
     DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
                        ^~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(mm_spe_record,
    ^~~~~~~~~~~
   include/trace/events/kmem.h:417:2: note: in expansion of macro 'TP_PROTO'
     TP_PROTO(struct mem_sampling_record *record),
     ^~~~~~~~
>> include/linux/tracepoint.h:305:6: error: conflicting types for '__traceiter_mm_spe_record'
     int __traceiter_##_name(void *__data, proto);   \
         ^~~~~~~~~~~~
   include/linux/tracepoint.h:341:2: note: in expansion of macro 'DEFINE_TRACE_FN'
     DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
     ^~~~~~~~~~~~~~~
   include/trace/define_trace.h:28:2: note: in expansion of macro 'DEFINE_TRACE'
     DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
     ^~~~~~~~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(mm_spe_record,
    ^~~~~~~~~~~
   include/linux/tracepoint.h:252:13: note: previous declaration of '__traceiter_mm_spe_record' was here
     extern int __traceiter_##name(data_proto);   \
                ^~~~~~~~~~~~
   include/linux/tracepoint.h:432:2: note: in expansion of macro '__DECLARE_TRACE'
     __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),  \
     ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:566:2: note: in expansion of macro 'DECLARE_TRACE'
     DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
     ^~~~~~~~~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(mm_spe_record,
    ^~~~~~~~~~~
>> include/trace/events/kmem.h:417:18: warning: 'struct mem_sampling_record' declared inside parameter list will not be visible outside of this definition or declaration
     TP_PROTO(struct mem_sampling_record *record),
                     ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:306:41: note: in definition of macro 'DEFINE_TRACE_FN'
     void __probestub_##_name(void *__data, proto);   \
                                            ^~~~~
   include/linux/tracepoint.h:341:36: note: in expansion of macro 'PARAMS'
     DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
                                       ^~~~~~
   include/trace/define_trace.h:28:2: note: in expansion of macro 'DEFINE_TRACE'
     DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
     ^~~~~~~~~~~~
   include/trace/define_trace.h:28:21: note: in expansion of macro 'PARAMS'
     DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
                        ^~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(mm_spe_record,
    ^~~~~~~~~~~
   include/trace/events/kmem.h:417:2: note: in expansion of macro 'TP_PROTO'
     TP_PROTO(struct mem_sampling_record *record),
     ^~~~~~~~
>> include/trace/events/kmem.h:417:18: warning: 'struct mem_sampling_record' declared inside parameter list will not be visible outside of this definition or declaration
     TP_PROTO(struct mem_sampling_record *record),
                     ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:319:40: note: in definition of macro 'DEFINE_TRACE_FN'
     int __traceiter_##_name(void *__data, proto)   \
                                           ^~~~~
   include/linux/tracepoint.h:341:36: note: in expansion of macro 'PARAMS'
     DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
                                       ^~~~~~
   include/trace/define_trace.h:28:2: note: in expansion of macro 'DEFINE_TRACE'
     DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
     ^~~~~~~~~~~~
   include/trace/define_trace.h:28:21: note: in expansion of macro 'PARAMS'
     DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
                        ^~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(mm_spe_record,
    ^~~~~~~~~~~
   include/trace/events/kmem.h:417:2: note: in expansion of macro 'TP_PROTO'
     TP_PROTO(struct mem_sampling_record *record),
     ^~~~~~~~
   include/linux/tracepoint.h:319:6: error: conflicting types for '__traceiter_mm_spe_record'
     int __traceiter_##_name(void *__data, proto)   \
         ^~~~~~~~~~~~
   include/linux/tracepoint.h:341:2: note: in expansion of macro 'DEFINE_TRACE_FN'
     DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
     ^~~~~~~~~~~~~~~
   include/trace/define_trace.h:28:2: note: in expansion of macro 'DEFINE_TRACE'
     DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
     ^~~~~~~~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(mm_spe_record,
    ^~~~~~~~~~~
   include/linux/tracepoint.h:252:13: note: previous declaration of '__traceiter_mm_spe_record' was here
     extern int __traceiter_##name(data_proto);   \
                ^~~~~~~~~~~~
   include/linux/tracepoint.h:432:2: note: in expansion of macro '__DECLARE_TRACE'
     __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),  \
     ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:566:2: note: in expansion of macro 'DECLARE_TRACE'
     DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
     ^~~~~~~~~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(mm_spe_record,
    ^~~~~~~~~~~
>> include/trace/events/kmem.h:417:18: warning: 'struct mem_sampling_record' declared inside parameter list will not be visible outside of this definition or declaration
     TP_PROTO(struct mem_sampling_record *record),
                     ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:335:41: note: in definition of macro 'DEFINE_TRACE_FN'
     void __probestub_##_name(void *__data, proto)   \
                                            ^~~~~
   include/linux/tracepoint.h:341:36: note: in expansion of macro 'PARAMS'
     DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
                                       ^~~~~~
   include/trace/define_trace.h:28:2: note: in expansion of macro 'DEFINE_TRACE'
     DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
     ^~~~~~~~~~~~
   include/trace/define_trace.h:28:21: note: in expansion of macro 'PARAMS'
     DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
                        ^~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(mm_spe_record,
    ^~~~~~~~~~~
   include/trace/events/kmem.h:417:2: note: in expansion of macro 'TP_PROTO'
     TP_PROTO(struct mem_sampling_record *record),
     ^~~~~~~~
>> include/linux/tracepoint.h:335:7: error: conflicting types for '__probestub_mm_spe_record'
     void __probestub_##_name(void *__data, proto)   \
          ^~~~~~~~~~~~
   include/linux/tracepoint.h:341:2: note: in expansion of macro 'DEFINE_TRACE_FN'
     DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
     ^~~~~~~~~~~~~~~
   include/trace/define_trace.h:28:2: note: in expansion of macro 'DEFINE_TRACE'
     DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
     ^~~~~~~~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(mm_spe_record,
    ^~~~~~~~~~~
   include/linux/tracepoint.h:306:7: note: previous declaration of '__probestub_mm_spe_record' was here
     void __probestub_##_name(void *__data, proto);   \
          ^~~~~~~~~~~~
   include/linux/tracepoint.h:341:2: note: in expansion of macro 'DEFINE_TRACE_FN'
     DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
     ^~~~~~~~~~~~~~~
   include/trace/define_trace.h:28:2: note: in expansion of macro 'DEFINE_TRACE'
     DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
     ^~~~~~~~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(mm_spe_record,
    ^~~~~~~~~~~
   In file included from <command-line>:
>> include/linux/static_call_types.h:15:34: error: conflicting types for '__SCT__tp_func_mm_spe_record'
    #define STATIC_CALL_TRAMP_PREFIX __SCT__
                                     ^~~~~~~
   include/linux/compiler_types.h:74:23: note: in definition of macro '___PASTE'
    #define ___PASTE(a,b) a##b
                          ^
   include/linux/static_call_types.h:18:34: note: in expansion of macro '__PASTE'
    #define STATIC_CALL_TRAMP(name)  __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
                                     ^~~~~~~
   include/linux/static_call_types.h:18:42: note: in expansion of macro 'STATIC_CALL_TRAMP_PREFIX'
    #define STATIC_CALL_TRAMP(name)  __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
                                             ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:39:22: note: in expansion of macro 'STATIC_CALL_TRAMP'
     extern typeof(func) STATIC_CALL_TRAMP(name);
                         ^~~~~~~~~~~~~~~~~
   include/linux/static_call.h:298:2: note: in expansion of macro 'DECLARE_STATIC_CALL'
     DECLARE_STATIC_CALL(name, _func);    \
     ^~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:304:2: note: in expansion of macro '__DEFINE_STATIC_CALL'
     __DEFINE_STATIC_CALL(name, _func, _func)
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:338:2: note: in expansion of macro 'DEFINE_STATIC_CALL'
     DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);
     ^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:341:2: note: in expansion of macro 'DEFINE_TRACE_FN'
     DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
     ^~~~~~~~~~~~~~~
   include/trace/define_trace.h:28:2: note: in expansion of macro 'DEFINE_TRACE'
     DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
     ^~~~~~~~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(mm_spe_record,
    ^~~~~~~~~~~
   include/linux/static_call_types.h:15:34: note: previous declaration of '__SCT__tp_func_mm_spe_record' was here
    #define STATIC_CALL_TRAMP_PREFIX __SCT__
                                     ^~~~~~~
   include/linux/compiler_types.h:74:23: note: in definition of macro '___PASTE'
    #define ___PASTE(a,b) a##b
                          ^
   include/linux/static_call_types.h:18:34: note: in expansion of macro '__PASTE'
    #define STATIC_CALL_TRAMP(name)  __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
                                     ^~~~~~~
   include/linux/static_call_types.h:18:42: note: in expansion of macro 'STATIC_CALL_TRAMP_PREFIX'
    #define STATIC_CALL_TRAMP(name)  __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
                                             ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:39:22: note: in expansion of macro 'STATIC_CALL_TRAMP'
     extern typeof(func) STATIC_CALL_TRAMP(name);
                         ^~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:253:2: note: in expansion of macro 'DECLARE_STATIC_CALL'
     DECLARE_STATIC_CALL(tp_func_##name, __traceiter_##name); \
     ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:432:2: note: in expansion of macro '__DECLARE_TRACE'
     __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),  \
     ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:566:2: note: in expansion of macro 'DECLARE_TRACE'
     DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
     ^~~~~~~~~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(mm_spe_record,
    ^~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/events/kmem.h:441,
                    from mm/slab_common.c:35:
>> include/trace/events/kmem.h:417:18: warning: 'struct mem_sampling_record' declared inside parameter list will not be visible outside of this definition or declaration
     TP_PROTO(struct mem_sampling_record *record),
                     ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:274:58: note: in definition of macro 'DECLARE_EVENT_CLASS'
     struct trace_event_data_offsets_##call *__data_offsets, proto) \
                                                             ^~~~~
   include/trace/trace_events.h:41:9: note: in expansion of macro 'PARAMS'
            PARAMS(proto),         \
            ^~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(mm_spe_record,
    ^~~~~~~~~~~
   include/trace/events/kmem.h:417:2: note: in expansion of macro 'TP_PROTO'
     TP_PROTO(struct mem_sampling_record *record),
     ^~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/events/kmem.h:441,
                    from mm/slab_common.c:35:
>> include/trace/events/kmem.h:417:18: warning: 'struct mem_sampling_record' declared inside parameter list will not be visible outside of this definition or declaration
     TP_PROTO(struct mem_sampling_record *record),
                     ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:399:47: note: in definition of macro '__DECLARE_EVENT_CLASS'
    do_trace_event_raw_event_##call(void *__data, proto)   \
                                                  ^~~~~
   include/trace/trace_events.h:427:29: note: in expansion of macro 'PARAMS'
    __DECLARE_EVENT_CLASS(call, PARAMS(proto), PARAMS(args), PARAMS(tstruct), \
                                ^~~~~~
   include/trace/trace_events.h:40:2: note: in expansion of macro 'DECLARE_EVENT_CLASS'
     DECLARE_EVENT_CLASS(name,          \
     ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:41:9: note: in expansion of macro 'PARAMS'
            PARAMS(proto),         \
            ^~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(mm_spe_record,
    ^~~~~~~~~~~
   include/trace/events/kmem.h:417:2: note: in expansion of macro 'TP_PROTO'
     TP_PROTO(struct mem_sampling_record *record),
     ^~~~~~~~
   include/trace/events/kmem.h: In function 'do_trace_event_raw_event_mm_spe_record':
>> include/trace/events/kmem.h:419:10: error: passing argument 2 of 'trace_event_get_offsets_mm_spe_record' from incompatible pointer type [-Werror=incompatible-pointer-types]
     TP_ARGS(record),
             ^~~~~~
   include/trace/trace_events.h:410:64: note: in definition of macro '__DECLARE_EVENT_CLASS'
     __data_size = trace_event_get_offsets_##call(&__data_offsets, args); \
                                                                   ^~~~
   include/trace/trace_events.h:427:44: note: in expansion of macro 'PARAMS'
    __DECLARE_EVENT_CLASS(call, PARAMS(proto), PARAMS(args), PARAMS(tstruct), \
                                               ^~~~~~
   include/trace/trace_events.h:40:2: note: in expansion of macro 'DECLARE_EVENT_CLASS'
     DECLARE_EVENT_CLASS(name,          \
     ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:42:9: note: in expansion of macro 'PARAMS'
            PARAMS(args),         \
            ^~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(mm_spe_record,
    ^~~~~~~~~~~
   include/trace/events/kmem.h:419:2: note: in expansion of macro 'TP_ARGS'
     TP_ARGS(record),
     ^~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/events/kmem.h:441,
                    from mm/slab_common.c:35:
   include/trace/events/kmem.h:417:39: note: expected 'struct mem_sampling_record *' but argument is of type 'struct mem_sampling_record *'
     TP_PROTO(struct mem_sampling_record *record),
              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/trace/trace_events.h:274:58: note: in definition of macro 'DECLARE_EVENT_CLASS'
     struct trace_event_data_offsets_##call *__data_offsets, proto) \
                                                             ^~~~~
   include/trace/trace_events.h:41:9: note: in expansion of macro 'PARAMS'
            PARAMS(proto),         \
            ^~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(mm_spe_record,
    ^~~~~~~~~~~
   include/trace/events/kmem.h:417:2: note: in expansion of macro 'TP_PROTO'
     TP_PROTO(struct mem_sampling_record *record),
     ^~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/events/kmem.h:441,
                    from mm/slab_common.c:35:
>> include/trace/events/kmem.h:428:26: error: dereferencing pointer to incomplete type 'struct mem_sampling_record'
      __entry->vaddr = record->virt_addr;
                             ^~
   include/trace/trace_events.h:420:4: note: in definition of macro '__DECLARE_EVENT_CLASS'
     { assign; }       \
       ^~~~~~
   include/trace/trace_events.h:428:9: note: in expansion of macro 'PARAMS'
            PARAMS(assign), PARAMS(print))   \
            ^~~~~~
   include/trace/trace_events.h:40:2: note: in expansion of macro 'DECLARE_EVENT_CLASS'
     DECLARE_EVENT_CLASS(name,          \
     ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:44:9: note: in expansion of macro 'PARAMS'
            PARAMS(assign),         \
            ^~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(mm_spe_record,
    ^~~~~~~~~~~
   include/trace/events/kmem.h:427:2: note: in expansion of macro 'TP_fast_assign'
     TP_fast_assign(
     ^~~~~~~~~~~~~~
   include/trace/events/kmem.h: At top level:
   include/trace/events/kmem.h:417:18: warning: 'struct mem_sampling_record' declared inside parameter list will not be visible outside of this definition or declaration
     TP_PROTO(struct mem_sampling_record *record),
                     ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:430:44: note: in definition of macro 'DECLARE_EVENT_CLASS'
    trace_event_raw_event_##call(void *__data, proto)   \
                                               ^~~~~
   include/trace/trace_events.h:41:9: note: in expansion of macro 'PARAMS'
            PARAMS(proto),         \
            ^~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(mm_spe_record,
    ^~~~~~~~~~~
   include/trace/events/kmem.h:417:2: note: in expansion of macro 'TP_PROTO'
     TP_PROTO(struct mem_sampling_record *record),
     ^~~~~~~~
   include/trace/events/kmem.h: In function 'trace_event_raw_event_mm_spe_record':
   include/trace/events/kmem.h:419:10: error: passing argument 2 of 'do_trace_event_raw_event_mm_spe_record' from incompatible pointer type [-Werror=incompatible-pointer-types]
     TP_ARGS(record),
             ^~~~~~
   include/trace/trace_events.h:432:42: note: in definition of macro 'DECLARE_EVENT_CLASS'
     do_trace_event_raw_event_##call(__data, args);   \
                                             ^~~~
   include/trace/trace_events.h:42:9: note: in expansion of macro 'PARAMS'
            PARAMS(args),         \
            ^~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(mm_spe_record,
    ^~~~~~~~~~~
   include/trace/events/kmem.h:419:2: note: in expansion of macro 'TP_ARGS'
     TP_ARGS(record),
     ^~~~~~~
   include/trace/events/kmem.h:417:39: note: expected 'struct mem_sampling_record *' but argument is of type 'struct mem_sampling_record *'
     TP_PROTO(struct mem_sampling_record *record),
              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/trace/trace_events.h:399:47: note: in definition of macro '__DECLARE_EVENT_CLASS'
    do_trace_event_raw_event_##call(void *__data, proto)   \
                                                  ^~~~~
   include/trace/trace_events.h:427:29: note: in expansion of macro 'PARAMS'
    __DECLARE_EVENT_CLASS(call, PARAMS(proto), PARAMS(args), PARAMS(tstruct), \
                                ^~~~~~
   include/trace/trace_events.h:40:2: note: in expansion of macro 'DECLARE_EVENT_CLASS'
     DECLARE_EVENT_CLASS(name,          \
     ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:41:9: note: in expansion of macro 'PARAMS'
            PARAMS(proto),         \
            ^~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(mm_spe_record,
    ^~~~~~~~~~~
   include/trace/events/kmem.h:417:2: note: in expansion of macro 'TP_PROTO'
     TP_PROTO(struct mem_sampling_record *record),
     ^~~~~~~~
   include/trace/events/kmem.h: In function 'ftrace_test_probe_mm_spe_record':
   include/trace/trace_events.h:457:35: error: passing argument 1 of 'check_trace_callback_type_mm_spe_record' from incompatible pointer type [-Werror=incompatible-pointer-types]
     check_trace_callback_type_##call(trace_event_raw_event_##template); \
                                      ^~~~~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:46:2: note: in expansion of macro 'DEFINE_EVENT'
     DEFINE_EVENT(name, name, PARAMS(proto), PARAMS(args));
     ^~~~~~~~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(mm_spe_record,
    ^~~~~~~~~~~
   In file included from include/trace/events/kmem.h:9,
                    from mm/slab_common.c:35:
   include/linux/tracepoint.h:287:42: note: expected 'void (*)(void *, struct mem_sampling_record *)' but argument is of type 'void (*)(void *, struct mem_sampling_record *)'
     check_trace_callback_type_##name(void (*cb)(data_proto)) \
                                      ~~~~~~~^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:432:2: note: in expansion of macro '__DECLARE_TRACE'
     __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),  \
     ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:566:2: note: in expansion of macro 'DECLARE_TRACE'
     DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
     ^~~~~~~~~~~~~
   include/trace/events/kmem.h:416:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(mm_spe_record,
    ^~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/events/kmem.h:441,
                    from mm/slab_common.c:35:
..

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]
   WARNING: unmet direct dependencies detected for HALTPOLL_CPUIDLE
   Depends on [n]: CPU_IDLE [=n] && ARCH_CPUIDLE_HALTPOLL [=y] && ARCH_HAS_OPTIMIZED_POLL [=y]
   Selected by [y]:
   - ARM64 [=y]
   WARNING: unmet direct dependencies detected for RESCTRL_FS
   Depends on [n]: MISC_FILESYSTEMS [=n] && ARCH_HAS_CPU_RESCTRL [=y]
   Selected by [y]:
   - ARM64_MPAM [=y]


vim +/__traceiter_mm_spe_record +419 include/trace/events/kmem.h

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
 > 417		TP_PROTO(struct mem_sampling_record *record),
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
