Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D58D1F463E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 May 2025 18:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748458726; cv=none; b=jqh7Z4O29imHzz1p3XxDZj/PtCZWfRG3Ty0NiHXPQA0CU1BrOuau/G/rhAUEPSqGyMRC5WRDTNKtycTAfQNWus71qhEGm3wXSKWi8TyZlxgjkvzB8nMmfgYIJ7pmmfR9WiLpwcmrc5wYEzJhWRgNzFqLHL225nyMEKqsV91kmR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748458726; c=relaxed/simple;
	bh=Ae41KHFy/Ma5t82tw8d1O2hxTNN7zEJUAv231DBCA4c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iHIVmCfIHPXV1ihQvo7MaLTZxOfxRVTLpqBbGkg3hkABK2XsN7HdCGuX508ncTZBCmz38S7n0PVYASn0irxnoLQUbErVHeN+vF7BnMB4CMBaJWC/1YjgsuGZxiQ0dkIkgpdPKFuotl0GKvYsMEhYWr7WUzZxo3zTiM8y+5Wee3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ntXFBSB3; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ntXFBSB3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748458724; x=1779994724;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ae41KHFy/Ma5t82tw8d1O2hxTNN7zEJUAv231DBCA4c=;
  b=ntXFBSB3Ss4xkfExMgSILZC58bPgjKku5ADFpwwLI8pQwDnSN21tujVL
   utIwdNYLKs63dUjPH0rOd0cxRnqsQugTGerWAruMAtqRJfXUscPvJgT0G
   YZzg+Xf9breEPrOnmOW8N4MIed2MrvTUXcdID1eOoMjofknHEBkbSaOGg
   3WjpoII6awPqgE/+dQx7HPL3PqSJqhoEEaU1fKi6xw0kzkZ5Du4EFSvH/
   2Z+L/iTIuyDXouPDmKz++nCGpvLnslUYyvGvrmkjo7K+WUOZ+dyYCDvpP
   nphHc/KH2tQGtywMeEyAxPMmiBMLoSSqZHMlcM+PQBd0fuu1Hm0vi90ye
   w==;
X-CSE-ConnectionGUID: wD01dp8bR0a02hdtOKy0Qw==
X-CSE-MsgGUID: mYkuMkVMS+C5d2tGPY5aQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="67916888"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="67916888"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 11:58:43 -0700
X-CSE-ConnectionGUID: tw7IlApzQBeIreGhs4FrrQ==
X-CSE-MsgGUID: y31rEaavTZGLFp6Std8CTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="scan'208";a="143234060"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 May 2025 11:58:41 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKLz4-000VzM-0u;
	Wed, 28 May 2025 18:58:38 +0000
Date: Thu, 29 May 2025 02:58:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Ze Zuo <zuoze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2329/2329] include/trace/events/kmem.h:441:10:
 error: passing argument 2 of '__traceiter_spe_boost_spe_record' from
 incompatible pointer type
Message-ID: <202505290250.Bj46FlhO-lkp@intel.com>
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
commit: c99ab2e30089c85721b1d05b616cfb7daacf32d6 [2329/2329] arm-spe: Export boost SPE sampling info via tracefs tracepoint
config: arm64-randconfig-003-20250529 (https://download.01.org/0day-ci/archive/20250529/202505290250.Bj46FlhO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250529/202505290250.Bj46FlhO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505290250.Bj46FlhO-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

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
   include/trace/events/kmem.h:417:18: warning: 'struct mem_sampling_record' declared inside parameter list will not be visible outside of this definition or declaration
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
   include/trace/events/kmem.h:417:18: warning: 'struct mem_sampling_record' declared inside parameter list will not be visible outside of this definition or declaration
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
   include/trace/events/kmem.h:439:18: warning: 'struct mem_sampling_record' declared inside parameter list will not be visible outside of this definition or declaration
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
   include/trace/events/kmem.h:438:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(spe_boost_spe_record,
    ^~~~~~~~~~~
   include/trace/events/kmem.h:439:2: note: in expansion of macro 'TP_PROTO'
     TP_PROTO(struct mem_sampling_record *record),
     ^~~~~~~~
   include/trace/events/kmem.h:439:18: warning: 'struct mem_sampling_record' declared inside parameter list will not be visible outside of this definition or declaration
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
   include/trace/events/kmem.h:438:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(spe_boost_spe_record,
    ^~~~~~~~~~~
   include/trace/events/kmem.h:439:2: note: in expansion of macro 'TP_PROTO'
     TP_PROTO(struct mem_sampling_record *record),
     ^~~~~~~~
   include/trace/events/kmem.h: In function 'trace_spe_boost_spe_record':
>> include/trace/events/kmem.h:441:10: error: passing argument 2 of '__traceiter_spe_boost_spe_record' from incompatible pointer type [-Werror=incompatible-pointer-types]
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
   include/trace/events/kmem.h:438:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(spe_boost_spe_record,
    ^~~~~~~~~~~
   include/trace/events/kmem.h:441:2: note: in expansion of macro 'TP_ARGS'
     TP_ARGS(record),
     ^~~~~~~
   include/trace/events/kmem.h:439:39: note: expected 'struct mem_sampling_record *' but argument is of type 'struct mem_sampling_record *'
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
   include/trace/events/kmem.h:438:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(spe_boost_spe_record,
    ^~~~~~~~~~~
   include/trace/events/kmem.h:439:2: note: in expansion of macro 'TP_PROTO'
     TP_PROTO(struct mem_sampling_record *record),
     ^~~~~~~~
   include/trace/events/kmem.h: At top level:
   include/trace/events/kmem.h:439:18: warning: 'struct mem_sampling_record' declared inside parameter list will not be visible outside of this definition or declaration
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
   include/trace/events/kmem.h:438:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(spe_boost_spe_record,
    ^~~~~~~~~~~
   include/trace/events/kmem.h:439:2: note: in expansion of macro 'TP_PROTO'
     TP_PROTO(struct mem_sampling_record *record),
     ^~~~~~~~
   include/trace/events/kmem.h: In function 'trace_spe_boost_spe_record_rcuidle':
>> include/trace/events/kmem.h:441:10: error: passing argument 2 of '__traceiter_spe_boost_spe_record' from incompatible pointer type [-Werror=incompatible-pointer-types]
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
   include/trace/events/kmem.h:438:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(spe_boost_spe_record,
    ^~~~~~~~~~~
   include/trace/events/kmem.h:441:2: note: in expansion of macro 'TP_ARGS'
     TP_ARGS(record),
     ^~~~~~~
   include/trace/events/kmem.h:439:39: note: expected 'struct mem_sampling_record *' but argument is of type 'struct mem_sampling_record *'
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
   include/trace/events/kmem.h:438:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(spe_boost_spe_record,
    ^~~~~~~~~~~
   include/trace/events/kmem.h:439:2: note: in expansion of macro 'TP_PROTO'
     TP_PROTO(struct mem_sampling_record *record),
     ^~~~~~~~
   include/trace/events/kmem.h: At top level:
   include/trace/events/kmem.h:439:18: warning: 'struct mem_sampling_record' declared inside parameter list will not be visible outside of this definition or declaration
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
   include/trace/events/kmem.h:438:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(spe_boost_spe_record,
    ^~~~~~~~~~~
   include/trace/events/kmem.h:439:2: note: in expansion of macro 'TP_PROTO'
     TP_PROTO(struct mem_sampling_record *record),
     ^~~~~~~~
   include/trace/events/kmem.h:439:18: warning: 'struct mem_sampling_record' declared inside parameter list will not be visible outside of this definition or declaration
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
   include/trace/events/kmem.h:438:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(spe_boost_spe_record,
    ^~~~~~~~~~~
   include/trace/events/kmem.h:439:2: note: in expansion of macro 'TP_PROTO'
--
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
   include/linux/static_call_types.h:15:34: error: conflicting types for '__SCT__tp_func_mm_spe_record'
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
   In file included from include/trace/events/kmem.h:9,
                    from mm/slab_common.c:35:
   include/trace/events/kmem.h:439:18: warning: 'struct mem_sampling_record' declared inside parameter list will not be visible outside of this definition or declaration
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
   include/trace/events/kmem.h:438:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(spe_boost_spe_record,
    ^~~~~~~~~~~
   include/trace/events/kmem.h:439:2: note: in expansion of macro 'TP_PROTO'
     TP_PROTO(struct mem_sampling_record *record),
     ^~~~~~~~
>> include/linux/tracepoint.h:305:6: error: conflicting types for '__traceiter_spe_boost_spe_record'
     int __traceiter_##_name(void *__data, proto);   \
         ^~~~~~~~~~~~
   include/linux/tracepoint.h:341:2: note: in expansion of macro 'DEFINE_TRACE_FN'
     DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
     ^~~~~~~~~~~~~~~
   include/trace/define_trace.h:28:2: note: in expansion of macro 'DEFINE_TRACE'
     DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
     ^~~~~~~~~~~~
   include/trace/events/kmem.h:438:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(spe_boost_spe_record,
    ^~~~~~~~~~~
   include/linux/tracepoint.h:252:13: note: previous declaration of '__traceiter_spe_boost_spe_record' was here
     extern int __traceiter_##name(data_proto);   \
                ^~~~~~~~~~~~
   include/linux/tracepoint.h:432:2: note: in expansion of macro '__DECLARE_TRACE'
     __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),  \
     ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:566:2: note: in expansion of macro 'DECLARE_TRACE'
     DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
     ^~~~~~~~~~~~~
   include/trace/events/kmem.h:438:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(spe_boost_spe_record,
    ^~~~~~~~~~~
   include/trace/events/kmem.h:439:18: warning: 'struct mem_sampling_record' declared inside parameter list will not be visible outside of this definition or declaration
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
   include/trace/events/kmem.h:438:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(spe_boost_spe_record,
    ^~~~~~~~~~~
   include/trace/events/kmem.h:439:2: note: in expansion of macro 'TP_PROTO'
     TP_PROTO(struct mem_sampling_record *record),
     ^~~~~~~~
   include/trace/events/kmem.h:439:18: warning: 'struct mem_sampling_record' declared inside parameter list will not be visible outside of this definition or declaration
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
   include/trace/events/kmem.h:438:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(spe_boost_spe_record,
    ^~~~~~~~~~~
   include/trace/events/kmem.h:439:2: note: in expansion of macro 'TP_PROTO'
     TP_PROTO(struct mem_sampling_record *record),
     ^~~~~~~~
   include/linux/tracepoint.h:319:6: error: conflicting types for '__traceiter_spe_boost_spe_record'
     int __traceiter_##_name(void *__data, proto)   \
         ^~~~~~~~~~~~
   include/linux/tracepoint.h:341:2: note: in expansion of macro 'DEFINE_TRACE_FN'
     DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
     ^~~~~~~~~~~~~~~
   include/trace/define_trace.h:28:2: note: in expansion of macro 'DEFINE_TRACE'
     DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
     ^~~~~~~~~~~~
   include/trace/events/kmem.h:438:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(spe_boost_spe_record,
    ^~~~~~~~~~~
   include/linux/tracepoint.h:252:13: note: previous declaration of '__traceiter_spe_boost_spe_record' was here
     extern int __traceiter_##name(data_proto);   \
                ^~~~~~~~~~~~
   include/linux/tracepoint.h:432:2: note: in expansion of macro '__DECLARE_TRACE'
     __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),  \
     ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:566:2: note: in expansion of macro 'DECLARE_TRACE'
     DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
     ^~~~~~~~~~~~~
   include/trace/events/kmem.h:438:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(spe_boost_spe_record,
    ^~~~~~~~~~~
   include/trace/events/kmem.h:439:18: warning: 'struct mem_sampling_record' declared inside parameter list will not be visible outside of this definition or declaration
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
   include/trace/events/kmem.h:438:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(spe_boost_spe_record,
    ^~~~~~~~~~~
   include/trace/events/kmem.h:439:2: note: in expansion of macro 'TP_PROTO'
     TP_PROTO(struct mem_sampling_record *record),
     ^~~~~~~~
>> include/linux/tracepoint.h:335:7: error: conflicting types for '__probestub_spe_boost_spe_record'
     void __probestub_##_name(void *__data, proto)   \
          ^~~~~~~~~~~~
   include/linux/tracepoint.h:341:2: note: in expansion of macro 'DEFINE_TRACE_FN'
     DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
     ^~~~~~~~~~~~~~~
   include/trace/define_trace.h:28:2: note: in expansion of macro 'DEFINE_TRACE'
     DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
     ^~~~~~~~~~~~
   include/trace/events/kmem.h:438:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(spe_boost_spe_record,
    ^~~~~~~~~~~
   include/linux/tracepoint.h:306:7: note: previous declaration of '__probestub_spe_boost_spe_record' was here
     void __probestub_##_name(void *__data, proto);   \
          ^~~~~~~~~~~~
   include/linux/tracepoint.h:341:2: note: in expansion of macro 'DEFINE_TRACE_FN'
     DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
     ^~~~~~~~~~~~~~~
   include/trace/define_trace.h:28:2: note: in expansion of macro 'DEFINE_TRACE'
     DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
     ^~~~~~~~~~~~
   include/trace/events/kmem.h:438:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(spe_boost_spe_record,
    ^~~~~~~~~~~
   In file included from <command-line>:
>> include/linux/static_call_types.h:15:34: error: conflicting types for '__SCT__tp_func_spe_boost_spe_record'
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
   include/trace/events/kmem.h:438:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(spe_boost_spe_record,
    ^~~~~~~~~~~
   include/linux/static_call_types.h:15:34: note: previous declaration of '__SCT__tp_func_spe_boost_spe_record' was here
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
   include/trace/events/kmem.h:438:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(spe_boost_spe_record,
    ^~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/events/kmem.h:529,
                    from mm/slab_common.c:35:
   include/trace/events/kmem.h:417:18: warning: 'struct mem_sampling_record' declared inside parameter list will not be visible outside of this definition or declaration
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
   include/trace/events/kmem.h:439:18: warning: 'struct mem_sampling_record' declared inside parameter list will not be visible outside of this definition or declaration
     TP_PROTO(struct mem_sampling_record *record),
                     ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:274:58: note: in definition of macro 'DECLARE_EVENT_CLASS'
     struct trace_event_data_offsets_##call *__data_offsets, proto) \
                                                             ^~~~~
   include/trace/trace_events.h:41:9: note: in expansion of macro 'PARAMS'
            PARAMS(proto),         \
            ^~~~~~
   include/trace/events/kmem.h:438:1: note: in expansion of macro 'TRACE_EVENT'
    TRACE_EVENT(spe_boost_spe_record,
    ^~~~~~~~~~~
   include/trace/events/kmem.h:439:2: note: in expansion of macro 'TP_PROTO'
     TP_PROTO(struct mem_sampling_record *record),
     ^~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/events/kmem.h:529,
                    from mm/slab_common.c:35:
   include/trace/events/kmem.h:417:18: warning: 'struct mem_sampling_record' declared inside parameter list will not be visible outside of this definition or declaration
     TP_PROTO(struct mem_sampling_record *record),
                     ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:399:47: note: in definition of macro '__DECLARE_EVENT_CLASS'
    do_trace_event_raw_event_##call(void *__data, proto)   \
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


vim +/__traceiter_spe_boost_spe_record +441 include/trace/events/kmem.h

   437	
   438	TRACE_EVENT(spe_boost_spe_record,
   439		TP_PROTO(struct mem_sampling_record *record),
   440	
 > 441		TP_ARGS(record),
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
