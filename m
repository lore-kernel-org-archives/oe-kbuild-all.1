Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0B13D6467
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 13:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773840428; cv=none; b=QQGd2IORvQI/dFujH/oo9YY9X/bvBiGLQ8StACO7w2xLq36Uew8tFlmIIvVU4wLKRZ7PMuN6MPrEPe96DfLxKpir++bRTK2M6G3C36K4HRd4uWkoKrtQXd6sGB6jYe1wVd6xGDjAcnZhKwMJxANvv63Cv3Vt+INT3KZYtVsgL+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773840428; c=relaxed/simple;
	bh=kJiarm4F0zvzbb3/FX+nYPCfIBCpzPan9rjvyU2bsxU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ra6iTSXUwPn+LH7Dr4hcIBCJaQRhZ8sWjZjRxdE0YJA+mJuU5kXlZVGB2JYE7MquitoIj150MzG/B/wXeYR4EwLOeITZWNjOqrl6ssULx7PUquCGGok+nXkpO27ER002NPZorJtg6F8fd8tj+FdIUpJeDG1lhoNU6IsWqHv1jws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aKXrzxPr; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aKXrzxPr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773840424; x=1805376424;
  h=date:from:to:cc:subject:message-id;
  bh=kJiarm4F0zvzbb3/FX+nYPCfIBCpzPan9rjvyU2bsxU=;
  b=aKXrzxPrd6Lryvu2yg8ZqRvhYQjLbgNWM8df8rx9qeKXzNecUb27QAGA
   mtoDT3eAyQbRUX1zRid1Er4+5Sb3jw3cIN3pdnF6aLsuZTcFQXBRfvqnD
   W2ve98eXO0KZ8QtM/6I30mnDpE0NKZIockNxCgSFAqx6cqgRLnsnQefDn
   khittHuaETZk6gSeWPFzzknoFpX5XZBklei2y6SgIafJqwyuHHPIcJIib
   Mqbd3E9+lmchvJAxW683EyVmZGG/X3KbgH6NJBIwj0fi912p6J7JtzUlz
   XKMQVT7V34QhWxY9Vnd6rjS1U7mq6UJLyvBWusFlKmQ3MZgKKQYzfZFVB
   A==;
X-CSE-ConnectionGUID: 6cmBT8AzTkuT8I2+hA/Onw==
X-CSE-MsgGUID: XiBY/bB3Rb+sGOjZKHyL+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="92273428"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="92273428"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 06:27:03 -0700
X-CSE-ConnectionGUID: 5KKyZt9FTJOLJLl3iQz6Qw==
X-CSE-MsgGUID: qinDy57GTzioniR1NECdsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="226758969"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Mar 2026 06:27:01 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2qvJ-000000002wr-27aw;
	Wed, 18 Mar 2026 13:26:57 +0000
Date: Wed, 18 Mar 2026 21:26:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 0/2]
 include/trace/hooks/mm.h:290:17: error: passing argument 2 of
 '__SCT__tp_func_android_vh_cma_release_bypass' from incompatible pointer type
Message-ID: <202603182110.Jl8yo29d-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   b0e662fb17ec139a265b282999e920fe1f021414
commit: a67968bd9918671119270896fa1e9d5640f3009e [0/2] ANDROID: GKI: add vendor hooks for memory compaction and cma free.
config: i386-buildonly-randconfig-004-20260318 (https://download.01.org/0day-ci/archive/20260318/202603182110.Jl8yo29d-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603182110.Jl8yo29d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603182110.Jl8yo29d-lkp@intel.com/

All errors (new ones prefixed by >>):

   include/trace/hooks/mm.h:288:25: warning: 'struct cma' declared inside parameter list will not be visible outside of this definition or declaration
     288 |         TP_PROTO(struct cma *cma, const struct page *pages, unsigned long count,
         |                         ^~~
   include/linux/tracepoint.h:241:45: note: in definition of macro '__DECLARE_TRACE_COMMON'
     241 |         register_trace_##name(void (*probe)(data_proto), void *data)    \
         |                                             ^~~~~~~~~~
   include/linux/tracepoint.h:270:67: note: in expansion of macro 'PARAMS'
     270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
         |                                                                   ^~~~~~
   include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TRACE'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:483:25: note: in expansion of macro 'PARAMS'
     483 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:288:9: note: in expansion of macro 'TP_PROTO'
     288 |         TP_PROTO(struct cma *cma, const struct page *pages, unsigned long count,
         |         ^~~~~~~~
   include/trace/hooks/mm.h:288:25: warning: 'struct cma' declared inside parameter list will not be visible outside of this definition or declaration
     288 |         TP_PROTO(struct cma *cma, const struct page *pages, unsigned long count,
         |                         ^~~
   include/linux/tracepoint.h:247:50: note: in definition of macro '__DECLARE_TRACE_COMMON'
     247 |         register_trace_prio_##name(void (*probe)(data_proto), void *data,\
         |                                                  ^~~~~~~~~~
   include/linux/tracepoint.h:270:67: note: in expansion of macro 'PARAMS'
     270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
         |                                                                   ^~~~~~
   include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TRACE'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:483:25: note: in expansion of macro 'PARAMS'
     483 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:288:9: note: in expansion of macro 'TP_PROTO'
     288 |         TP_PROTO(struct cma *cma, const struct page *pages, unsigned long count,
         |         ^~~~~~~~
   include/trace/hooks/mm.h:288:25: warning: 'struct cma' declared inside parameter list will not be visible outside of this definition or declaration
     288 |         TP_PROTO(struct cma *cma, const struct page *pages, unsigned long count,
         |                         ^~~
   include/linux/tracepoint.h:254:47: note: in definition of macro '__DECLARE_TRACE_COMMON'
     254 |         unregister_trace_##name(void (*probe)(data_proto), void *data)  \
         |                                               ^~~~~~~~~~
   include/linux/tracepoint.h:270:67: note: in expansion of macro 'PARAMS'
     270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
         |                                                                   ^~~~~~
   include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TRACE'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:483:25: note: in expansion of macro 'PARAMS'
     483 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:288:9: note: in expansion of macro 'TP_PROTO'
     288 |         TP_PROTO(struct cma *cma, const struct page *pages, unsigned long count,
         |         ^~~~~~~~
   include/trace/hooks/mm.h:288:25: warning: 'struct cma' declared inside parameter list will not be visible outside of this definition or declaration
     288 |         TP_PROTO(struct cma *cma, const struct page *pages, unsigned long count,
         |                         ^~~
   include/linux/tracepoint.h:260:53: note: in definition of macro '__DECLARE_TRACE_COMMON'
     260 |         check_trace_callback_type_##name(void (*cb)(data_proto))        \
         |                                                     ^~~~~~~~~~
   include/linux/tracepoint.h:270:67: note: in expansion of macro 'PARAMS'
     270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
         |                                                                   ^~~~~~
   include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TRACE'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:483:25: note: in expansion of macro 'PARAMS'
     483 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:288:9: note: in expansion of macro 'TP_PROTO'
     288 |         TP_PROTO(struct cma *cma, const struct page *pages, unsigned long count,
         |         ^~~~~~~~
   include/trace/hooks/mm.h:288:25: warning: 'struct cma' declared inside parameter list will not be visible outside of this definition or declaration
     288 |         TP_PROTO(struct cma *cma, const struct page *pages, unsigned long count,
         |                         ^~~
   include/linux/tracepoint.h:271:46: note: in definition of macro '__DECLARE_TRACE'
     271 |         static inline void __do_trace_##name(proto)                     \
         |                                              ^~~~~
   include/linux/tracepoint.h:481:31: note: in expansion of macro 'PARAMS'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                               ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:288:9: note: in expansion of macro 'TP_PROTO'
     288 |         TP_PROTO(struct cma *cma, const struct page *pages, unsigned long count,
         |         ^~~~~~~~
   include/trace/hooks/mm.h: In function '__do_trace_android_vh_cma_release_bypass':
>> include/trace/hooks/mm.h:290:17: error: passing argument 2 of '__SCT__tp_func_android_vh_cma_release_bypass' from incompatible pointer type [-Wincompatible-pointer-types]
     290 |         TP_ARGS(cma, pages, count, bypass));
         |                 ^~~
         |                 |
         |                 struct cma *
   include/linux/tracepoint.h:205:61: note: in definition of macro '__DO_TRACE_CALL'
     205 |                         static_call(tp_func_##name)(__data, args);      \
         |                                                             ^~~~
   include/linux/tracepoint.h:275:47: note: in expansion of macro 'TP_ARGS'
     275 |                         __DO_TRACE_CALL(name, TP_ARGS(args));           \
         |                                               ^~~~~~~
   include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TRACE'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:481:46: note: in expansion of macro 'PARAMS'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                                              ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:290:9: note: in expansion of macro 'TP_ARGS'
     290 |         TP_ARGS(cma, pages, count, bypass));
         |         ^~~~~~~
   include/trace/hooks/mm.h:290:17: note: expected 'struct cma *' but argument is of type 'struct cma *'
     290 |         TP_ARGS(cma, pages, count, bypass));
         |                 ^~~
   include/linux/tracepoint.h:205:61: note: in definition of macro '__DO_TRACE_CALL'
     205 |                         static_call(tp_func_##name)(__data, args);      \
         |                                                             ^~~~
   include/linux/tracepoint.h:275:47: note: in expansion of macro 'TP_ARGS'
     275 |                         __DO_TRACE_CALL(name, TP_ARGS(args));           \
         |                                               ^~~~~~~
   include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TRACE'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:481:46: note: in expansion of macro 'PARAMS'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                                              ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:290:9: note: in expansion of macro 'TP_ARGS'
     290 |         TP_ARGS(cma, pages, count, bypass));
         |         ^~~~~~~
   include/trace/hooks/mm.h: At top level:
   include/trace/hooks/mm.h:288:25: warning: 'struct cma' declared inside parameter list will not be visible outside of this definition or declaration
     288 |         TP_PROTO(struct cma *cma, const struct page *pages, unsigned long count,
         |                         ^~~
   include/linux/tracepoint.h:278:41: note: in definition of macro '__DECLARE_TRACE'
     278 |         static inline void trace_##name(proto)                          \
         |                                         ^~~~~
   include/linux/tracepoint.h:481:31: note: in expansion of macro 'PARAMS'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                               ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:288:9: note: in expansion of macro 'TP_PROTO'
     288 |         TP_PROTO(struct cma *cma, const struct page *pages, unsigned long count,
         |         ^~~~~~~~
   include/trace/hooks/mm.h: In function 'trace_android_vh_cma_release_bypass':
>> include/trace/hooks/mm.h:290:17: error: passing argument 1 of '__do_trace_android_vh_cma_release_bypass' from incompatible pointer type [-Wincompatible-pointer-types]
     290 |         TP_ARGS(cma, pages, count, bypass));
         |                 ^~~
         |                 |
         |                 struct cma *
   include/linux/tracepoint.h:281:43: note: in definition of macro '__DECLARE_TRACE'
     281 |                         __do_trace_##name(args);                        \
         |                                           ^~~~
   include/linux/tracepoint.h:481:46: note: in expansion of macro 'PARAMS'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                                              ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:290:9: note: in expansion of macro 'TP_ARGS'
     290 |         TP_ARGS(cma, pages, count, bypass));
         |         ^~~~~~~
   include/trace/hooks/mm.h:288:30: note: expected 'struct cma *' but argument is of type 'struct cma *'
     288 |         TP_PROTO(struct cma *cma, const struct page *pages, unsigned long count,
         |                  ~~~~~~~~~~~~^~~
   include/linux/tracepoint.h:271:46: note: in definition of macro '__DECLARE_TRACE'
     271 |         static inline void __do_trace_##name(proto)                     \
         |                                              ^~~~~
   include/linux/tracepoint.h:481:31: note: in expansion of macro 'PARAMS'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                               ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:288:9: note: in expansion of macro 'TP_PROTO'
     288 |         TP_PROTO(struct cma *cma, const struct page *pages, unsigned long count,
         |         ^~~~~~~~
   include/trace/hooks/mm.h: At top level:
   include/trace/hooks/mm.h:292:25: warning: 'struct cma' declared inside parameter list will not be visible outside of this definition or declaration
     292 |         TP_PROTO(struct cma *cma, unsigned long pfn, const struct page *pages,
         |                         ^~~
   include/linux/tracepoint.h:236:39: note: in definition of macro '__DECLARE_TRACE_COMMON'
     236 |         extern int __traceiter_##name(data_proto);                      \
         |                                       ^~~~~~~~~~
   include/linux/tracepoint.h:270:67: note: in expansion of macro 'PARAMS'
     270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
         |                                                                   ^~~~~~
   include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TRACE'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:483:25: note: in expansion of macro 'PARAMS'
     483 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:292:9: note: in expansion of macro 'TP_PROTO'
     292 |         TP_PROTO(struct cma *cma, unsigned long pfn, const struct page *pages,
         |         ^~~~~~~~
   include/trace/hooks/mm.h:292:25: warning: 'struct cma' declared inside parameter list will not be visible outside of this definition or declaration
     292 |         TP_PROTO(struct cma *cma, unsigned long pfn, const struct page *pages,
         |                         ^~~
   include/linux/tracepoint.h:239:42: note: in definition of macro '__DECLARE_TRACE_COMMON'
     239 |         extern void rust_do_trace_##name(proto);                        \
         |                                          ^~~~~
   include/linux/tracepoint.h:270:38: note: in expansion of macro 'PARAMS'
     270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
         |                                      ^~~~~~
   include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TRACE'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:481:31: note: in expansion of macro 'PARAMS'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                               ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:292:9: note: in expansion of macro 'TP_PROTO'
     292 |         TP_PROTO(struct cma *cma, unsigned long pfn, const struct page *pages,
         |         ^~~~~~~~
   include/trace/hooks/mm.h:292:25: warning: 'struct cma' declared inside parameter list will not be visible outside of this definition or declaration
     292 |         TP_PROTO(struct cma *cma, unsigned long pfn, const struct page *pages,
         |                         ^~~
   include/linux/tracepoint.h:241:45: note: in definition of macro '__DECLARE_TRACE_COMMON'
     241 |         register_trace_##name(void (*probe)(data_proto), void *data)    \
         |                                             ^~~~~~~~~~
   include/linux/tracepoint.h:270:67: note: in expansion of macro 'PARAMS'
     270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
         |                                                                   ^~~~~~
   include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TRACE'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:483:25: note: in expansion of macro 'PARAMS'
     483 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:292:9: note: in expansion of macro 'TP_PROTO'
     292 |         TP_PROTO(struct cma *cma, unsigned long pfn, const struct page *pages,
         |         ^~~~~~~~
   include/trace/hooks/mm.h:292:25: warning: 'struct cma' declared inside parameter list will not be visible outside of this definition or declaration
     292 |         TP_PROTO(struct cma *cma, unsigned long pfn, const struct page *pages,
         |                         ^~~
   include/linux/tracepoint.h:247:50: note: in definition of macro '__DECLARE_TRACE_COMMON'
     247 |         register_trace_prio_##name(void (*probe)(data_proto), void *data,\
         |                                                  ^~~~~~~~~~
   include/linux/tracepoint.h:270:67: note: in expansion of macro 'PARAMS'
     270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
         |                                                                   ^~~~~~
   include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TRACE'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:483:25: note: in expansion of macro 'PARAMS'
     483 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:292:9: note: in expansion of macro 'TP_PROTO'
     292 |         TP_PROTO(struct cma *cma, unsigned long pfn, const struct page *pages,
         |         ^~~~~~~~
   include/trace/hooks/mm.h:292:25: warning: 'struct cma' declared inside parameter list will not be visible outside of this definition or declaration
     292 |         TP_PROTO(struct cma *cma, unsigned long pfn, const struct page *pages,
         |                         ^~~
   include/linux/tracepoint.h:254:47: note: in definition of macro '__DECLARE_TRACE_COMMON'
     254 |         unregister_trace_##name(void (*probe)(data_proto), void *data)  \
         |                                               ^~~~~~~~~~
   include/linux/tracepoint.h:270:67: note: in expansion of macro 'PARAMS'
     270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
         |                                                                   ^~~~~~
   include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TRACE'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:483:25: note: in expansion of macro 'PARAMS'
     483 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:292:9: note: in expansion of macro 'TP_PROTO'
     292 |         TP_PROTO(struct cma *cma, unsigned long pfn, const struct page *pages,
         |         ^~~~~~~~
   include/trace/hooks/mm.h:292:25: warning: 'struct cma' declared inside parameter list will not be visible outside of this definition or declaration
     292 |         TP_PROTO(struct cma *cma, unsigned long pfn, const struct page *pages,
         |                         ^~~
   include/linux/tracepoint.h:260:53: note: in definition of macro '__DECLARE_TRACE_COMMON'
     260 |         check_trace_callback_type_##name(void (*cb)(data_proto))        \
         |                                                     ^~~~~~~~~~
   include/linux/tracepoint.h:270:67: note: in expansion of macro 'PARAMS'
     270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
         |                                                                   ^~~~~~
   include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TRACE'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:483:25: note: in expansion of macro 'PARAMS'
     483 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:292:9: note: in expansion of macro 'TP_PROTO'
     292 |         TP_PROTO(struct cma *cma, unsigned long pfn, const struct page *pages,
         |         ^~~~~~~~
   include/trace/hooks/mm.h:292:25: warning: 'struct cma' declared inside parameter list will not be visible outside of this definition or declaration
     292 |         TP_PROTO(struct cma *cma, unsigned long pfn, const struct page *pages,
         |                         ^~~
   include/linux/tracepoint.h:271:46: note: in definition of macro '__DECLARE_TRACE'
     271 |         static inline void __do_trace_##name(proto)                     \
         |                                              ^~~~~
   include/linux/tracepoint.h:481:31: note: in expansion of macro 'PARAMS'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                               ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:292:9: note: in expansion of macro 'TP_PROTO'
     292 |         TP_PROTO(struct cma *cma, unsigned long pfn, const struct page *pages,
         |         ^~~~~~~~
   include/trace/hooks/mm.h: In function '__do_trace_android_vh_cma_alloc_end':
>> include/trace/hooks/mm.h:294:17: error: passing argument 2 of '__SCT__tp_func_android_vh_cma_alloc_end' from incompatible pointer type [-Wincompatible-pointer-types]
     294 |         TP_ARGS(cma, pfn, pages, count, align, ret));
         |                 ^~~
         |                 |
         |                 struct cma *
   include/linux/tracepoint.h:205:61: note: in definition of macro '__DO_TRACE_CALL'
     205 |                         static_call(tp_func_##name)(__data, args);      \
         |                                                             ^~~~
   include/linux/tracepoint.h:275:47: note: in expansion of macro 'TP_ARGS'
     275 |                         __DO_TRACE_CALL(name, TP_ARGS(args));           \
         |                                               ^~~~~~~
   include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TRACE'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:481:46: note: in expansion of macro 'PARAMS'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                                              ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:294:9: note: in expansion of macro 'TP_ARGS'
     294 |         TP_ARGS(cma, pfn, pages, count, align, ret));
         |         ^~~~~~~
   include/trace/hooks/mm.h:294:17: note: expected 'struct cma *' but argument is of type 'struct cma *'
     294 |         TP_ARGS(cma, pfn, pages, count, align, ret));
         |                 ^~~
   include/linux/tracepoint.h:205:61: note: in definition of macro '__DO_TRACE_CALL'
     205 |                         static_call(tp_func_##name)(__data, args);      \
         |                                                             ^~~~
   include/linux/tracepoint.h:275:47: note: in expansion of macro 'TP_ARGS'
     275 |                         __DO_TRACE_CALL(name, TP_ARGS(args));           \
         |                                               ^~~~~~~
   include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TRACE'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:481:46: note: in expansion of macro 'PARAMS'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                                              ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:294:9: note: in expansion of macro 'TP_ARGS'
     294 |         TP_ARGS(cma, pfn, pages, count, align, ret));
         |         ^~~~~~~
   include/trace/hooks/mm.h: At top level:
   include/trace/hooks/mm.h:292:25: warning: 'struct cma' declared inside parameter list will not be visible outside of this definition or declaration
     292 |         TP_PROTO(struct cma *cma, unsigned long pfn, const struct page *pages,
         |                         ^~~
   include/linux/tracepoint.h:278:41: note: in definition of macro '__DECLARE_TRACE'
     278 |         static inline void trace_##name(proto)                          \
         |                                         ^~~~~
   include/linux/tracepoint.h:481:31: note: in expansion of macro 'PARAMS'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                               ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:292:9: note: in expansion of macro 'TP_PROTO'
     292 |         TP_PROTO(struct cma *cma, unsigned long pfn, const struct page *pages,
         |         ^~~~~~~~
   include/trace/hooks/mm.h: In function 'trace_android_vh_cma_alloc_end':
>> include/trace/hooks/mm.h:294:17: error: passing argument 1 of '__do_trace_android_vh_cma_alloc_end' from incompatible pointer type [-Wincompatible-pointer-types]
     294 |         TP_ARGS(cma, pfn, pages, count, align, ret));
         |                 ^~~
         |                 |
         |                 struct cma *
   include/linux/tracepoint.h:281:43: note: in definition of macro '__DECLARE_TRACE'
     281 |                         __do_trace_##name(args);                        \
         |                                           ^~~~
   include/linux/tracepoint.h:481:46: note: in expansion of macro 'PARAMS'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                                              ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:294:9: note: in expansion of macro 'TP_ARGS'
     294 |         TP_ARGS(cma, pfn, pages, count, align, ret));
         |         ^~~~~~~
   include/trace/hooks/mm.h:292:30: note: expected 'struct cma *' but argument is of type 'struct cma *'
     292 |         TP_PROTO(struct cma *cma, unsigned long pfn, const struct page *pages,
         |                  ~~~~~~~~~~~~^~~
   include/linux/tracepoint.h:271:46: note: in definition of macro '__DECLARE_TRACE'
     271 |         static inline void __do_trace_##name(proto)                     \
         |                                              ^~~~~
   include/linux/tracepoint.h:481:31: note: in expansion of macro 'PARAMS'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                               ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:292:9: note: in expansion of macro 'TP_PROTO'
     292 |         TP_PROTO(struct cma *cma, unsigned long pfn, const struct page *pages,
         |         ^~~~~~~~
   include/trace/hooks/mm.h: At top level:
   include/trace/hooks/mm.h:288:25: warning: 'struct cma' declared inside parameter list will not be visible outside of this definition or declaration
     288 |         TP_PROTO(struct cma *cma, const struct page *pages, unsigned long count,
         |                         ^~~
   include/linux/tracepoint.h:318:47: note: in definition of macro '__DEFINE_TRACE_EXT'
     318 |         int __traceiter_##_name(void *__data, proto);                   \
         |                                               ^~~~~
   include/linux/tracepoint.h:371:41: note: in expansion of macro 'PARAMS'
     371 |         __DEFINE_TRACE_EXT(_name, NULL, PARAMS(_proto), PARAMS(_args));
         |                                         ^~~~~~
   include/trace/define_trace.h:85:9: note: in expansion of macro 'DEFINE_TRACE'
      85 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/define_trace.h:85:28: note: in expansion of macro 'PARAMS'
      85 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                            ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:288:9: note: in expansion of macro 'TP_PROTO'
     288 |         TP_PROTO(struct cma *cma, const struct page *pages, unsigned long count,
         |         ^~~~~~~~
>> include/linux/tracepoint.h:318:13: error: conflicting types for '__traceiter_android_vh_cma_release_bypass'; have 'int(void *, struct cma *, const struct page *, long unsigned int,  bool *)' {aka 'int(void *, struct cma *, const struct page *, long unsigned int,  _Bool *)'}
     318 |         int __traceiter_##_name(void *__data, proto);                   \
         |             ^~~~~~~~~~~~
   include/linux/tracepoint.h:371:9: note: in expansion of macro '__DEFINE_TRACE_EXT'
     371 |         __DEFINE_TRACE_EXT(_name, NULL, PARAMS(_proto), PARAMS(_args));
         |         ^~~~~~~~~~~~~~~~~~
   include/trace/define_trace.h:85:9: note: in expansion of macro 'DEFINE_TRACE'
      85 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:287:1: note: in expansion of macro 'DECLARE_HOOK'
     287 | DECLARE_HOOK(android_vh_cma_release_bypass,
         | ^~~~~~~~~~~~
   include/linux/tracepoint.h:236:20: note: previous declaration of '__traceiter_android_vh_cma_release_bypass' with type 'int(void *, struct cma *, const struct page *, long unsigned int,  bool *)' {aka 'int(void *, struct cma *, const struct page *, long unsigned int,  _Bool *)'}
     236 |         extern int __traceiter_##name(data_proto);                      \
         |                    ^~~~~~~~~~~~
   include/linux/tracepoint.h:270:9: note: in expansion of macro '__DECLARE_TRACE_COMMON'
     270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TRACE'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:287:1: note: in expansion of macro 'DECLARE_HOOK'
     287 | DECLARE_HOOK(android_vh_cma_release_bypass,
         | ^~~~~~~~~~~~
   include/trace/hooks/mm.h:288:25: warning: 'struct cma' declared inside parameter list will not be visible outside of this definition or declaration
     288 |         TP_PROTO(struct cma *cma, const struct page *pages, unsigned long count,
         |                         ^~~
   include/linux/tracepoint.h:319:48: note: in definition of macro '__DEFINE_TRACE_EXT'
     319 |         void __probestub_##_name(void *__data, proto);                  \
         |                                                ^~~~~
   include/linux/tracepoint.h:371:41: note: in expansion of macro 'PARAMS'
     371 |         __DEFINE_TRACE_EXT(_name, NULL, PARAMS(_proto), PARAMS(_args));
         |                                         ^~~~~~
   include/trace/define_trace.h:85:9: note: in expansion of macro 'DEFINE_TRACE'
      85 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/define_trace.h:85:28: note: in expansion of macro 'PARAMS'
      85 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                            ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:288:9: note: in expansion of macro 'TP_PROTO'
     288 |         TP_PROTO(struct cma *cma, const struct page *pages, unsigned long count,
         |         ^~~~~~~~
   include/trace/hooks/mm.h:288:25: warning: 'struct cma' declared inside parameter list will not be visible outside of this definition or declaration
     288 |         TP_PROTO(struct cma *cma, const struct page *pages, unsigned long count,
         |                         ^~~
   include/linux/tracepoint.h:332:47: note: in definition of macro '__DEFINE_TRACE_EXT'
     332 |         int __traceiter_##_name(void *__data, proto)                    \
         |                                               ^~~~~
   include/linux/tracepoint.h:371:41: note: in expansion of macro 'PARAMS'
     371 |         __DEFINE_TRACE_EXT(_name, NULL, PARAMS(_proto), PARAMS(_args));
         |                                         ^~~~~~
   include/trace/define_trace.h:85:9: note: in expansion of macro 'DEFINE_TRACE'
      85 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/define_trace.h:85:28: note: in expansion of macro 'PARAMS'
      85 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                            ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:288:9: note: in expansion of macro 'TP_PROTO'
     288 |         TP_PROTO(struct cma *cma, const struct page *pages, unsigned long count,
         |         ^~~~~~~~
   include/linux/tracepoint.h:332:13: error: conflicting types for '__traceiter_android_vh_cma_release_bypass'; have 'int(void *, struct cma *, const struct page *, long unsigned int,  bool *)' {aka 'int(void *, struct cma *, const struct page *, long unsigned int,  _Bool *)'}
     332 |         int __traceiter_##_name(void *__data, proto)                    \
         |             ^~~~~~~~~~~~
   include/linux/tracepoint.h:371:9: note: in expansion of macro '__DEFINE_TRACE_EXT'
     371 |         __DEFINE_TRACE_EXT(_name, NULL, PARAMS(_proto), PARAMS(_args));
         |         ^~~~~~~~~~~~~~~~~~
   include/trace/define_trace.h:85:9: note: in expansion of macro 'DEFINE_TRACE'
      85 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:287:1: note: in expansion of macro 'DECLARE_HOOK'
     287 | DECLARE_HOOK(android_vh_cma_release_bypass,
         | ^~~~~~~~~~~~
   include/linux/tracepoint.h:236:20: note: previous declaration of '__traceiter_android_vh_cma_release_bypass' with type 'int(void *, struct cma *, const struct page *, long unsigned int,  bool *)' {aka 'int(void *, struct cma *, const struct page *, long unsigned int,  _Bool *)'}
     236 |         extern int __traceiter_##name(data_proto);                      \
         |                    ^~~~~~~~~~~~
   include/linux/tracepoint.h:270:9: note: in expansion of macro '__DECLARE_TRACE_COMMON'
     270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TRACE'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:287:1: note: in expansion of macro 'DECLARE_HOOK'
     287 | DECLARE_HOOK(android_vh_cma_release_bypass,
         | ^~~~~~~~~~~~
   include/trace/hooks/mm.h:288:25: warning: 'struct cma' declared inside parameter list will not be visible outside of this definition or declaration
     288 |         TP_PROTO(struct cma *cma, const struct page *pages, unsigned long count,
         |                         ^~~
   include/linux/tracepoint.h:348:48: note: in definition of macro '__DEFINE_TRACE_EXT'
     348 |         void __probestub_##_name(void *__data, proto)                   \
         |                                                ^~~~~
   include/linux/tracepoint.h:371:41: note: in expansion of macro 'PARAMS'
     371 |         __DEFINE_TRACE_EXT(_name, NULL, PARAMS(_proto), PARAMS(_args));
         |                                         ^~~~~~
   include/trace/define_trace.h:85:9: note: in expansion of macro 'DEFINE_TRACE'
      85 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/define_trace.h:85:28: note: in expansion of macro 'PARAMS'
      85 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                            ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:288:9: note: in expansion of macro 'TP_PROTO'
     288 |         TP_PROTO(struct cma *cma, const struct page *pages, unsigned long count,
         |         ^~~~~~~~
>> include/linux/tracepoint.h:348:14: error: conflicting types for '__probestub_android_vh_cma_release_bypass'; have 'void(void *, struct cma *, const struct page *, long unsigned int,  bool *)' {aka 'void(void *, struct cma *, const struct page *, long unsigned int,  _Bool *)'}
     348 |         void __probestub_##_name(void *__data, proto)                   \
         |              ^~~~~~~~~~~~
   include/linux/tracepoint.h:371:9: note: in expansion of macro '__DEFINE_TRACE_EXT'
     371 |         __DEFINE_TRACE_EXT(_name, NULL, PARAMS(_proto), PARAMS(_args));
         |         ^~~~~~~~~~~~~~~~~~
   include/trace/define_trace.h:85:9: note: in expansion of macro 'DEFINE_TRACE'
      85 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:287:1: note: in expansion of macro 'DECLARE_HOOK'
     287 | DECLARE_HOOK(android_vh_cma_release_bypass,
         | ^~~~~~~~~~~~
   include/linux/tracepoint.h:319:14: note: previous declaration of '__probestub_android_vh_cma_release_bypass' with type 'void(void *, struct cma *, const struct page *, long unsigned int,  bool *)' {aka 'void(void *, struct cma *, const struct page *, long unsigned int,  _Bool *)'}
     319 |         void __probestub_##_name(void *__data, proto);                  \
         |              ^~~~~~~~~~~~
   include/linux/tracepoint.h:371:9: note: in expansion of macro '__DEFINE_TRACE_EXT'
     371 |         __DEFINE_TRACE_EXT(_name, NULL, PARAMS(_proto), PARAMS(_args));
         |         ^~~~~~~~~~~~~~~~~~
   include/trace/define_trace.h:85:9: note: in expansion of macro 'DEFINE_TRACE'
      85 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:287:1: note: in expansion of macro 'DECLARE_HOOK'
     287 | DECLARE_HOOK(android_vh_cma_release_bypass,
         | ^~~~~~~~~~~~
   In file included from <command-line>:
>> include/linux/static_call_types.h:15:41: error: conflicting types for '__SCT__tp_func_android_vh_cma_release_bypass'; have 'int(void *, struct cma *, const struct page *, long unsigned int,  bool *)' {aka 'int(void *, struct cma *, const struct page *, long unsigned int,  _Bool *)'}
      15 | #define STATIC_CALL_TRAMP_PREFIX        __SCT__
         |                                         ^~~~~~~
   include/linux/compiler_types.h:96:23: note: in definition of macro '___PASTE'
      96 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/static_call_types.h:18:41: note: in expansion of macro '__PASTE'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                         ^~~~~~~
   include/linux/static_call_types.h:18:49: note: in expansion of macro 'STATIC_CALL_TRAMP_PREFIX'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:39:29: note: in expansion of macro 'STATIC_CALL_TRAMP'
      39 |         extern typeof(func) STATIC_CALL_TRAMP(name);
         |                             ^~~~~~~~~~~~~~~~~
   include/linux/static_call.h:235:9: note: in expansion of macro 'DECLARE_STATIC_CALL'
     235 |         DECLARE_STATIC_CALL(name, _func);                               \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:351:9: note: in expansion of macro 'DEFINE_STATIC_CALL'
     351 |         DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);       \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:371:9: note: in expansion of macro '__DEFINE_TRACE_EXT'
     371 |         __DEFINE_TRACE_EXT(_name, NULL, PARAMS(_proto), PARAMS(_args));
         |         ^~~~~~~~~~~~~~~~~~
   include/trace/define_trace.h:85:9: note: in expansion of macro 'DEFINE_TRACE'
      85 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:287:1: note: in expansion of macro 'DECLARE_HOOK'
     287 | DECLARE_HOOK(android_vh_cma_release_bypass,
         | ^~~~~~~~~~~~
   include/linux/static_call_types.h:15:41: note: previous declaration of '__SCT__tp_func_android_vh_cma_release_bypass' with type 'int(void *, struct cma *, const struct page *, long unsigned int,  bool *)' {aka 'int(void *, struct cma *, const struct page *, long unsigned int,  _Bool *)'}
      15 | #define STATIC_CALL_TRAMP_PREFIX        __SCT__
         |                                         ^~~~~~~
   include/linux/compiler_types.h:96:23: note: in definition of macro '___PASTE'
      96 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/static_call_types.h:18:41: note: in expansion of macro '__PASTE'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                         ^~~~~~~
   include/linux/static_call_types.h:18:49: note: in expansion of macro 'STATIC_CALL_TRAMP_PREFIX'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:39:29: note: in expansion of macro 'STATIC_CALL_TRAMP'
      39 |         extern typeof(func) STATIC_CALL_TRAMP(name);
         |                             ^~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:237:9: note: in expansion of macro 'DECLARE_STATIC_CALL'
     237 |         DECLARE_STATIC_CALL(tp_func_##name, __traceiter_##name);        \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:270:9: note: in expansion of macro '__DECLARE_TRACE_COMMON'
     270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TRACE'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:287:1: note: in expansion of macro 'DECLARE_HOOK'
     287 | DECLARE_HOOK(android_vh_cma_release_bypass,
         | ^~~~~~~~~~~~
   include/trace/hooks/mm.h:292:25: warning: 'struct cma' declared inside parameter list will not be visible outside of this definition or declaration
     292 |         TP_PROTO(struct cma *cma, unsigned long pfn, const struct page *pages,
         |                         ^~~
   include/linux/tracepoint.h:318:47: note: in definition of macro '__DEFINE_TRACE_EXT'
     318 |         int __traceiter_##_name(void *__data, proto);                   \
         |                                               ^~~~~
   include/linux/tracepoint.h:371:41: note: in expansion of macro 'PARAMS'
     371 |         __DEFINE_TRACE_EXT(_name, NULL, PARAMS(_proto), PARAMS(_args));
         |                                         ^~~~~~
   include/trace/define_trace.h:85:9: note: in expansion of macro 'DEFINE_TRACE'
      85 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/define_trace.h:85:28: note: in expansion of macro 'PARAMS'
      85 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                            ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:292:9: note: in expansion of macro 'TP_PROTO'
     292 |         TP_PROTO(struct cma *cma, unsigned long pfn, const struct page *pages,
         |         ^~~~~~~~
>> include/linux/tracepoint.h:318:13: error: conflicting types for '__traceiter_android_vh_cma_alloc_end'; have 'int(void *, struct cma *, long unsigned int,  const struct page *, long unsigned int,  unsigned int,  int)'
     318 |         int __traceiter_##_name(void *__data, proto);                   \
         |             ^~~~~~~~~~~~
   include/linux/tracepoint.h:371:9: note: in expansion of macro '__DEFINE_TRACE_EXT'
     371 |         __DEFINE_TRACE_EXT(_name, NULL, PARAMS(_proto), PARAMS(_args));
         |         ^~~~~~~~~~~~~~~~~~
   include/trace/define_trace.h:85:9: note: in expansion of macro 'DEFINE_TRACE'
      85 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:291:1: note: in expansion of macro 'DECLARE_HOOK'
     291 | DECLARE_HOOK(android_vh_cma_alloc_end,
         | ^~~~~~~~~~~~
   include/linux/tracepoint.h:236:20: note: previous declaration of '__traceiter_android_vh_cma_alloc_end' with type 'int(void *, struct cma *, long unsigned int,  const struct page *, long unsigned int,  unsigned int,  int)'
     236 |         extern int __traceiter_##name(data_proto);                      \
         |                    ^~~~~~~~~~~~
   include/linux/tracepoint.h:270:9: note: in expansion of macro '__DECLARE_TRACE_COMMON'
     270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TRACE'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:291:1: note: in expansion of macro 'DECLARE_HOOK'
     291 | DECLARE_HOOK(android_vh_cma_alloc_end,
         | ^~~~~~~~~~~~
   include/trace/hooks/mm.h:292:25: warning: 'struct cma' declared inside parameter list will not be visible outside of this definition or declaration
     292 |         TP_PROTO(struct cma *cma, unsigned long pfn, const struct page *pages,
         |                         ^~~
   include/linux/tracepoint.h:319:48: note: in definition of macro '__DEFINE_TRACE_EXT'
     319 |         void __probestub_##_name(void *__data, proto);                  \
         |                                                ^~~~~
   include/linux/tracepoint.h:371:41: note: in expansion of macro 'PARAMS'
     371 |         __DEFINE_TRACE_EXT(_name, NULL, PARAMS(_proto), PARAMS(_args));
         |                                         ^~~~~~
   include/trace/define_trace.h:85:9: note: in expansion of macro 'DEFINE_TRACE'
      85 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/define_trace.h:85:28: note: in expansion of macro 'PARAMS'
      85 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                            ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:292:9: note: in expansion of macro 'TP_PROTO'
     292 |         TP_PROTO(struct cma *cma, unsigned long pfn, const struct page *pages,
         |         ^~~~~~~~
   include/trace/hooks/mm.h:292:25: warning: 'struct cma' declared inside parameter list will not be visible outside of this definition or declaration
     292 |         TP_PROTO(struct cma *cma, unsigned long pfn, const struct page *pages,
         |                         ^~~
   include/linux/tracepoint.h:332:47: note: in definition of macro '__DEFINE_TRACE_EXT'
     332 |         int __traceiter_##_name(void *__data, proto)                    \
         |                                               ^~~~~
   include/linux/tracepoint.h:371:41: note: in expansion of macro 'PARAMS'
     371 |         __DEFINE_TRACE_EXT(_name, NULL, PARAMS(_proto), PARAMS(_args));
         |                                         ^~~~~~
   include/trace/define_trace.h:85:9: note: in expansion of macro 'DEFINE_TRACE'
      85 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/define_trace.h:85:28: note: in expansion of macro 'PARAMS'
      85 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                            ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:292:9: note: in expansion of macro 'TP_PROTO'
     292 |         TP_PROTO(struct cma *cma, unsigned long pfn, const struct page *pages,
         |         ^~~~~~~~
   include/linux/tracepoint.h:332:13: error: conflicting types for '__traceiter_android_vh_cma_alloc_end'; have 'int(void *, struct cma *, long unsigned int,  const struct page *, long unsigned int,  unsigned int,  int)'
     332 |         int __traceiter_##_name(void *__data, proto)                    \
         |             ^~~~~~~~~~~~
   include/linux/tracepoint.h:371:9: note: in expansion of macro '__DEFINE_TRACE_EXT'
     371 |         __DEFINE_TRACE_EXT(_name, NULL, PARAMS(_proto), PARAMS(_args));
         |         ^~~~~~~~~~~~~~~~~~
   include/trace/define_trace.h:85:9: note: in expansion of macro 'DEFINE_TRACE'
      85 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:291:1: note: in expansion of macro 'DECLARE_HOOK'
     291 | DECLARE_HOOK(android_vh_cma_alloc_end,
         | ^~~~~~~~~~~~
   include/linux/tracepoint.h:236:20: note: previous declaration of '__traceiter_android_vh_cma_alloc_end' with type 'int(void *, struct cma *, long unsigned int,  const struct page *, long unsigned int,  unsigned int,  int)'
     236 |         extern int __traceiter_##name(data_proto);                      \
         |                    ^~~~~~~~~~~~
   include/linux/tracepoint.h:270:9: note: in expansion of macro '__DECLARE_TRACE_COMMON'
     270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TRACE'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:291:1: note: in expansion of macro 'DECLARE_HOOK'
     291 | DECLARE_HOOK(android_vh_cma_alloc_end,
         | ^~~~~~~~~~~~
   include/trace/hooks/mm.h:292:25: warning: 'struct cma' declared inside parameter list will not be visible outside of this definition or declaration
     292 |         TP_PROTO(struct cma *cma, unsigned long pfn, const struct page *pages,
         |                         ^~~
   include/linux/tracepoint.h:348:48: note: in definition of macro '__DEFINE_TRACE_EXT'
     348 |         void __probestub_##_name(void *__data, proto)                   \
         |                                                ^~~~~
   include/linux/tracepoint.h:371:41: note: in expansion of macro 'PARAMS'
     371 |         __DEFINE_TRACE_EXT(_name, NULL, PARAMS(_proto), PARAMS(_args));
         |                                         ^~~~~~
   include/trace/define_trace.h:85:9: note: in expansion of macro 'DEFINE_TRACE'
      85 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/define_trace.h:85:28: note: in expansion of macro 'PARAMS'
      85 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                            ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:292:9: note: in expansion of macro 'TP_PROTO'
     292 |         TP_PROTO(struct cma *cma, unsigned long pfn, const struct page *pages,
         |         ^~~~~~~~
>> include/linux/tracepoint.h:348:14: error: conflicting types for '__probestub_android_vh_cma_alloc_end'; have 'void(void *, struct cma *, long unsigned int,  const struct page *, long unsigned int,  unsigned int,  int)'
     348 |         void __probestub_##_name(void *__data, proto)                   \
         |              ^~~~~~~~~~~~
   include/linux/tracepoint.h:371:9: note: in expansion of macro '__DEFINE_TRACE_EXT'
     371 |         __DEFINE_TRACE_EXT(_name, NULL, PARAMS(_proto), PARAMS(_args));
         |         ^~~~~~~~~~~~~~~~~~
   include/trace/define_trace.h:85:9: note: in expansion of macro 'DEFINE_TRACE'
      85 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:291:1: note: in expansion of macro 'DECLARE_HOOK'
     291 | DECLARE_HOOK(android_vh_cma_alloc_end,
         | ^~~~~~~~~~~~
   include/linux/tracepoint.h:319:14: note: previous declaration of '__probestub_android_vh_cma_alloc_end' with type 'void(void *, struct cma *, long unsigned int,  const struct page *, long unsigned int,  unsigned int,  int)'
     319 |         void __probestub_##_name(void *__data, proto);                  \
         |              ^~~~~~~~~~~~
   include/linux/tracepoint.h:371:9: note: in expansion of macro '__DEFINE_TRACE_EXT'
     371 |         __DEFINE_TRACE_EXT(_name, NULL, PARAMS(_proto), PARAMS(_args));
         |         ^~~~~~~~~~~~~~~~~~
   include/trace/define_trace.h:85:9: note: in expansion of macro 'DEFINE_TRACE'
      85 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:291:1: note: in expansion of macro 'DECLARE_HOOK'
     291 | DECLARE_HOOK(android_vh_cma_alloc_end,
         | ^~~~~~~~~~~~
>> include/linux/static_call_types.h:15:41: error: conflicting types for '__SCT__tp_func_android_vh_cma_alloc_end'; have 'int(void *, struct cma *, long unsigned int,  const struct page *, long unsigned int,  unsigned int,  int)'
      15 | #define STATIC_CALL_TRAMP_PREFIX        __SCT__
         |                                         ^~~~~~~
   include/linux/compiler_types.h:96:23: note: in definition of macro '___PASTE'
      96 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/static_call_types.h:18:41: note: in expansion of macro '__PASTE'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                         ^~~~~~~
   include/linux/static_call_types.h:18:49: note: in expansion of macro 'STATIC_CALL_TRAMP_PREFIX'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:39:29: note: in expansion of macro 'STATIC_CALL_TRAMP'
      39 |         extern typeof(func) STATIC_CALL_TRAMP(name);
         |                             ^~~~~~~~~~~~~~~~~
   include/linux/static_call.h:235:9: note: in expansion of macro 'DECLARE_STATIC_CALL'
     235 |         DECLARE_STATIC_CALL(name, _func);                               \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:351:9: note: in expansion of macro 'DEFINE_STATIC_CALL'
     351 |         DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);       \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:371:9: note: in expansion of macro '__DEFINE_TRACE_EXT'
     371 |         __DEFINE_TRACE_EXT(_name, NULL, PARAMS(_proto), PARAMS(_args));
         |         ^~~~~~~~~~~~~~~~~~
   include/trace/define_trace.h:85:9: note: in expansion of macro 'DEFINE_TRACE'
      85 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:291:1: note: in expansion of macro 'DECLARE_HOOK'
     291 | DECLARE_HOOK(android_vh_cma_alloc_end,
         | ^~~~~~~~~~~~
   include/linux/static_call_types.h:15:41: note: previous declaration of '__SCT__tp_func_android_vh_cma_alloc_end' with type 'int(void *, struct cma *, long unsigned int,  const struct page *, long unsigned int,  unsigned int,  int)'
      15 | #define STATIC_CALL_TRAMP_PREFIX        __SCT__
         |                                         ^~~~~~~
   include/linux/compiler_types.h:96:23: note: in definition of macro '___PASTE'
      96 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/static_call_types.h:18:41: note: in expansion of macro '__PASTE'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                         ^~~~~~~
   include/linux/static_call_types.h:18:49: note: in expansion of macro 'STATIC_CALL_TRAMP_PREFIX'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:39:29: note: in expansion of macro 'STATIC_CALL_TRAMP'
      39 |         extern typeof(func) STATIC_CALL_TRAMP(name);
         |                             ^~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:237:9: note: in expansion of macro 'DECLARE_STATIC_CALL'
     237 |         DECLARE_STATIC_CALL(tp_func_##name, __traceiter_##name);        \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:270:9: note: in expansion of macro '__DECLARE_TRACE_COMMON'
     270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TRACE'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:291:1: note: in expansion of macro 'DECLARE_HOOK'
     291 | DECLARE_HOOK(android_vh_cma_alloc_end,
         | ^~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/printk.h:8,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:108,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/plist.h:77,
                    from include/linux/pm_qos.h:15,
                    from drivers/android/vendor_hooks.c:8:
   include/linux/tracepoint.h:375:27: error: conflicting types for '__traceiter_android_vh_cma_release_bypass'; have 'int(void *, struct cma *, const struct page *, long unsigned int,  bool *)' {aka 'int(void *, struct cma *, const struct page *, long unsigned int,  _Bool *)'}
     375 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |                           ^~~~~~~~~~~~
   include/linux/export.h:76:28: note: in definition of macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:90:41: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   include/linux/tracepoint.h:375:9: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     375 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |         ^~~~~~~~~~~~~~~~~
   drivers/android/vendor_hooks.c:522:1: note: in expansion of macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     522 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_vh_cma_release_bypass);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:236:20: note: previous declaration of '__traceiter_android_vh_cma_release_bypass' with type 'int(void *, struct cma *, const struct page *, long unsigned int,  bool *)' {aka 'int(void *, struct cma *, const struct page *, long unsigned int,  _Bool *)'}
     236 |         extern int __traceiter_##name(data_proto);                      \
         |                    ^~~~~~~~~~~~
   include/linux/tracepoint.h:270:9: note: in expansion of macro '__DECLARE_TRACE_COMMON'
     270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TRACE'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:287:1: note: in expansion of macro 'DECLARE_HOOK'
     287 | DECLARE_HOOK(android_vh_cma_release_bypass,
         | ^~~~~~~~~~~~
>> include/linux/static_call_types.h:15:41: error: conflicting types for '__SCT__tp_func_android_vh_cma_release_bypass'; have 'int(void *, struct cma *, const struct page *, long unsigned int,  bool *)' {aka 'int(void *, struct cma *, const struct page *, long unsigned int,  _Bool *)'}
      15 | #define STATIC_CALL_TRAMP_PREFIX        __SCT__
         |                                         ^~~~~~~
   include/linux/export.h:76:28: note: in definition of macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:90:41: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   include/linux/static_call.h:278:9: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     278 |         EXPORT_SYMBOL_GPL(STATIC_CALL_TRAMP(name))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:97:22: note: in expansion of macro '___PASTE'
      97 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/static_call_types.h:18:41: note: in expansion of macro '__PASTE'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                         ^~~~~~~
   include/linux/static_call_types.h:18:49: note: in expansion of macro 'STATIC_CALL_TRAMP_PREFIX'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:278:27: note: in expansion of macro 'STATIC_CALL_TRAMP'
     278 |         EXPORT_SYMBOL_GPL(STATIC_CALL_TRAMP(name))
         |                           ^~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:376:9: note: in expansion of macro 'EXPORT_STATIC_CALL_GPL'
     376 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/android/vendor_hooks.c:522:1: note: in expansion of macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     522 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_vh_cma_release_bypass);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:15:41: note: previous declaration of '__SCT__tp_func_android_vh_cma_release_bypass' with type 'int(void *, struct cma *, const struct page *, long unsigned int,  bool *)' {aka 'int(void *, struct cma *, const struct page *, long unsigned int,  _Bool *)'}
      15 | #define STATIC_CALL_TRAMP_PREFIX        __SCT__
         |                                         ^~~~~~~
   include/linux/compiler_types.h:96:23: note: in definition of macro '___PASTE'
      96 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/static_call_types.h:18:41: note: in expansion of macro '__PASTE'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                         ^~~~~~~
   include/linux/static_call_types.h:18:49: note: in expansion of macro 'STATIC_CALL_TRAMP_PREFIX'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:39:29: note: in expansion of macro 'STATIC_CALL_TRAMP'
      39 |         extern typeof(func) STATIC_CALL_TRAMP(name);
         |                             ^~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:237:9: note: in expansion of macro 'DECLARE_STATIC_CALL'
     237 |         DECLARE_STATIC_CALL(tp_func_##name, __traceiter_##name);        \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:270:9: note: in expansion of macro '__DECLARE_TRACE_COMMON'
     270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TRACE'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:287:1: note: in expansion of macro 'DECLARE_HOOK'
     287 | DECLARE_HOOK(android_vh_cma_release_bypass,
         | ^~~~~~~~~~~~
   include/linux/tracepoint.h:375:27: error: conflicting types for '__traceiter_android_vh_cma_alloc_end'; have 'int(void *, struct cma *, long unsigned int,  const struct page *, long unsigned int,  unsigned int,  int)'
     375 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |                           ^~~~~~~~~~~~
   include/linux/export.h:76:28: note: in definition of macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:90:41: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   include/linux/tracepoint.h:375:9: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     375 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |         ^~~~~~~~~~~~~~~~~
   drivers/android/vendor_hooks.c:523:1: note: in expansion of macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     523 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_vh_cma_alloc_end);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:236:20: note: previous declaration of '__traceiter_android_vh_cma_alloc_end' with type 'int(void *, struct cma *, long unsigned int,  const struct page *, long unsigned int,  unsigned int,  int)'
     236 |         extern int __traceiter_##name(data_proto);                      \
         |                    ^~~~~~~~~~~~
   include/linux/tracepoint.h:270:9: note: in expansion of macro '__DECLARE_TRACE_COMMON'
     270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TRACE'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:291:1: note: in expansion of macro 'DECLARE_HOOK'
     291 | DECLARE_HOOK(android_vh_cma_alloc_end,
         | ^~~~~~~~~~~~
>> include/linux/static_call_types.h:15:41: error: conflicting types for '__SCT__tp_func_android_vh_cma_alloc_end'; have 'int(void *, struct cma *, long unsigned int,  const struct page *, long unsigned int,  unsigned int,  int)'
      15 | #define STATIC_CALL_TRAMP_PREFIX        __SCT__
         |                                         ^~~~~~~
   include/linux/export.h:76:28: note: in definition of macro '__EXPORT_SYMBOL'
      76 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:90:41: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   include/linux/static_call.h:278:9: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     278 |         EXPORT_SYMBOL_GPL(STATIC_CALL_TRAMP(name))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:97:22: note: in expansion of macro '___PASTE'
      97 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/static_call_types.h:18:41: note: in expansion of macro '__PASTE'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                         ^~~~~~~
   include/linux/static_call_types.h:18:49: note: in expansion of macro 'STATIC_CALL_TRAMP_PREFIX'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:278:27: note: in expansion of macro 'STATIC_CALL_TRAMP'
     278 |         EXPORT_SYMBOL_GPL(STATIC_CALL_TRAMP(name))
         |                           ^~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:376:9: note: in expansion of macro 'EXPORT_STATIC_CALL_GPL'
     376 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/android/vendor_hooks.c:523:1: note: in expansion of macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     523 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_vh_cma_alloc_end);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:15:41: note: previous declaration of '__SCT__tp_func_android_vh_cma_alloc_end' with type 'int(void *, struct cma *, long unsigned int,  const struct page *, long unsigned int,  unsigned int,  int)'
      15 | #define STATIC_CALL_TRAMP_PREFIX        __SCT__
         |                                         ^~~~~~~
   include/linux/compiler_types.h:96:23: note: in definition of macro '___PASTE'
      96 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/static_call_types.h:18:41: note: in expansion of macro '__PASTE'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                         ^~~~~~~
   include/linux/static_call_types.h:18:49: note: in expansion of macro 'STATIC_CALL_TRAMP_PREFIX'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:39:29: note: in expansion of macro 'STATIC_CALL_TRAMP'
      39 |         extern typeof(func) STATIC_CALL_TRAMP(name);
         |                             ^~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:237:9: note: in expansion of macro 'DECLARE_STATIC_CALL'
     237 |         DECLARE_STATIC_CALL(tp_func_##name, __traceiter_##name);        \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:270:9: note: in expansion of macro '__DECLARE_TRACE_COMMON'
     270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TRACE'
     481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE_EVENT'
      16 | #define DECLARE_HOOK DECLARE_TRACE_EVENT
         |                      ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/mm.h:291:1: note: in expansion of macro 'DECLARE_HOOK'
     291 | DECLARE_HOOK(android_vh_cma_alloc_end,
         | ^~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:132,
                    from include/trace/hooks/dwc3.h:43,
                    from drivers/android/vendor_hooks.c:70:
   include/trace/stages/init.h:2:23: warning: 'str__dwc3__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:3:21: note: in expansion of macro '__app__'
       3 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:132,
                    from include/trace/hooks/softlockup.h:17,
                    from drivers/android/vendor_hooks.c:69:
   include/trace/stages/init.h:2:23: warning: 'str__softlockup__trace_system_name' defined but not used [-Wunused-const-variable=]
       2 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/stages/init.h:3:21: note: in expansion of macro '__app__'
       3 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/stages/init.h:5:29: note: in expansion of macro '__app'
       5 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/stages/init.h:8:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
       8 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/stages/init.h:11:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      11 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/trace_events.h:27,
                    from include/trace/define_trace.h:132,
                    from include/trace/hooks/dmabuf.h:23,

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for P2SB
   Depends on [n]: PCI [=n] && X86 [=y]
   Selected by [y]:
   - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +/__SCT__tp_func_android_vh_cma_release_bypass +290 include/trace/hooks/mm.h

    62	
    63	DECLARE_RESTRICTED_HOOK(android_rvh_set_skip_swapcache_flags,
    64				TP_PROTO(gfp_t *flags),
    65				TP_ARGS(flags), 1);
    66	DECLARE_RESTRICTED_HOOK(android_rvh_set_gfp_zone_flags,
    67				TP_PROTO(gfp_t *flags),
    68				TP_ARGS(flags), 1);
    69	DECLARE_RESTRICTED_HOOK(android_rvh_set_readahead_gfp_mask,
    70				TP_PROTO(gfp_t *flags),
    71				TP_ARGS(flags), 1);
    72	
    73	*/
    74	struct mem_cgroup;
    75	DECLARE_HOOK(android_vh_mem_cgroup_alloc,
    76		TP_PROTO(struct mem_cgroup *memcg),
    77		TP_ARGS(memcg));
    78	DECLARE_HOOK(android_vh_mem_cgroup_free,
    79		TP_PROTO(struct mem_cgroup *memcg),
    80		TP_ARGS(memcg));
    81	DECLARE_HOOK(android_vh_mem_cgroup_id_remove,
    82		TP_PROTO(struct mem_cgroup *memcg),
    83		TP_ARGS(memcg));
    84	struct cgroup_subsys_state;
    85	DECLARE_HOOK(android_vh_mem_cgroup_css_online,
    86		TP_PROTO(struct cgroup_subsys_state *css, struct mem_cgroup *memcg),
    87		TP_ARGS(css, memcg));
    88	DECLARE_HOOK(android_vh_mem_cgroup_css_offline,
    89		TP_PROTO(struct cgroup_subsys_state *css, struct mem_cgroup *memcg),
    90		TP_ARGS(css, memcg));
    91	DECLARE_HOOK(android_vh_slab_alloc_node,
    92		TP_PROTO(void *object, unsigned long addr, struct kmem_cache *s),
    93		TP_ARGS(object, addr, s));
    94	DECLARE_HOOK(android_vh_slab_free,
    95		TP_PROTO(unsigned long addr, struct kmem_cache *s),
    96		TP_ARGS(addr, s));
    97	DECLARE_HOOK(android_vh_meminfo_proc_show,
    98		TP_PROTO(struct seq_file *m),
    99		TP_ARGS(m));
   100	DECLARE_HOOK(android_vh_exit_mm,
   101		TP_PROTO(struct mm_struct *mm),
   102		TP_ARGS(mm));
   103	DECLARE_HOOK(android_vh_show_mem,
   104		TP_PROTO(unsigned int filter, nodemask_t *nodemask),
   105		TP_ARGS(filter, nodemask));
   106	DECLARE_HOOK(android_vh_print_slabinfo_header,
   107		TP_PROTO(struct seq_file *m),
   108		TP_ARGS(m));
   109	struct slabinfo;
   110	DECLARE_HOOK(android_vh_cache_show,
   111		TP_PROTO(struct seq_file *m, struct slabinfo *sinfo, struct kmem_cache *s),
   112		TP_ARGS(m, sinfo, s));
   113	DECLARE_HOOK(android_vh_ra_tuning_max_page,
   114		TP_PROTO(struct readahead_control *ractl, unsigned long *max_page),
   115		TP_ARGS(ractl, max_page));
   116	DECLARE_RESTRICTED_HOOK(android_rvh_vmalloc_node_bypass,
   117		TP_PROTO(unsigned long size, gfp_t gfp_mask, void **addr),
   118		TP_ARGS(size, gfp_mask, addr), 1);
   119	DECLARE_RESTRICTED_HOOK(android_rvh_vfree_bypass,
   120		TP_PROTO(const void *addr, bool *bypass),
   121		TP_ARGS(addr, bypass), 1);
   122	DECLARE_HOOK(android_vh_should_fault_around,
   123		TP_PROTO(struct vm_fault *vmf, bool *should_around),
   124		TP_ARGS(vmf, should_around));
   125	DECLARE_HOOK(android_vh_process_madvise_begin,
   126		TP_PROTO(struct task_struct *task, int behavior),
   127		TP_ARGS(task, behavior));
   128	DECLARE_HOOK(android_vh_process_madvise_iter,
   129		TP_PROTO(struct mm_struct *mm, int behavior, ssize_t *ret),
   130		TP_ARGS(mm, behavior, ret));
   131	DECLARE_HOOK(android_vh_madvise_swapin_walk_pmd_entry,
   132		TP_PROTO(swp_entry_t entry),
   133		TP_ARGS(entry));
   134	DECLARE_HOOK(android_vh_process_madvise,
   135		TP_PROTO(int behavior, ssize_t *ret, void *priv),
   136		TP_ARGS(behavior, ret, priv));
   137	DECLARE_RESTRICTED_HOOK(android_rvh_ctl_dirty_rate,
   138		TP_PROTO(struct inode *inode),
   139		TP_ARGS(inode), 1);
   140	DECLARE_HOOK(android_vh_adjust_kvmalloc_flags,
   141		TP_PROTO(unsigned int order, gfp_t *alloc_flags),
   142		TP_ARGS(order, alloc_flags));
   143	DECLARE_HOOK(android_vh_alloc_pages_reclaim_bypass,
   144	    TP_PROTO(gfp_t gfp_mask, int order, int alloc_flags,
   145		int migratetype, struct page **page),
   146		TP_ARGS(gfp_mask, order, alloc_flags, migratetype, page));
   147	DECLARE_HOOK(android_vh_alloc_pages_failure_bypass,
   148		TP_PROTO(gfp_t gfp_mask, int order, int alloc_flags,
   149		int migratetype, struct page **page),
   150		TP_ARGS(gfp_mask, order, alloc_flags, migratetype, page));
   151	DECLARE_HOOK(android_vh_kmalloc_large_alloced,
   152		TP_PROTO(struct folio *folio, unsigned int order, gfp_t flags),
   153		TP_ARGS(folio, order, flags));
   154	DECLARE_HOOK(android_vh_count_workingset_refault,
   155		TP_PROTO(struct folio *folio),
   156		TP_ARGS(folio));
   157	DECLARE_HOOK(android_vh_tune_mmap_readaround,
   158		TP_PROTO(unsigned int ra_pages, pgoff_t pgoff,
   159			pgoff_t *start, unsigned int *size, unsigned int *async_size),
   160		TP_ARGS(ra_pages, pgoff, start, size, async_size));
   161	DECLARE_HOOK(android_vh_page_should_be_protected,
   162		TP_PROTO(struct folio *folio, unsigned long nr_scanned,
   163		s8 priority, int *should_protect),
   164		TP_ARGS(folio, nr_scanned, priority, should_protect));
   165	DECLARE_HOOK(android_vh_slab_folio_alloced,
   166		TP_PROTO(unsigned int order, gfp_t flags),
   167		TP_ARGS(order, flags));
   168	DECLARE_HOOK(android_vh_rmqueue_smallest_bypass,
   169		TP_PROTO(struct page **page, struct zone *zone, int order, int migratetype),
   170		TP_ARGS(page, zone, order, migratetype));
   171	DECLARE_HOOK(android_vh_free_one_page_bypass,
   172		TP_PROTO(struct page *page, struct zone *zone, int order, int migratetype,
   173			int fpi_flags, bool *bypass),
   174		TP_ARGS(page, zone, order, migratetype, fpi_flags, bypass));
   175	DECLARE_HOOK(android_vh_reserve_highatomic_bypass,
   176		TP_PROTO(struct page *page, bool *bypass),
   177		TP_ARGS(page, bypass));
   178	DECLARE_HOOK(android_vh_migration_target_bypass,
   179		TP_PROTO(struct page *page, bool *bypass),
   180		TP_ARGS(page, bypass));
   181	DECLARE_HOOK(android_vh_watermark_fast_ok,
   182		TP_PROTO(unsigned int order, gfp_t gfp_mask, bool *is_watermark_ok),
   183		TP_ARGS(order, gfp_mask, is_watermark_ok));
   184	DECLARE_HOOK(android_vh_meminfo_cache_adjust,
   185		TP_PROTO(unsigned long *cached),
   186		TP_ARGS(cached));
   187	DECLARE_HOOK(android_vh_si_mem_available_adjust,
   188		TP_PROTO(unsigned long *available),
   189		TP_ARGS(available));
   190	DECLARE_HOOK(android_vh_si_meminfo_adjust,
   191		TP_PROTO(unsigned long *totalram, unsigned long *freeram),
   192		TP_ARGS(totalram, freeram));
   193	DECLARE_HOOK(android_vh_si_meminfo_adjust_shmem,
   194		TP_PROTO(unsigned long *sharedram),
   195		TP_ARGS(sharedram));
   196	DECLARE_HOOK(android_vh_compact_finished,
   197		TP_PROTO(bool *abort_compact),
   198		TP_ARGS(abort_compact));
   199	DECLARE_HOOK(android_vh_compact_bypass,
   200		TP_PROTO(struct compact_control *cc, bool *bypass),
   201		TP_ARGS(cc, bypass));
   202	DECLARE_HOOK(android_vh_madvise_cold_or_pageout_abort,
   203		TP_PROTO(struct vm_area_struct *vma, bool *abort_madvise),
   204		TP_ARGS(vma, abort_madvise));
   205	DECLARE_HOOK(android_vh_page_cache_ra_order_bypass,
   206		TP_PROTO(struct readahead_control *ractl, struct file_ra_state *ra,
   207			 int new_order, gfp_t *gfp, bool *bypass),
   208		TP_ARGS(ractl, ra, new_order, gfp, bypass));
   209	DECLARE_HOOK(android_vh_alloc_pages_slowpath_start,
   210		TP_PROTO(u64 *stime),
   211		TP_ARGS(stime));
   212	DECLARE_HOOK(android_vh_alloc_pages_slowpath_end,
   213		TP_PROTO(gfp_t *gfp_mask, unsigned int order, unsigned long alloc_start,
   214			u64 stime, unsigned long did_some_progress,
   215			unsigned long pages_reclaimed, int retry_loop_count),
   216		TP_ARGS(gfp_mask, order, alloc_start, stime, did_some_progress,
   217			pages_reclaimed, retry_loop_count));
   218	DECLARE_RESTRICTED_HOOK(android_rvh_alloc_pages_reclaim_start,
   219		TP_PROTO(gfp_t gfp_mask, int order, int *alloc_flags),
   220		TP_ARGS(gfp_mask, order, alloc_flags), 3);
   221	DECLARE_RESTRICTED_HOOK(android_rvh_alloc_pages_reclaim_cycle_end,
   222		TP_PROTO(gfp_t gfp_mask, int order, int *alloc_flags,
   223		unsigned long *did_some_progress, int *no_progress_loops,
   224		unsigned long direct_reclaim_retries),
   225		TP_ARGS(gfp_mask, order, alloc_flags, did_some_progress,
   226		no_progress_loops, direct_reclaim_retries), 6);
   227	DECLARE_HOOK(android_vh_filemap_pages,
   228		TP_PROTO(struct folio *folio),
   229		TP_ARGS(folio));
   230	DECLARE_HOOK(android_vh_lru_gen_add_folio_skip,
   231		TP_PROTO(struct lruvec *lruvec, struct folio *folio, bool *skip),
   232		TP_ARGS(lruvec, folio, skip));
   233	DECLARE_HOOK(android_vh_lru_gen_del_folio_skip,
   234		TP_PROTO(struct lruvec *lruvec, struct folio *folio, bool *skip),
   235		TP_ARGS(lruvec, folio, skip));
   236	DECLARE_HOOK(android_vh_add_lazyfree_bypass,
   237		TP_PROTO(struct lruvec *lruvec, struct folio *folio, bool *bypass),
   238		TP_ARGS(lruvec, folio, bypass));
   239	DECLARE_HOOK(android_vh_oom_reaper_delay_bypass,
   240		TP_PROTO(struct task_struct *tsk, bool *bypass),
   241		TP_ARGS(tsk, bypass));
   242	DECLARE_HOOK(android_vh_pagetypeinfo_show,
   243		TP_PROTO(struct seq_file *m),
   244		TP_ARGS(m));
   245	DECLARE_HOOK(android_vh_get_page_wmark,
   246		TP_PROTO(unsigned int alloc_flags, unsigned long *page_wmark),
   247		TP_ARGS(alloc_flags, page_wmark));
   248	DECLARE_HOOK(android_vh_page_add_new_anon_rmap,
   249		TP_PROTO(struct page *page, struct vm_area_struct *vma,
   250			unsigned long address),
   251		TP_ARGS(page, vma, address));
   252	struct page_vma_mapped_walk;
   253	DECLARE_HOOK(android_vh_test_clear_look_around_ref,
   254		TP_PROTO(struct page *page),
   255		TP_ARGS(page));
   256	DECLARE_HOOK(android_vh_look_around_migrate_folio,
   257		TP_PROTO(struct folio *old_folio, struct folio *new_folio),
   258		TP_ARGS(old_folio, new_folio));
   259	DECLARE_HOOK(android_vh_look_around,
   260		TP_PROTO(struct page_vma_mapped_walk *pvmw, struct folio *folio,
   261			struct vm_area_struct *vma, int *referenced),
   262		TP_ARGS(pvmw, folio, vma, referenced));
   263	DECLARE_HOOK(android_vh_free_unref_page_bypass,
   264		TP_PROTO(struct page *page, int order, int migratetype, bool *bypass),
   265		TP_ARGS(page, order, migratetype, bypass));
   266	DECLARE_HOOK(android_vh_kvmalloc_node_use_vmalloc,
   267		TP_PROTO(size_t size, gfp_t *kmalloc_flags, bool *use_vmalloc),
   268		TP_ARGS(size, kmalloc_flags, use_vmalloc));
   269	DECLARE_HOOK(android_vh_should_alloc_pages_retry,
   270		TP_PROTO(gfp_t gfp_mask, int order, int *alloc_flags,
   271		int migratetype, struct zone *preferred_zone, struct page **page, bool *should_alloc_retry),
   272		TP_ARGS(gfp_mask, order, alloc_flags,
   273			migratetype, preferred_zone, page, should_alloc_retry));
   274	DECLARE_HOOK(android_vh_unreserve_highatomic_bypass,
   275		TP_PROTO(bool force, struct zone *zone, bool *skip_unreserve_highatomic),
   276		TP_ARGS(force, zone, skip_unreserve_highatomic));
   277	DECLARE_HOOK(android_vh_rmqueue_bulk_bypass,
   278		TP_PROTO(unsigned int order, struct per_cpu_pages *pcp, int migratetype,
   279			struct list_head *list),
   280		TP_ARGS(order, pcp, migratetype, list));
   281	DECLARE_HOOK(android_vh_thaw_killed_process,
   282		TP_PROTO(bool *thaw),
   283		TP_ARGS(thaw));
   284	DECLARE_HOOK(android_vh_cma_alloc_retry,
   285		TP_PROTO(char *name, int *retry),
   286		TP_ARGS(name, retry));
   287	DECLARE_HOOK(android_vh_cma_release_bypass,
   288		TP_PROTO(struct cma *cma, const struct page *pages, unsigned long count,
   289			bool *bypass),
 > 290		TP_ARGS(cma, pages, count, bypass));
   291	DECLARE_HOOK(android_vh_cma_alloc_end,
   292		TP_PROTO(struct cma *cma, unsigned long pfn, const struct page *pages,
   293			unsigned long count, unsigned int align, int ret),
 > 294		TP_ARGS(cma, pfn, pages, count, align, ret));
   295	DECLARE_HOOK(android_vh_wp_page_reuse,
   296		TP_PROTO(struct vm_fault *vmf, struct folio *folio),
   297		TP_ARGS(vmf, folio));
   298	DECLARE_HOOK(android_vh_page_cache_readahead_start,
   299		TP_PROTO(struct file *file, pgoff_t pgoff,
   300			unsigned int size, bool sync),
   301		TP_ARGS(file, pgoff, size, sync));
   302	DECLARE_HOOK(android_vh_page_cache_readahead_end,
   303		TP_PROTO(struct file *file, pgoff_t pgoff),
   304		TP_ARGS(file, pgoff));
   305	DECLARE_HOOK(android_vh_filemap_fault_start,
   306		TP_PROTO(struct file *file, pgoff_t pgoff),
   307		TP_ARGS(file, pgoff));
   308	DECLARE_HOOK(android_vh_filemap_fault_end,
   309		TP_PROTO(struct file *file, pgoff_t pgoff),
   310		TP_ARGS(file, pgoff));
   311	DECLARE_HOOK(android_vh_free_unref_folios_to_pcp_bypass,
   312		TP_PROTO(struct folio_batch *folios, bool *bypass),
   313		TP_ARGS(folios, bypass));
   314	DECLARE_HOOK(android_vh_drain_all_pages_bypass,
   315		TP_PROTO(gfp_t gfp_mask, unsigned int order, unsigned long alloc_flags,
   316			int migratetype, unsigned long did_some_progress,
   317			bool *bypass),
   318		TP_ARGS(gfp_mask, order, alloc_flags, migratetype, did_some_progress, bypass));
   319	DECLARE_HOOK(android_vh_save_track_hash,
   320		TP_PROTO(bool alloc, struct track *p),
   321		TP_ARGS(alloc, p));
   322	DECLARE_HOOK(android_vh_kmalloc_slab,
   323		TP_PROTO(unsigned int index, gfp_t flags, struct kmem_cache **s),
   324		TP_ARGS(index, flags, s));
   325	DECLARE_HOOK(android_vh_customize_alloc_gfp,
   326		TP_PROTO(gfp_t *alloc_gfp, unsigned int order),
   327		TP_ARGS(alloc_gfp, order));
   328	DECLARE_HOOK(android_vh_init_adjust_zone_wmark,
   329		TP_PROTO(struct zone *zone, u64 interval),
   330		TP_ARGS(zone, interval));
   331	DECLARE_HOOK(android_vh_oom_evaluate_task_bypass,
   332		TP_PROTO(struct task_struct *task, struct oom_control *oc, bool *bypass),
   333		TP_ARGS(task, oc, bypass));
   334	DECLARE_HOOK(android_vh_folio_add_lru_folio_activate,
   335		TP_PROTO(struct folio *folio, bool *bypass),
   336		TP_ARGS(folio, bypass));
   337	DECLARE_HOOK(android_vh_filemap_fault_pre_folio_locked,
   338		TP_PROTO(struct folio *folio),
   339		TP_ARGS(folio));
   340	DECLARE_HOOK(android_vh_filemap_folio_mapped,
   341		TP_PROTO(struct folio *folio),
   342		TP_ARGS(folio));
   343	DECLARE_HOOK(android_vh_folio_remove_rmap_ptes,
   344		TP_PROTO(struct folio *folio),
   345		TP_ARGS(folio));
   346	DECLARE_HOOK(android_vh_filemap_get_folio_end,
   347		TP_PROTO(struct address_space *mapping, struct folio *folio),
   348		TP_ARGS(mapping, folio));
   349	DECLARE_HOOK(android_vh_adjust_swap_info_flags,
   350		TP_PROTO(unsigned long *flags),
   351		TP_ARGS(flags));
   352	DECLARE_HOOK(android_vh_smaps_pte_entry,
   353		TP_PROTO(swp_entry_t entry, int mapcount,
   354			unsigned long *swap_shared, unsigned long *writeback,
   355			unsigned long *same, unsigned long *huge),
   356		TP_ARGS(entry, mapcount, swap_shared, writeback, same, huge));
   357	DECLARE_HOOK(android_vh_show_smap,
   358		TP_PROTO(struct seq_file *m,
   359			unsigned long swap_shared, unsigned long writeback,
   360			unsigned long same, unsigned long huge),
   361		TP_ARGS(m, swap_shared, writeback, same, huge));
   362	DECLARE_HOOK(android_vh_alloc_contig_range_not_isolated,
   363		TP_PROTO(unsigned long start, unsigned end),
   364		TP_ARGS(start, end));
   365	DECLARE_HOOK(android_vh_warn_alloc_tune_ratelimit,
   366		TP_PROTO(struct ratelimit_state *rs),
   367		TP_ARGS(rs));
   368	DECLARE_HOOK(android_vh_warn_alloc_show_mem_bypass,
   369		TP_PROTO(bool *bypass),
   370		TP_ARGS(bypass));
   371	DECLARE_HOOK(android_vh_free_pages_prepare_bypass,
   372		TP_PROTO(struct page *page, unsigned int order,
   373			int __bitwise flags, bool *skip_free_pages_prepare),
   374		TP_ARGS(page, order, flags, skip_free_pages_prepare));
   375	DECLARE_HOOK(android_vh_free_pages_ok_bypass,
   376		TP_PROTO(struct page *page, unsigned int order,
   377			int __bitwise flags, bool *skip_free_pages_ok),
   378		TP_ARGS(page, order, flags, skip_free_pages_ok));
   379	DECLARE_HOOK(android_vh_free_page_bypass,
   380		TP_PROTO(struct page *page, unsigned int order, bool *skip_free_page),
   381		TP_ARGS(page, order, skip_free_page));
   382	DECLARE_HOOK(android_vh_free_folio_bypass,
   383		TP_PROTO(struct folio *folio, unsigned int order, bool *skip_free_folio),
   384		TP_ARGS(folio, order, skip_free_folio));
   385	DECLARE_HOOK(android_vh_split_large_folio_bypass,
   386		TP_PROTO(bool *bypass),
   387		TP_ARGS(bypass));
   388	DECLARE_HOOK(android_vh_do_read_fault,
   389		TP_PROTO(struct vm_fault *vmf, unsigned long fault_around_bytes),
   390		TP_ARGS(vmf, fault_around_bytes));
   391	DECLARE_HOOK(android_vh_filemap_read,
   392		TP_PROTO(struct file *file, loff_t pos, size_t size),
   393		TP_ARGS(file, pos, size));
   394	DECLARE_HOOK(android_vh_filemap_map_pages,
   395		TP_PROTO(struct file *file, pgoff_t first_pgoff,
   396			pgoff_t last_pgoff, vm_fault_t ret),
   397		TP_ARGS(file, first_pgoff, last_pgoff, ret));
   398	DECLARE_HOOK(android_vh_zs_shrinker_adjust,
   399		TP_PROTO(unsigned long *pages_to_free),
   400		TP_ARGS(pages_to_free));
   401	DECLARE_HOOK(android_vh_zs_shrinker_bypass,
   402		TP_PROTO(bool *bypass),
   403		TP_ARGS(bypass));
   404	DECLARE_HOOK(android_vh_adjust_nr_reclaimed,
   405		TP_PROTO(struct folio *folio, unsigned int *nr_reclaimed),
   406		TP_ARGS(folio, nr_reclaimed));
   407	DECLARE_HOOK(android_vh_mmap_region,
   408		TP_PROTO(struct vm_area_struct *vma, unsigned long addr),
   409		TP_ARGS(vma, addr));
   410	DECLARE_HOOK(android_vh_try_to_unmap_one,
   411		TP_PROTO(struct folio *folio, struct vm_area_struct *vma,
   412			unsigned long addr, void *arg, bool ret),
   413		TP_ARGS(folio, vma, addr, arg, ret));
   414	DECLARE_HOOK(android_vh_swap_writepage,
   415		TP_PROTO(unsigned long *sis_flags, struct page *page),
   416		TP_ARGS(sis_flags, page));
   417	DECLARE_HOOK(android_vh_rmqueue_pcplist_override_batch,
   418		TP_PROTO(int *batch),
   419		TP_ARGS(batch));
   420	DECLARE_HOOK(android_vh_save_vmalloc_stack,
   421		TP_PROTO(unsigned long flags, struct vm_struct *vm),
   422		TP_ARGS(flags, vm));
   423	DECLARE_HOOK(android_vh_show_stack_hash,
   424		TP_PROTO(struct seq_file *m, struct vm_struct *v),
   425		TP_ARGS(m, v));
   426	DECLARE_HOOK(android_vh_calc_alloc_flags,
   427		TP_PROTO(gfp_t gfp_mask, unsigned int *alloc_flags,
   428			bool *bypass),
   429		TP_ARGS(gfp_mask, alloc_flags, bypass));
   430	DECLARE_HOOK(android_vh_task_mem,
   431		TP_PROTO(struct seq_file *m, struct mm_struct *mm),
   432		TP_ARGS(m, mm));
   433	DECLARE_HOOK(android_vh_mem_cgroup_charge,
   434		TP_PROTO(struct folio *folio, struct mem_cgroup **memcg),
   435		TP_ARGS(folio, memcg));
   436	DECLARE_HOOK(android_vh_filemap_add_folio,
   437		TP_PROTO(struct address_space *mapping, struct folio *folio,
   438			pgoff_t index),
   439		TP_ARGS(mapping, folio, index));
   440	DECLARE_HOOK(android_vh_folio_add_file_rmap,
   441		TP_PROTO(struct folio *folio, struct page *page, int nr_pages,
   442			 int level),
   443		TP_ARGS(folio, page, nr_pages, level));
   444	DECLARE_HOOK(android_vh_folio_remove_rmap,
   445		TP_PROTO(struct folio *folio, struct page *page, int nr_pages,
   446			 int level),
   447		TP_ARGS(folio, page, nr_pages, level));
   448	DECLARE_HOOK(android_vh_folios_put_refs_direct_free_extent,
   449		TP_PROTO(struct folio *folio, unsigned int nr_refs,
   450			 struct lruvec **lruvec, unsigned long flags, bool *direct_free),
   451		TP_ARGS(folio, nr_refs, lruvec, flags, direct_free));
   452	DECLARE_HOOK(android_vh_free_pages_and_swap_cache,
   453		TP_PROTO(struct folio *folio),
   454		TP_ARGS(folio));
   455	DECLARE_HOOK(android_vh_do_anonymous_page,
   456		TP_PROTO(struct vm_area_struct *vma, struct folio *folio),
   457		TP_ARGS(vma, folio));
   458	DECLARE_HOOK(android_vh_do_swap_page,
   459		TP_PROTO(struct folio *folio, pte_t *pte, struct vm_fault *vmf,
   460			swp_entry_t entry),
   461		TP_ARGS(folio, pte, vmf, entry));
   462	DECLARE_HOOK(android_vh_do_wp_page,
   463		TP_PROTO(struct folio *folio),
   464		TP_ARGS(folio));
   465	DECLARE_HOOK(android_vh_shmem_swapin_folio,
   466		TP_PROTO(struct folio *folio),
   467		TP_ARGS(folio));
   468	DECLARE_HOOK(android_vh_uprobes_uprobe_write,
   469		TP_PROTO(struct folio *new_folio, struct folio *old_folio),
   470		TP_ARGS(new_folio, old_folio));
   471	DECLARE_HOOK(android_vh_lock_folio_drop_mmap_start,
   472		TP_PROTO(struct task_struct **tsk, struct vm_fault *vmf,
   473			struct folio *folio, struct file *file),
   474		TP_ARGS(tsk, vmf, folio, file));
   475	DECLARE_HOOK(android_vh_lock_folio_drop_mmap_end,
   476		TP_PROTO(bool success, struct task_struct **tsk, struct vm_fault *vmf,
   477			struct folio *folio, struct file *file),
   478		TP_ARGS(success, tsk, vmf, folio, file));
   479	DECLARE_HOOK(android_vh_filemap_update_page,
   480		TP_PROTO(struct address_space *mapping, struct folio *folio,
   481			struct file *file),
   482		TP_ARGS(mapping, folio, file));
   483	#endif /* _TRACE_HOOK_MM_H */
   484	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
