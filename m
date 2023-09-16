Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796BE12B9D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Sep 2023 21:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694899707; x=1726435707;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fRafPQ4WrvwtB93h1sRIMHtU+cvY4HwVt+zzqGzRMbo=;
  b=BeEEUhFrI8mqcj+M1Gv/VY5JZyL9wusMqnxLrtQOJXCm3mRsJV/pysge
   9+NZ2VQgvrpPWVTnWJjPuPDkBbKBzycQ/5mNRVT+pVf2gWBRexHjsXkv9
   25mOKfFY6ZYD0oopaSgS55ZG1u69ElLKRTbCiENUy6lHGKfIsLzoUbuk3
   r+RXotiLo/njw+UXTDKy97vTUAOgijn09i1U6YvnAJBMFdexgnRdM9AfI
   h3XdGOXlugBE2Ib/HxzjR9ZMJUjkTBAy63TwmV4HJi9J0uhTgn5/m04ZB
   j1WSsjTKpaKilIQSEuXfTPdFlvgTXfBVjFb+/f9DqVRmm1MsDAxuvs5+x
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="359700167"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="359700167"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 14:28:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="835606077"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="835606077"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Sep 2023 14:28:22 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhcpw-0004f4-29;
	Sat, 16 Sep 2023 21:28:20 +0000
Date: Sun, 17 Sep 2023 05:27:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/2] include/trace/hooks/mm.h:255:17:
 error: passing argument 2 of '__SCT__tp_func_android_vh_cma_alloc_bypass'
 from incompatible pointer type
Message-ID: <202309170558.UEhTPQpT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   f9a1230327dc4d4a5a2b9e519e7bbe4289f660ad
commit: d1051298accfaf483bfbf82cb667ce3ead2206b4 [1/2] ANDROID: vendor_hooks: add vendor hook in cma_alloc()
config: i386-randconfig-061-20230915 (https://download.01.org/0day-ci/archive/20230917/202309170558.UEhTPQpT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230917/202309170558.UEhTPQpT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309170558.UEhTPQpT-lkp@intel.com/

Note: the android-common/android13-5.15 HEAD f9a1230327dc4d4a5a2b9e519e7bbe4289f660ad builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from include/trace/hooks/vendor_hooks.h:11,
                    from include/trace/hooks/mm.h:19,
                    from drivers/android/vendor_hooks.c:62:
   include/trace/hooks/mm.h:253:25: warning: 'struct cma' declared inside parameter list will not be visible outside of this definition or declaration
     253 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |                         ^~~
   include/linux/tracepoint.h:241:39: note: in definition of macro '__DECLARE_TRACE'
     241 |         extern int __traceiter_##name(data_proto);                      \
         |                                       ^~~~~~~~~~
   include/linux/tracepoint.h:418:25: note: in expansion of macro 'PARAMS'
     418 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:253:9: note: in expansion of macro 'TP_PROTO'
     253 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |         ^~~~~~~~
   include/trace/hooks/mm.h:253:25: warning: 'struct cma' declared inside parameter list will not be visible outside of this definition or declaration
     253 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |                         ^~~
   include/linux/tracepoint.h:244:49: note: in definition of macro '__DECLARE_TRACE'
     244 |         static inline void __nocfi trace_##name(proto)                          \
         |                                                 ^~~~~
   include/linux/tracepoint.h:416:31: note: in expansion of macro 'PARAMS'
     416 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                               ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:253:9: note: in expansion of macro 'TP_PROTO'
     253 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |         ^~~~~~~~
   include/trace/hooks/mm.h: In function 'trace_android_vh_cma_alloc_bypass':
>> include/trace/hooks/mm.h:255:17: error: passing argument 2 of '__SCT__tp_func_android_vh_cma_alloc_bypass' from incompatible pointer type [-Werror=incompatible-pointer-types]
     255 |         TP_ARGS(cma, count, align, no_warn, page, bypass));
         |                 ^~~
         |                 |
         |                 struct cma *
   include/linux/tracepoint.h:173:61: note: in definition of macro '__DO_TRACE_CALL'
     173 |                         static_call(tp_func_##name)(__data, args);      \
         |                                                             ^~~~
   include/linux/tracepoint.h:206:39: note: in expansion of macro 'TP_ARGS'
     206 |                 __DO_TRACE_CALL(name, TP_ARGS(args));                   \
         |                                       ^~~~~~~
   include/linux/tracepoint.h:247:25: note: in expansion of macro '__DO_TRACE'
     247 |                         __DO_TRACE(name,                                \
         |                         ^~~~~~~~~~
   include/linux/tracepoint.h:248:33: note: in expansion of macro 'TP_ARGS'
     248 |                                 TP_ARGS(args),                          \
         |                                 ^~~~~~~
   include/linux/tracepoint.h:416:9: note: in expansion of macro '__DECLARE_TRACE'
     416 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:416:46: note: in expansion of macro 'PARAMS'
     416 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                                              ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:255:9: note: in expansion of macro 'TP_ARGS'
     255 |         TP_ARGS(cma, count, align, no_warn, page, bypass));
         |         ^~~~~~~
   include/trace/hooks/mm.h:255:17: note: expected 'struct cma *' but argument is of type 'struct cma *'
     255 |         TP_ARGS(cma, count, align, no_warn, page, bypass));
         |                 ^~~
   include/linux/tracepoint.h:173:61: note: in definition of macro '__DO_TRACE_CALL'
     173 |                         static_call(tp_func_##name)(__data, args);      \
         |                                                             ^~~~
   include/linux/tracepoint.h:206:39: note: in expansion of macro 'TP_ARGS'
     206 |                 __DO_TRACE_CALL(name, TP_ARGS(args));                   \
         |                                       ^~~~~~~
   include/linux/tracepoint.h:247:25: note: in expansion of macro '__DO_TRACE'
     247 |                         __DO_TRACE(name,                                \
         |                         ^~~~~~~~~~
   include/linux/tracepoint.h:248:33: note: in expansion of macro 'TP_ARGS'
     248 |                                 TP_ARGS(args),                          \
         |                                 ^~~~~~~
   include/linux/tracepoint.h:416:9: note: in expansion of macro '__DECLARE_TRACE'
     416 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:416:46: note: in expansion of macro 'PARAMS'
     416 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                                              ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:255:9: note: in expansion of macro 'TP_ARGS'
     255 |         TP_ARGS(cma, count, align, no_warn, page, bypass));
         |         ^~~~~~~
   include/trace/hooks/mm.h: At top level:
   include/trace/hooks/mm.h:253:25: warning: 'struct cma' declared inside parameter list will not be visible outside of this definition or declaration
     253 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |                         ^~~
   include/linux/tracepoint.h:218:51: note: in definition of macro '__DECLARE_TRACE_RCU'
     218 |         static inline void trace_##name##_rcuidle(proto)                \
         |                                                   ^~~~~
   include/linux/tracepoint.h:254:35: note: in expansion of macro 'PARAMS'
     254 |         __DECLARE_TRACE_RCU(name, PARAMS(proto), PARAMS(args),          \
         |                                   ^~~~~~
   include/linux/tracepoint.h:416:9: note: in expansion of macro '__DECLARE_TRACE'
     416 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:416:31: note: in expansion of macro 'PARAMS'
     416 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                               ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:253:9: note: in expansion of macro 'TP_PROTO'
     253 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |         ^~~~~~~~
   include/trace/hooks/mm.h: In function 'trace_android_vh_cma_alloc_bypass_rcuidle':
>> include/trace/hooks/mm.h:255:17: error: passing argument 2 of '__SCT__tp_func_android_vh_cma_alloc_bypass' from incompatible pointer type [-Werror=incompatible-pointer-types]
     255 |         TP_ARGS(cma, count, align, no_warn, page, bypass));
         |                 ^~~
         |                 |
         |                 struct cma *
   include/linux/tracepoint.h:173:61: note: in definition of macro '__DO_TRACE_CALL'
     173 |                         static_call(tp_func_##name)(__data, args);      \
         |                                                             ^~~~
   include/linux/tracepoint.h:206:39: note: in expansion of macro 'TP_ARGS'
     206 |                 __DO_TRACE_CALL(name, TP_ARGS(args));                   \
         |                                       ^~~~~~~
   include/linux/tracepoint.h:221:25: note: in expansion of macro '__DO_TRACE'
     221 |                         __DO_TRACE(name,                                \
         |                         ^~~~~~~~~~
   include/linux/tracepoint.h:222:33: note: in expansion of macro 'TP_ARGS'
     222 |                                 TP_ARGS(args),                          \
         |                                 ^~~~~~~
   include/linux/tracepoint.h:254:9: note: in expansion of macro '__DECLARE_TRACE_RCU'
     254 |         __DECLARE_TRACE_RCU(name, PARAMS(proto), PARAMS(args),          \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:254:50: note: in expansion of macro 'PARAMS'
     254 |         __DECLARE_TRACE_RCU(name, PARAMS(proto), PARAMS(args),          \
         |                                                  ^~~~~~
   include/linux/tracepoint.h:416:9: note: in expansion of macro '__DECLARE_TRACE'
     416 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:416:46: note: in expansion of macro 'PARAMS'
     416 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                                              ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:255:9: note: in expansion of macro 'TP_ARGS'
     255 |         TP_ARGS(cma, count, align, no_warn, page, bypass));
         |         ^~~~~~~
   include/trace/hooks/mm.h:255:17: note: expected 'struct cma *' but argument is of type 'struct cma *'
     255 |         TP_ARGS(cma, count, align, no_warn, page, bypass));
         |                 ^~~
   include/linux/tracepoint.h:173:61: note: in definition of macro '__DO_TRACE_CALL'
     173 |                         static_call(tp_func_##name)(__data, args);      \
         |                                                             ^~~~
   include/linux/tracepoint.h:206:39: note: in expansion of macro 'TP_ARGS'
     206 |                 __DO_TRACE_CALL(name, TP_ARGS(args));                   \
         |                                       ^~~~~~~
   include/linux/tracepoint.h:221:25: note: in expansion of macro '__DO_TRACE'
     221 |                         __DO_TRACE(name,                                \
         |                         ^~~~~~~~~~
   include/linux/tracepoint.h:222:33: note: in expansion of macro 'TP_ARGS'
     222 |                                 TP_ARGS(args),                          \
         |                                 ^~~~~~~
   include/linux/tracepoint.h:254:9: note: in expansion of macro '__DECLARE_TRACE_RCU'
     254 |         __DECLARE_TRACE_RCU(name, PARAMS(proto), PARAMS(args),          \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:254:50: note: in expansion of macro 'PARAMS'
     254 |         __DECLARE_TRACE_RCU(name, PARAMS(proto), PARAMS(args),          \
         |                                                  ^~~~~~
   include/linux/tracepoint.h:416:9: note: in expansion of macro '__DECLARE_TRACE'
     416 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:416:46: note: in expansion of macro 'PARAMS'
     416 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |                                              ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:255:9: note: in expansion of macro 'TP_ARGS'
     255 |         TP_ARGS(cma, count, align, no_warn, page, bypass));
         |         ^~~~~~~
   include/trace/hooks/mm.h: At top level:
   include/trace/hooks/mm.h:253:25: warning: 'struct cma' declared inside parameter list will not be visible outside of this definition or declaration
     253 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |                         ^~~
   include/linux/tracepoint.h:257:45: note: in definition of macro '__DECLARE_TRACE'
     257 |         register_trace_##name(void (*probe)(data_proto), void *data)    \
         |                                             ^~~~~~~~~~
   include/linux/tracepoint.h:418:25: note: in expansion of macro 'PARAMS'
     418 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:253:9: note: in expansion of macro 'TP_PROTO'
     253 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |         ^~~~~~~~
   include/trace/hooks/mm.h:253:25: warning: 'struct cma' declared inside parameter list will not be visible outside of this definition or declaration
     253 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |                         ^~~
   include/linux/tracepoint.h:263:50: note: in definition of macro '__DECLARE_TRACE'
     263 |         register_trace_prio_##name(void (*probe)(data_proto), void *data,\
         |                                                  ^~~~~~~~~~
   include/linux/tracepoint.h:418:25: note: in expansion of macro 'PARAMS'
     418 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:253:9: note: in expansion of macro 'TP_PROTO'
     253 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |         ^~~~~~~~
   include/trace/hooks/mm.h:253:25: warning: 'struct cma' declared inside parameter list will not be visible outside of this definition or declaration
     253 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |                         ^~~
   include/linux/tracepoint.h:270:47: note: in definition of macro '__DECLARE_TRACE'
     270 |         unregister_trace_##name(void (*probe)(data_proto), void *data)  \
         |                                               ^~~~~~~~~~
   include/linux/tracepoint.h:418:25: note: in expansion of macro 'PARAMS'
     418 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:253:9: note: in expansion of macro 'TP_PROTO'
     253 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |         ^~~~~~~~
   include/trace/hooks/mm.h:253:25: warning: 'struct cma' declared inside parameter list will not be visible outside of this definition or declaration
     253 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |                         ^~~
   include/linux/tracepoint.h:276:53: note: in definition of macro '__DECLARE_TRACE'
     276 |         check_trace_callback_type_##name(void (*cb)(data_proto))        \
         |                                                     ^~~~~~~~~~
   include/linux/tracepoint.h:418:25: note: in expansion of macro 'PARAMS'
     418 |                         PARAMS(void *__data, proto))
         |                         ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:253:9: note: in expansion of macro 'TP_PROTO'
     253 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |         ^~~~~~~~
   include/trace/hooks/mm.h:253:25: warning: 'struct cma' declared inside parameter list will not be visible outside of this definition or declaration
     253 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |                         ^~~
   include/linux/tracepoint.h:294:47: note: in definition of macro 'DEFINE_TRACE_FN'
     294 |         int __traceiter_##_name(void *__data, proto);                   \
         |                                               ^~~~~
   include/linux/tracepoint.h:325:43: note: in expansion of macro 'PARAMS'
     325 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |                                           ^~~~~~
   include/trace/define_trace.h:73:9: note: in expansion of macro 'DEFINE_TRACE'
      73 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/define_trace.h:73:28: note: in expansion of macro 'PARAMS'
      73 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                            ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:253:9: note: in expansion of macro 'TP_PROTO'
     253 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |         ^~~~~~~~
>> include/linux/tracepoint.h:294:13: error: conflicting types for '__traceiter_android_vh_cma_alloc_bypass'; have 'int(void *, struct cma *, long unsigned int,  unsigned int,  bool,  struct page **, bool *)' {aka 'int(void *, struct cma *, long unsigned int,  unsigned int,  _Bool,  struct page **, _Bool *)'}
     294 |         int __traceiter_##_name(void *__data, proto);                   \
         |             ^~~~~~~~~~~~
   include/linux/tracepoint.h:325:9: note: in expansion of macro 'DEFINE_TRACE_FN'
     325 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |         ^~~~~~~~~~~~~~~
   include/trace/define_trace.h:73:9: note: in expansion of macro 'DEFINE_TRACE'
      73 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:252:1: note: in expansion of macro 'DECLARE_HOOK'
     252 | DECLARE_HOOK(android_vh_cma_alloc_bypass,
         | ^~~~~~~~~~~~
   include/linux/tracepoint.h:241:20: note: previous declaration of '__traceiter_android_vh_cma_alloc_bypass' with type 'int(void *, struct cma *, long unsigned int,  unsigned int,  bool,  struct page **, bool *)' {aka 'int(void *, struct cma *, long unsigned int,  unsigned int,  _Bool,  struct page **, _Bool *)'}
     241 |         extern int __traceiter_##name(data_proto);                      \
         |                    ^~~~~~~~~~~~
   include/linux/tracepoint.h:416:9: note: in expansion of macro '__DECLARE_TRACE'
     416 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:252:1: note: in expansion of macro 'DECLARE_HOOK'
     252 | DECLARE_HOOK(android_vh_cma_alloc_bypass,
         | ^~~~~~~~~~~~
   include/trace/hooks/mm.h:253:25: warning: 'struct cma' declared inside parameter list will not be visible outside of this definition or declaration
     253 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |                         ^~~
   include/linux/tracepoint.h:306:55: note: in definition of macro 'DEFINE_TRACE_FN'
     306 |         int __nocfi __traceiter_##_name(void *__data, proto)                    \
         |                                                       ^~~~~
   include/linux/tracepoint.h:325:43: note: in expansion of macro 'PARAMS'
     325 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |                                           ^~~~~~
   include/trace/define_trace.h:73:9: note: in expansion of macro 'DEFINE_TRACE'
      73 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/define_trace.h:73:28: note: in expansion of macro 'PARAMS'
      73 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                            ^~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:253:9: note: in expansion of macro 'TP_PROTO'
     253 |         TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
         |         ^~~~~~~~
   include/linux/tracepoint.h:306:21: error: conflicting types for '__traceiter_android_vh_cma_alloc_bypass'; have 'int(void *, struct cma *, long unsigned int,  unsigned int,  bool,  struct page **, bool *)' {aka 'int(void *, struct cma *, long unsigned int,  unsigned int,  _Bool,  struct page **, _Bool *)'}
     306 |         int __nocfi __traceiter_##_name(void *__data, proto)                    \
         |                     ^~~~~~~~~~~~
   include/linux/tracepoint.h:325:9: note: in expansion of macro 'DEFINE_TRACE_FN'
     325 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |         ^~~~~~~~~~~~~~~
   include/trace/define_trace.h:73:9: note: in expansion of macro 'DEFINE_TRACE'
      73 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:252:1: note: in expansion of macro 'DECLARE_HOOK'
     252 | DECLARE_HOOK(android_vh_cma_alloc_bypass,
         | ^~~~~~~~~~~~
   include/linux/tracepoint.h:241:20: note: previous declaration of '__traceiter_android_vh_cma_alloc_bypass' with type 'int(void *, struct cma *, long unsigned int,  unsigned int,  bool,  struct page **, bool *)' {aka 'int(void *, struct cma *, long unsigned int,  unsigned int,  _Bool,  struct page **, _Bool *)'}
     241 |         extern int __traceiter_##name(data_proto);                      \
         |                    ^~~~~~~~~~~~
   include/linux/tracepoint.h:416:9: note: in expansion of macro '__DECLARE_TRACE'
     416 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:252:1: note: in expansion of macro 'DECLARE_HOOK'
     252 | DECLARE_HOOK(android_vh_cma_alloc_bypass,
         | ^~~~~~~~~~~~
   In file included from <command-line>:
>> include/linux/static_call_types.h:15:41: error: conflicting types for '__SCT__tp_func_android_vh_cma_alloc_bypass'; have 'int(void *, struct cma *, long unsigned int,  unsigned int,  bool,  struct page **, bool *)' {aka 'int(void *, struct cma *, long unsigned int,  unsigned int,  _Bool,  struct page **, _Bool *)'}
      15 | #define STATIC_CALL_TRAMP_PREFIX        __SCT__
         |                                         ^~~~~~~
   include/linux/compiler_types.h:59:23: note: in definition of macro '___PASTE'
      59 | #define ___PASTE(a,b) a##b
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
   include/linux/static_call.h:221:9: note: in expansion of macro 'DECLARE_STATIC_CALL'
     221 |         DECLARE_STATIC_CALL(name, _func);                               \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:328:9: note: in expansion of macro '__DEFINE_STATIC_CALL'
     328 |         __DEFINE_STATIC_CALL(name, _func, _func)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:322:9: note: in expansion of macro 'DEFINE_STATIC_CALL'
     322 |         DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:325:9: note: in expansion of macro 'DEFINE_TRACE_FN'
     325 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |         ^~~~~~~~~~~~~~~
   include/trace/define_trace.h:73:9: note: in expansion of macro 'DEFINE_TRACE'
      73 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:252:1: note: in expansion of macro 'DECLARE_HOOK'
     252 | DECLARE_HOOK(android_vh_cma_alloc_bypass,
         | ^~~~~~~~~~~~
   include/linux/static_call_types.h:15:41: note: previous declaration of '__SCT__tp_func_android_vh_cma_alloc_bypass' with type 'int(void *, struct cma *, long unsigned int,  unsigned int,  bool,  struct page **, bool *)' {aka 'int(void *, struct cma *, long unsigned int,  unsigned int,  _Bool,  struct page **, _Bool *)'}
      15 | #define STATIC_CALL_TRAMP_PREFIX        __SCT__
         |                                         ^~~~~~~
   include/linux/compiler_types.h:59:23: note: in definition of macro '___PASTE'
      59 | #define ___PASTE(a,b) a##b
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
   include/linux/tracepoint.h:242:9: note: in expansion of macro 'DECLARE_STATIC_CALL'
     242 |         DECLARE_STATIC_CALL(tp_func_##name, __traceiter_##name);        \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:416:9: note: in expansion of macro '__DECLARE_TRACE'
     416 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:252:1: note: in expansion of macro 'DECLARE_HOOK'
     252 | DECLARE_HOOK(android_vh_cma_alloc_bypass,
         | ^~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/kernel.h:8,
                    from include/linux/list.h:9,
                    from include/linux/timer.h:5,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:9,
                    from drivers/android/vendor_hooks.c:12:
   include/linux/tracepoint.h:329:27: error: conflicting types for '__traceiter_android_vh_cma_alloc_bypass'; have 'int(void *, struct cma *, long unsigned int,  unsigned int,  bool,  struct page **, bool *)' {aka 'int(void *, struct cma *, long unsigned int,  unsigned int,  _Bool,  struct page **, _Bool *)'}
     329 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |                           ^~~~~~~~~~~~
   include/linux/export.h:100:28: note: in definition of macro '___EXPORT_SYMBOL'
     100 |         extern typeof(sym) sym;                                                 \
         |                            ^~~
   include/linux/export.h:161:41: note: in expansion of macro '__EXPORT_SYMBOL'
     161 | #define _EXPORT_SYMBOL(sym, sec)        __EXPORT_SYMBOL(sym, sec, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:165:41: note: in expansion of macro '_EXPORT_SYMBOL'
     165 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "_gpl")
         |                                         ^~~~~~~~~~~~~~
   include/linux/tracepoint.h:329:9: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     329 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |         ^~~~~~~~~~~~~~~~~
   drivers/android/vendor_hooks.c:458:1: note: in expansion of macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     458 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_vh_cma_alloc_bypass);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:241:20: note: previous declaration of '__traceiter_android_vh_cma_alloc_bypass' with type 'int(void *, struct cma *, long unsigned int,  unsigned int,  bool,  struct page **, bool *)' {aka 'int(void *, struct cma *, long unsigned int,  unsigned int,  _Bool,  struct page **, _Bool *)'}
     241 |         extern int __traceiter_##name(data_proto);                      \
         |                    ^~~~~~~~~~~~
   include/linux/tracepoint.h:416:9: note: in expansion of macro '__DECLARE_TRACE'
     416 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:252:1: note: in expansion of macro 'DECLARE_HOOK'
     252 | DECLARE_HOOK(android_vh_cma_alloc_bypass,
         | ^~~~~~~~~~~~
>> include/linux/static_call_types.h:15:41: error: conflicting types for '__SCT__tp_func_android_vh_cma_alloc_bypass'; have 'int(void *, struct cma *, long unsigned int,  unsigned int,  bool,  struct page **, bool *)' {aka 'int(void *, struct cma *, long unsigned int,  unsigned int,  _Bool,  struct page **, _Bool *)'}
      15 | #define STATIC_CALL_TRAMP_PREFIX        __SCT__
         |                                         ^~~~~~~
   include/linux/export.h:100:28: note: in definition of macro '___EXPORT_SYMBOL'
     100 |         extern typeof(sym) sym;                                                 \
         |                            ^~~
   include/linux/export.h:161:41: note: in expansion of macro '__EXPORT_SYMBOL'
     161 | #define _EXPORT_SYMBOL(sym, sec)        __EXPORT_SYMBOL(sym, sec, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:165:41: note: in expansion of macro '_EXPORT_SYMBOL'
     165 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "_gpl")
         |                                         ^~~~~~~~~~~~~~
   include/linux/static_call.h:258:9: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     258 |         EXPORT_SYMBOL_GPL(STATIC_CALL_TRAMP(name))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:60:22: note: in expansion of macro '___PASTE'
      60 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/static_call_types.h:18:41: note: in expansion of macro '__PASTE'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                         ^~~~~~~
   include/linux/static_call_types.h:18:49: note: in expansion of macro 'STATIC_CALL_TRAMP_PREFIX'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:258:27: note: in expansion of macro 'STATIC_CALL_TRAMP'
     258 |         EXPORT_SYMBOL_GPL(STATIC_CALL_TRAMP(name))
         |                           ^~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:330:9: note: in expansion of macro 'EXPORT_STATIC_CALL_GPL'
     330 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/android/vendor_hooks.c:458:1: note: in expansion of macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     458 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_vh_cma_alloc_bypass);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:15:41: note: previous declaration of '__SCT__tp_func_android_vh_cma_alloc_bypass' with type 'int(void *, struct cma *, long unsigned int,  unsigned int,  bool,  struct page **, bool *)' {aka 'int(void *, struct cma *, long unsigned int,  unsigned int,  _Bool,  struct page **, _Bool *)'}
      15 | #define STATIC_CALL_TRAMP_PREFIX        __SCT__
         |                                         ^~~~~~~
   include/linux/compiler_types.h:59:23: note: in definition of macro '___PASTE'
      59 | #define ___PASTE(a,b) a##b
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
   include/linux/tracepoint.h:242:9: note: in expansion of macro 'DECLARE_STATIC_CALL'
     242 |         DECLARE_STATIC_CALL(tp_func_##name, __traceiter_##name);        \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:416:9: note: in expansion of macro '__DECLARE_TRACE'
     416 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:16:22: note: in expansion of macro 'DECLARE_TRACE'
      16 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/mm.h:252:1: note: in expansion of macro 'DECLARE_HOOK'
     252 | DECLARE_HOOK(android_vh_cma_alloc_bypass,
         | ^~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/psi.h:25,
                    from drivers/android/vendor_hooks.c:112:
   include/trace/trace_events.h:27:23: warning: 'str__psi__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:27:23: note: in definition of macro '__app__'
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:30:29: note: in expansion of macro '__app'
      30 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/trace_events.h:33:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
      33 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:36:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      36 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/loop.h:21,
                    from drivers/android/vendor_hooks.c:111:
   include/trace/trace_events.h:27:23: warning: 'str__loop__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:27:23: note: in definition of macro '__app__'
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:30:29: note: in expansion of macro '__app'
      30 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/trace_events.h:33:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
      33 |         static const char TRACE_SYSTEM_STRING[] =       \
         |                           ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:36:1: note: in expansion of macro 'TRACE_MAKE_SYSTEM_STR'
      36 | TRACE_MAKE_SYSTEM_STR();
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/direct_io.h:21,
                    from drivers/android/vendor_hooks.c:110:
   include/trace/trace_events.h:27:23: warning: 'str__direct_io__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
..

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=y] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]


vim +/__SCT__tp_func_android_vh_cma_alloc_bypass +255 include/trace/hooks/mm.h

    34	
    35	DECLARE_RESTRICTED_HOOK(android_rvh_set_skip_swapcache_flags,
    36				TP_PROTO(gfp_t *flags),
    37				TP_ARGS(flags), 1);
    38	DECLARE_RESTRICTED_HOOK(android_rvh_set_gfp_zone_flags,
    39				TP_PROTO(gfp_t *flags),
    40				TP_ARGS(flags), 1);
    41	DECLARE_RESTRICTED_HOOK(android_rvh_update_readahead_gfp_mask,
    42				TP_PROTO(struct address_space *mapping, gfp_t *flags),
    43				TP_ARGS(mapping, flags), 2);
    44	DECLARE_RESTRICTED_HOOK(android_rvh_set_readahead_gfp_mask,
    45				TP_PROTO(gfp_t *flags),
    46				TP_ARGS(flags), 1);
    47	DECLARE_RESTRICTED_HOOK(android_rvh_rmqueue_bulk,
    48				TP_PROTO(void *unused),
    49				TP_ARGS(unused), 1);
    50	DECLARE_HOOK(android_vh_meminfo_proc_show,
    51		TP_PROTO(struct seq_file *m),
    52		TP_ARGS(m));
    53	DECLARE_HOOK(android_vh_exit_mm,
    54		TP_PROTO(struct mm_struct *mm),
    55		TP_ARGS(mm));
    56	DECLARE_HOOK(android_vh_show_mem,
    57		TP_PROTO(unsigned int filter, nodemask_t *nodemask),
    58		TP_ARGS(filter, nodemask));
    59	DECLARE_HOOK(android_vh_alloc_pages_slowpath,
    60		TP_PROTO(gfp_t gfp_mask, unsigned int order, unsigned long delta),
    61		TP_ARGS(gfp_mask, order, delta));
    62	DECLARE_HOOK(android_vh_print_slabinfo_header,
    63		TP_PROTO(struct seq_file *m),
    64		TP_ARGS(m));
    65	DECLARE_HOOK(android_vh_cache_show,
    66		TP_PROTO(struct seq_file *m, struct slabinfo *sinfo, struct kmem_cache *s),
    67		TP_ARGS(m, sinfo, s));
    68	DECLARE_HOOK(android_vh_oom_check_panic,
    69		TP_PROTO(struct oom_control *oc, int *ret),
    70		TP_ARGS(oc, ret));
    71	DECLARE_HOOK(android_vh_drain_all_pages_bypass,
    72		TP_PROTO(gfp_t gfp_mask, unsigned int order, unsigned long alloc_flags,
    73			int migratetype, unsigned long did_some_progress,
    74			bool *bypass),
    75		TP_ARGS(gfp_mask, order, alloc_flags, migratetype, did_some_progress, bypass));
    76	DECLARE_HOOK(android_vh_dm_bufio_shrink_scan_bypass,
    77		TP_PROTO(unsigned long dm_bufio_current_allocated, bool *bypass),
    78		TP_ARGS(dm_bufio_current_allocated, bypass));
    79	DECLARE_HOOK(android_vh_cleanup_old_buffers_bypass,
    80		TP_PROTO(unsigned long dm_bufio_current_allocated,
    81			unsigned long *max_age_hz,
    82			bool *bypass),
    83		TP_ARGS(dm_bufio_current_allocated, max_age_hz, bypass));
    84	DECLARE_HOOK(android_vh_cma_drain_all_pages_bypass,
    85		TP_PROTO(unsigned int migratetype, bool *bypass),
    86		TP_ARGS(migratetype, bypass));
    87	DECLARE_HOOK(android_vh_pcplist_add_cma_pages_bypass,
    88		TP_PROTO(int migratetype, bool *bypass),
    89		TP_ARGS(migratetype, bypass));
    90	DECLARE_HOOK(android_vh_free_unref_page_bypass,
    91		TP_PROTO(struct page *page, int order, int migratetype, bool *bypass),
    92		TP_ARGS(page, order, migratetype, bypass));
    93	DECLARE_HOOK(android_vh_kvmalloc_node_use_vmalloc,
    94		TP_PROTO(size_t size, gfp_t *kmalloc_flags, bool *use_vmalloc),
    95		TP_ARGS(size, kmalloc_flags, use_vmalloc));
    96	DECLARE_HOOK(android_vh_should_alloc_pages_retry,
    97		TP_PROTO(gfp_t gfp_mask, int order, int *alloc_flags,
    98		int migratetype, struct zone *preferred_zone, struct page **page, bool *should_alloc_retry),
    99		TP_ARGS(gfp_mask, order, alloc_flags,
   100			migratetype, preferred_zone, page, should_alloc_retry));
   101	DECLARE_HOOK(android_vh_unreserve_highatomic_bypass,
   102		TP_PROTO(bool force, struct zone *zone, bool *skip_unreserve_highatomic),
   103		TP_ARGS(force, zone, skip_unreserve_highatomic));
   104	DECLARE_HOOK(android_vh_rmqueue_bulk_bypass,
   105		TP_PROTO(unsigned int order, struct per_cpu_pages *pcp, int migratetype,
   106			struct list_head *list),
   107		TP_ARGS(order, pcp, migratetype, list));
   108	DECLARE_HOOK(android_vh_ra_tuning_max_page,
   109		TP_PROTO(struct readahead_control *ractl, unsigned long *max_page),
   110		TP_ARGS(ractl, max_page));
   111	DECLARE_HOOK(android_vh_tune_mmap_readaround,
   112		TP_PROTO(unsigned int ra_pages, pgoff_t pgoff,
   113			pgoff_t *start, unsigned int *size, unsigned int *async_size),
   114		TP_ARGS(ra_pages, pgoff, start, size, async_size));
   115	DECLARE_HOOK(android_vh_mmap_region,
   116		TP_PROTO(struct vm_area_struct *vma, unsigned long addr),
   117		TP_ARGS(vma, addr));
   118	DECLARE_HOOK(android_vh_try_to_unmap_one,
   119		TP_PROTO(struct vm_area_struct *vma, struct page *page, unsigned long addr, bool ret),
   120		TP_ARGS(vma, page, addr, ret));
   121	DECLARE_HOOK(android_vh_cma_alloc_retry,
   122		TP_PROTO(char *name, int *retry),
   123		TP_ARGS(name, retry));
   124	struct mem_cgroup;
   125	DECLARE_HOOK(android_vh_mem_cgroup_alloc,
   126		TP_PROTO(struct mem_cgroup *memcg),
   127		TP_ARGS(memcg));
   128	DECLARE_HOOK(android_vh_mem_cgroup_free,
   129		TP_PROTO(struct mem_cgroup *memcg),
   130		TP_ARGS(memcg));
   131	DECLARE_HOOK(android_vh_mem_cgroup_id_remove,
   132		TP_PROTO(struct mem_cgroup *memcg),
   133		TP_ARGS(memcg));
   134	struct cgroup_subsys_state;
   135	DECLARE_HOOK(android_vh_mem_cgroup_css_online,
   136		TP_PROTO(struct cgroup_subsys_state *css, struct mem_cgroup *memcg),
   137		TP_ARGS(css, memcg));
   138	DECLARE_HOOK(android_vh_mem_cgroup_css_offline,
   139		TP_PROTO(struct cgroup_subsys_state *css, struct mem_cgroup *memcg),
   140		TP_ARGS(css, memcg));
   141	DECLARE_HOOK(android_vh_vmpressure,
   142		TP_PROTO(struct mem_cgroup *memcg, bool *bypass),
   143		TP_ARGS(memcg, bypass));
   144	DECLARE_HOOK(android_vh_do_page_trylock,
   145		TP_PROTO(struct page *page, struct rw_semaphore *sem,
   146			bool *got_lock, bool *success),
   147		TP_ARGS(page, sem, got_lock, success));
   148	DECLARE_HOOK(android_vh_update_page_mapcount,
   149		TP_PROTO(struct page *page, bool inc_size, bool compound,
   150				bool *first_mapping, bool *success),
   151		TP_ARGS(page, inc_size, compound, first_mapping, success));
   152	DECLARE_HOOK(android_vh_add_page_to_lrulist,
   153		TP_PROTO(struct page *page, bool compound, enum lru_list lru),
   154		TP_ARGS(page, compound, lru));
   155	DECLARE_HOOK(android_vh_del_page_from_lrulist,
   156		TP_PROTO(struct page *page, bool compound, enum lru_list lru),
   157		TP_ARGS(page, compound, lru));
   158	DECLARE_HOOK(android_vh_show_mapcount_pages,
   159		TP_PROTO(void *unused),
   160		TP_ARGS(unused));
   161	DECLARE_HOOK(android_vh_do_traversal_lruvec,
   162		TP_PROTO(struct lruvec *lruvec),
   163		TP_ARGS(lruvec));
   164	DECLARE_HOOK(android_vh_page_should_be_protected,
   165		TP_PROTO(struct page *page, bool *should_protect),
   166		TP_ARGS(page, should_protect));
   167	DECLARE_HOOK(android_vh_mark_page_accessed,
   168		TP_PROTO(struct page *page),
   169		TP_ARGS(page));
   170	DECLARE_HOOK(android_vh_page_cache_forced_ra,
   171		TP_PROTO(struct readahead_control *ractl, unsigned long req_count, bool *do_forced_ra),
   172		TP_ARGS(ractl, req_count, do_forced_ra));
   173	DECLARE_HOOK(android_vh_alloc_pages_reclaim_bypass,
   174		TP_PROTO(gfp_t gfp_mask, int order, int alloc_flags,
   175		int migratetype, struct page **page),
   176		TP_ARGS(gfp_mask, order, alloc_flags, migratetype, page));
   177	DECLARE_HOOK(android_vh_alloc_pages_failure_bypass,
   178		TP_PROTO(gfp_t gfp_mask, int order, int alloc_flags,
   179		int migratetype, struct page **page),
   180		TP_ARGS(gfp_mask, order, alloc_flags, migratetype, page));
   181	DECLARE_HOOK(android_vh_save_track_hash,
   182		TP_PROTO(bool alloc, struct track *p),
   183		TP_ARGS(alloc, p));
   184	DECLARE_HOOK(android_vh_rmqueue,
   185		TP_PROTO(struct zone *preferred_zone, struct zone *zone,
   186			unsigned int order, gfp_t gfp_flags,
   187			unsigned int alloc_flags, int migratetype),
   188		TP_ARGS(preferred_zone, zone, order,
   189			gfp_flags, alloc_flags, migratetype));
   190	DECLARE_HOOK(android_vh_kmalloc_slab,
   191		TP_PROTO(unsigned int index, gfp_t flags, struct kmem_cache **s),
   192		TP_ARGS(index, flags, s));
   193	DECLARE_HOOK(android_vh_madvise_cold_or_pageout,
   194		TP_PROTO(struct vm_area_struct *vma, bool *allow_shared),
   195		TP_ARGS(vma, allow_shared));
   196	DECLARE_RESTRICTED_HOOK(android_rvh_ctl_dirty_rate,
   197		TP_PROTO(void *unused),
   198		TP_ARGS(unused), 1);
   199	DECLARE_HOOK(android_vh_rmqueue_smallest_bypass,
   200		TP_PROTO(struct page **page, struct zone *zone, int order, int migratetype),
   201		TP_ARGS(page, zone, order, migratetype));
   202	DECLARE_HOOK(android_vh_free_one_page_bypass,
   203		TP_PROTO(struct page *page, struct zone *zone, int order, int migratetype,
   204			int fpi_flags, bool *bypass),
   205		TP_ARGS(page, zone, order, migratetype, fpi_flags, bypass));
   206	DECLARE_HOOK(android_vh_use_cma_first_check,
   207		TP_PROTO(bool *use_cma_first_check),
   208		TP_ARGS(use_cma_first_check));
   209	DECLARE_HOOK(android_vh_alloc_highpage_movable_gfp_adjust,
   210	        TP_PROTO(gfp_t *gfp_mask),
   211	        TP_ARGS(gfp_mask));
   212	DECLARE_HOOK(android_vh_anon_gfp_adjust,
   213		TP_PROTO(gfp_t *gfp_mask),
   214		TP_ARGS(gfp_mask));
   215	DECLARE_HOOK(android_vh_slab_page_alloced,
   216		TP_PROTO(struct page *page, size_t size, gfp_t flags),
   217		TP_ARGS(page, size, flags));
   218	DECLARE_HOOK(android_vh_kmalloc_order_alloced,
   219	        TP_PROTO(struct page *page, size_t size, gfp_t flags),
   220	        TP_ARGS(page, size, flags));
   221	DECLARE_HOOK(android_vh_compact_finished,
   222		TP_PROTO(bool *abort_compact),
   223		TP_ARGS(abort_compact));
   224	DECLARE_HOOK(android_vh_madvise_cold_or_pageout_abort,
   225		TP_PROTO(struct vm_area_struct *vma, bool *abort_madvise),
   226		TP_ARGS(vma, abort_madvise));
   227	DECLARE_HOOK(android_vh_alloc_flags_cma_adjust,
   228		TP_PROTO(gfp_t gfp_mask, unsigned int *alloc_flags),
   229		TP_ARGS(gfp_mask, alloc_flags));
   230	DECLARE_HOOK(android_vh_rmqueue_cma_fallback,
   231		TP_PROTO(struct zone *zone, unsigned int order, struct page **page),
   232		TP_ARGS(zone, order, page));
   233	DECLARE_HOOK(android_vh_test_clear_look_around_ref,
   234		TP_PROTO(struct page *page),
   235		TP_ARGS(page));
   236	DECLARE_HOOK(android_vh_look_around_migrate_page,
   237		TP_PROTO(struct page *old_page, struct page *new_page),
   238		TP_ARGS(old_page, new_page));
   239	DECLARE_HOOK(android_vh_look_around,
   240		TP_PROTO(struct page_vma_mapped_walk *pvmw, struct page *page,
   241			struct vm_area_struct *vma, int *referenced),
   242		TP_ARGS(pvmw, page, vma, referenced));
   243	DECLARE_HOOK(android_vh_try_cma_fallback,
   244		TP_PROTO(struct zone *zone, unsigned int order, bool *try_cma),
   245		TP_ARGS(zone, order, try_cma));
   246	DECLARE_HOOK(android_vh_set_page_migrating,
   247		TP_PROTO(struct page *page),
   248		TP_ARGS(page));
   249	DECLARE_HOOK(android_vh_clear_page_migrating,
   250		TP_PROTO(struct page *page),
   251		TP_ARGS(page));
   252	DECLARE_HOOK(android_vh_cma_alloc_bypass,
   253		TP_PROTO(struct cma *cma, unsigned long count, unsigned int align,
   254			bool no_warn, struct page **page, bool *bypass),
 > 255		TP_ARGS(cma, count, align, no_warn, page, bypass));
   256	#endif /* _TRACE_HOOK_MM_H */
   257	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
