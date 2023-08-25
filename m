Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09CF3D6E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 08:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692951872; x=1724487872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZdCdtiFz49O869qegyFv01g0wcU+5eR1f4czussS0vA=;
  b=XplU25FkueQd837pOQ2Y8HE4h9Gw7yMoDQCuxk1gzOdakLUYK+AMosvu
   wqUWnr75AXkfs60rKGLutlIZwpbiRsvQTNf7eKULjuMMTUWY0/LYPPAkp
   hifQSJ9brtox05kA9V5r1Ht3yC4UM8LTGx3R+lYJS77MLLS/8f/tEJx70
   Vtr+HeXOrjzzHJCIiXzRm4VBlauf34gmsHrsw2ibS4yBjd5v0AUwXtEtK
   Q4undyMU3Lov9nv6eQEWy8vFQJdz05D+I1cEOFNPXt7bKuqvpByuNuqTl
   94p4+PC+JJs7ISKyo+TdlaUEWxCTwxNqYu20kT+WpahLSBqN8D5vlUJYy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="364860360"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="364860360"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 01:24:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="881109762"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 25 Aug 2023 01:24:33 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZS7H-0003LH-0t;
	Fri, 25 Aug 2023 08:24:27 +0000
Date: Fri, 25 Aug 2023 16:24:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2022-11 1/1]
 include/trace/hooks/dmabuf.h:23:17: error: passing argument 2 of
 '__SCT__tp_func_android_rvh_dma_buf_stats_teardown' from incompatible
 pointer type
Message-ID: <202308251615.AAJEe5gP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10-2022-11
head:   a0b645e69943d9a46922dfdfda53e00c73d5ab0c
commit: c5589c7eec414305c3afc44adbbf79b63a9a7120 [1/1] ANDROID: dma-buf: Add vendor hook for deferred dmabuf sysfs stats release
config: i386-randconfig-063-20230825 (https://download.01.org/0day-ci/archive/20230825/202308251615.AAJEe5gP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308251615.AAJEe5gP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308251615.AAJEe5gP-lkp@intel.com/

Note: the android-common/android12-5.10-2022-11 HEAD a0b645e69943d9a46922dfdfda53e00c73d5ab0c builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from include/trace/hooks/dmabuf.h:12,
                    from drivers/android/vendor_hooks.c:77:
   include/trace/hooks/dmabuf.h:22:25: warning: 'struct dma_buf_sysfs_entry' declared inside parameter list will not be visible outside of this definition or declaration
      22 |         TP_PROTO(struct dma_buf_sysfs_entry *sysfs_entry, bool *skip_sysfs_release),
         |                         ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:78:39: note: in definition of macro '__DECLARE_HOOK'
      78 |         extern int __traceiter_##name(data_proto);                      \
         |                                       ^~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:106:25: note: in expansion of macro 'PARAMS'
     106 |                         PARAMS(void *__data, proto),                    \
         |                         ^~~~~~
   include/trace/hooks/dmabuf.h:21:1: note: in expansion of macro 'DECLARE_RESTRICTED_HOOK'
      21 | DECLARE_RESTRICTED_HOOK(android_rvh_dma_buf_stats_teardown,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   include/trace/hooks/dmabuf.h:22:9: note: in expansion of macro 'TP_PROTO'
      22 |         TP_PROTO(struct dma_buf_sysfs_entry *sysfs_entry, bool *skip_sysfs_release),
         |         ^~~~~~~~
   include/trace/hooks/dmabuf.h:22:25: warning: 'struct dma_buf_sysfs_entry' declared inside parameter list will not be visible outside of this definition or declaration
      22 |         TP_PROTO(struct dma_buf_sysfs_entry *sysfs_entry, bool *skip_sysfs_release),
         |                         ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:81:49: note: in definition of macro '__DECLARE_HOOK'
      81 |         static inline void __nocfi trace_##name(proto)                  \
         |                                                 ^~~~~
   include/trace/hooks/vendor_hooks.h:104:30: note: in expansion of macro 'PARAMS'
     104 |         __DECLARE_HOOK(name, PARAMS(proto), PARAMS(args),               \
         |                              ^~~~~~
   include/trace/hooks/dmabuf.h:21:1: note: in expansion of macro 'DECLARE_RESTRICTED_HOOK'
      21 | DECLARE_RESTRICTED_HOOK(android_rvh_dma_buf_stats_teardown,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   include/trace/hooks/dmabuf.h:22:9: note: in expansion of macro 'TP_PROTO'
      22 |         TP_PROTO(struct dma_buf_sysfs_entry *sysfs_entry, bool *skip_sysfs_release),
         |         ^~~~~~~~
   include/trace/hooks/dmabuf.h: In function 'trace_android_rvh_dma_buf_stats_teardown':
>> include/trace/hooks/dmabuf.h:23:17: error: passing argument 2 of '__SCT__tp_func_android_rvh_dma_buf_stats_teardown' from incompatible pointer type [-Werror=incompatible-pointer-types]
      23 |         TP_ARGS(sysfs_entry, skip_sysfs_release), 1);
         |                 ^~~~~~~~~~~
         |                 |
         |                 struct dma_buf_sysfs_entry *
   include/trace/hooks/vendor_hooks.h:73:47: note: in definition of macro 'DO_HOOK'
      73 |                         __DO_TRACE_CALL(name)(args);                    \
         |                                               ^~~~
   include/trace/hooks/vendor_hooks.h:86:33: note: in expansion of macro 'TP_ARGS'
      86 |                                 TP_ARGS(data_args),                     \
         |                                 ^~~~~~~
   include/trace/hooks/vendor_hooks.h:104:9: note: in expansion of macro '__DECLARE_HOOK'
     104 |         __DECLARE_HOOK(name, PARAMS(proto), PARAMS(args),               \
         |         ^~~~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:107:25: note: in expansion of macro 'PARAMS'
     107 |                         PARAMS(__data, args))
         |                         ^~~~~~
   include/trace/hooks/dmabuf.h:21:1: note: in expansion of macro 'DECLARE_RESTRICTED_HOOK'
      21 | DECLARE_RESTRICTED_HOOK(android_rvh_dma_buf_stats_teardown,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   include/trace/hooks/dmabuf.h:23:9: note: in expansion of macro 'TP_ARGS'
      23 |         TP_ARGS(sysfs_entry, skip_sysfs_release), 1);
         |         ^~~~~~~
   include/trace/hooks/dmabuf.h:23:17: note: expected 'struct dma_buf_sysfs_entry *' but argument is of type 'struct dma_buf_sysfs_entry *'
      23 |         TP_ARGS(sysfs_entry, skip_sysfs_release), 1);
         |                 ^~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:73:47: note: in definition of macro 'DO_HOOK'
      73 |                         __DO_TRACE_CALL(name)(args);                    \
         |                                               ^~~~
   include/trace/hooks/vendor_hooks.h:86:33: note: in expansion of macro 'TP_ARGS'
      86 |                                 TP_ARGS(data_args),                     \
         |                                 ^~~~~~~
   include/trace/hooks/vendor_hooks.h:104:9: note: in expansion of macro '__DECLARE_HOOK'
     104 |         __DECLARE_HOOK(name, PARAMS(proto), PARAMS(args),               \
         |         ^~~~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:107:25: note: in expansion of macro 'PARAMS'
     107 |                         PARAMS(__data, args))
         |                         ^~~~~~
   include/trace/hooks/dmabuf.h:21:1: note: in expansion of macro 'DECLARE_RESTRICTED_HOOK'
      21 | DECLARE_RESTRICTED_HOOK(android_rvh_dma_buf_stats_teardown,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   include/trace/hooks/dmabuf.h:23:9: note: in expansion of macro 'TP_ARGS'
      23 |         TP_ARGS(sysfs_entry, skip_sysfs_release), 1);
         |         ^~~~~~~
   include/trace/hooks/dmabuf.h: At top level:
   include/trace/hooks/dmabuf.h:22:25: warning: 'struct dma_buf_sysfs_entry' declared inside parameter list will not be visible outside of this definition or declaration
      22 |         TP_PROTO(struct dma_buf_sysfs_entry *sysfs_entry, bool *skip_sysfs_release),
         |                         ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:95:45: note: in definition of macro '__DECLARE_HOOK'
      95 |         register_trace_##name(void (*probe)(data_proto), void *data)    \
         |                                             ^~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:106:25: note: in expansion of macro 'PARAMS'
     106 |                         PARAMS(void *__data, proto),                    \
         |                         ^~~~~~
   include/trace/hooks/dmabuf.h:21:1: note: in expansion of macro 'DECLARE_RESTRICTED_HOOK'
      21 | DECLARE_RESTRICTED_HOOK(android_rvh_dma_buf_stats_teardown,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   include/trace/hooks/dmabuf.h:22:9: note: in expansion of macro 'TP_PROTO'
      22 |         TP_PROTO(struct dma_buf_sysfs_entry *sysfs_entry, bool *skip_sysfs_release),
         |         ^~~~~~~~
   In file included from include/trace/hooks/dmabuf.h:12,
                    from include/trace/define_trace.h:95,
                    from include/trace/hooks/dmabuf.h:26:
   include/trace/hooks/dmabuf.h:22:25: warning: 'struct dma_buf_sysfs_entry' declared inside parameter list will not be visible outside of this definition or declaration
      22 |         TP_PROTO(struct dma_buf_sysfs_entry *sysfs_entry, bool *skip_sysfs_release),
         |                         ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:26:47: note: in definition of macro 'DEFINE_HOOK_FN'
      26 |         int __traceiter_##_name(void *__data, proto);                   \
         |                                               ^~~~~
   include/trace/hooks/vendor_hooks.h:56:42: note: in expansion of macro 'PARAMS'
      56 |         DEFINE_HOOK_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args))
         |                                          ^~~~~~
   include/trace/hooks/dmabuf.h:21:1: note: in expansion of macro 'DECLARE_RESTRICTED_HOOK'
      21 | DECLARE_RESTRICTED_HOOK(android_rvh_dma_buf_stats_teardown,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   include/trace/hooks/dmabuf.h:22:9: note: in expansion of macro 'TP_PROTO'
      22 |         TP_PROTO(struct dma_buf_sysfs_entry *sysfs_entry, bool *skip_sysfs_release),
         |         ^~~~~~~~
>> include/trace/hooks/vendor_hooks.h:26:13: error: conflicting types for '__traceiter_android_rvh_dma_buf_stats_teardown'; have 'int(void *, struct dma_buf_sysfs_entry *, bool *)' {aka 'int(void *, struct dma_buf_sysfs_entry *, _Bool *)'}
      26 |         int __traceiter_##_name(void *__data, proto);                   \
         |             ^~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:26:13: note: in definition of macro 'DEFINE_HOOK_FN'
      26 |         int __traceiter_##_name(void *__data, proto);                   \
         |             ^~~~~~~~~~~~
   include/trace/hooks/dmabuf.h:21:1: note: in expansion of macro 'DECLARE_RESTRICTED_HOOK'
      21 | DECLARE_RESTRICTED_HOOK(android_rvh_dma_buf_stats_teardown,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:78:20: note: previous declaration of '__traceiter_android_rvh_dma_buf_stats_teardown' with type 'int(void *, struct dma_buf_sysfs_entry *, bool *)' {aka 'int(void *, struct dma_buf_sysfs_entry *, _Bool *)'}
      78 |         extern int __traceiter_##name(data_proto);                      \
         |                    ^~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:78:20: note: in definition of macro '__DECLARE_HOOK'
      78 |         extern int __traceiter_##name(data_proto);                      \
         |                    ^~~~~~~~~~~~
   include/trace/hooks/dmabuf.h:21:1: note: in expansion of macro 'DECLARE_RESTRICTED_HOOK'
      21 | DECLARE_RESTRICTED_HOOK(android_rvh_dma_buf_stats_teardown,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   include/trace/hooks/dmabuf.h:22:25: warning: 'struct dma_buf_sysfs_entry' declared inside parameter list will not be visible outside of this definition or declaration
      22 |         TP_PROTO(struct dma_buf_sysfs_entry *sysfs_entry, bool *skip_sysfs_release),
         |                         ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:38:55: note: in definition of macro 'DEFINE_HOOK_FN'
      38 |         int __nocfi __traceiter_##_name(void *__data, proto)                    \
         |                                                       ^~~~~
   include/trace/hooks/vendor_hooks.h:56:42: note: in expansion of macro 'PARAMS'
      56 |         DEFINE_HOOK_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args))
         |                                          ^~~~~~
   include/trace/hooks/dmabuf.h:21:1: note: in expansion of macro 'DECLARE_RESTRICTED_HOOK'
      21 | DECLARE_RESTRICTED_HOOK(android_rvh_dma_buf_stats_teardown,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   include/trace/hooks/dmabuf.h:22:9: note: in expansion of macro 'TP_PROTO'
      22 |         TP_PROTO(struct dma_buf_sysfs_entry *sysfs_entry, bool *skip_sysfs_release),
         |         ^~~~~~~~
   include/trace/hooks/vendor_hooks.h:38:21: error: conflicting types for '__traceiter_android_rvh_dma_buf_stats_teardown'; have 'int(void *, struct dma_buf_sysfs_entry *, bool *)' {aka 'int(void *, struct dma_buf_sysfs_entry *, _Bool *)'}
      38 |         int __nocfi __traceiter_##_name(void *__data, proto)                    \
         |                     ^~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:38:21: note: in definition of macro 'DEFINE_HOOK_FN'
      38 |         int __nocfi __traceiter_##_name(void *__data, proto)                    \
         |                     ^~~~~~~~~~~~
   include/trace/hooks/dmabuf.h:21:1: note: in expansion of macro 'DECLARE_RESTRICTED_HOOK'
      21 | DECLARE_RESTRICTED_HOOK(android_rvh_dma_buf_stats_teardown,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:78:20: note: previous declaration of '__traceiter_android_rvh_dma_buf_stats_teardown' with type 'int(void *, struct dma_buf_sysfs_entry *, bool *)' {aka 'int(void *, struct dma_buf_sysfs_entry *, _Bool *)'}
      78 |         extern int __traceiter_##name(data_proto);                      \
         |                    ^~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:78:20: note: in definition of macro '__DECLARE_HOOK'
      78 |         extern int __traceiter_##name(data_proto);                      \
         |                    ^~~~~~~~~~~~
   include/trace/hooks/dmabuf.h:21:1: note: in expansion of macro 'DECLARE_RESTRICTED_HOOK'
      21 | DECLARE_RESTRICTED_HOOK(android_rvh_dma_buf_stats_teardown,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
>> include/linux/static_call_types.h:15:41: error: conflicting types for '__SCT__tp_func_android_rvh_dma_buf_stats_teardown'; have 'int(void *, struct dma_buf_sysfs_entry *, bool *)' {aka 'int(void *, struct dma_buf_sysfs_entry *, _Bool *)'}
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
   include/linux/static_call.h:193:9: note: in expansion of macro 'DECLARE_STATIC_CALL'
     193 |         DECLARE_STATIC_CALL(name, _func);                               \
         |         ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:52:9: note: in expansion of macro 'DEFINE_STATIC_CALL'
      52 |         DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);
         |         ^~~~~~~~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:56:9: note: in expansion of macro 'DEFINE_HOOK_FN'
      56 |         DEFINE_HOOK_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~~
   include/trace/hooks/dmabuf.h:21:1: note: in expansion of macro 'DECLARE_RESTRICTED_HOOK'
      21 | DECLARE_RESTRICTED_HOOK(android_rvh_dma_buf_stats_teardown,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:15:41: note: previous declaration of '__SCT__tp_func_android_rvh_dma_buf_stats_teardown' with type 'int(void *, struct dma_buf_sysfs_entry *, bool *)' {aka 'int(void *, struct dma_buf_sysfs_entry *, _Bool *)'}
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
   include/trace/hooks/vendor_hooks.h:79:9: note: in expansion of macro 'DECLARE_STATIC_CALL'
      79 |         DECLARE_STATIC_CALL(tp_func_##name, __traceiter_##name);        \
         |         ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:104:9: note: in expansion of macro '__DECLARE_HOOK'
     104 |         __DECLARE_HOOK(name, PARAMS(proto), PARAMS(args),               \
         |         ^~~~~~~~~~~~~~
   include/trace/hooks/dmabuf.h:21:1: note: in expansion of macro 'DECLARE_RESTRICTED_HOOK'
      21 | DECLARE_RESTRICTED_HOOK(android_rvh_dma_buf_stats_teardown,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/kernel.h:8,
                    from include/linux/list.h:9,
                    from include/linux/rmap.h:8,
                    from drivers/android/vendor_hooks.c:10:
>> include/linux/tracepoint.h:336:27: error: conflicting types for '__traceiter_android_rvh_dma_buf_stats_teardown'; have 'int(void *, struct dma_buf_sysfs_entry *, bool *)' {aka 'int(void *, struct dma_buf_sysfs_entry *, _Bool *)'}
     336 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |                           ^~~~~~~~~~~~
   include/linux/export.h:125:28: note: in definition of macro '___EXPORT_SYMBOL'
     125 |         extern typeof(sym) sym;                                                 \
         |                            ^~~
   include/linux/export.h:187:41: note: in expansion of macro '__EXPORT_SYMBOL'
     187 | #define _EXPORT_SYMBOL(sym, sec)        __EXPORT_SYMBOL(sym, sec, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:191:41: note: in expansion of macro '_EXPORT_SYMBOL'
     191 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "_gpl")
         |                                         ^~~~~~~~~~~~~~
   include/linux/tracepoint.h:336:9: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     336 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |         ^~~~~~~~~~~~~~~~~
   drivers/android/vendor_hooks.c:471:1: note: in expansion of macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     471 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_rvh_dma_buf_stats_teardown);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:78:20: note: previous declaration of '__traceiter_android_rvh_dma_buf_stats_teardown' with type 'int(void *, struct dma_buf_sysfs_entry *, bool *)' {aka 'int(void *, struct dma_buf_sysfs_entry *, _Bool *)'}
      78 |         extern int __traceiter_##name(data_proto);                      \
         |                    ^~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:78:20: note: in definition of macro '__DECLARE_HOOK'
      78 |         extern int __traceiter_##name(data_proto);                      \
         |                    ^~~~~~~~~~~~
   include/trace/hooks/dmabuf.h:21:1: note: in expansion of macro 'DECLARE_RESTRICTED_HOOK'
      21 | DECLARE_RESTRICTED_HOOK(android_rvh_dma_buf_stats_teardown,
         | ^~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/static_call_types.h:15:41: error: conflicting types for '__SCT__tp_func_android_rvh_dma_buf_stats_teardown'; have 'int(void *, struct dma_buf_sysfs_entry *, bool *)' {aka 'int(void *, struct dma_buf_sysfs_entry *, _Bool *)'}
      15 | #define STATIC_CALL_TRAMP_PREFIX        __SCT__
         |                                         ^~~~~~~
   include/linux/export.h:125:28: note: in definition of macro '___EXPORT_SYMBOL'
     125 |         extern typeof(sym) sym;                                                 \
         |                            ^~~
   include/linux/export.h:187:41: note: in expansion of macro '__EXPORT_SYMBOL'
     187 | #define _EXPORT_SYMBOL(sym, sec)        __EXPORT_SYMBOL(sym, sec, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:191:41: note: in expansion of macro '_EXPORT_SYMBOL'
     191 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "_gpl")
         |                                         ^~~~~~~~~~~~~~
   include/linux/static_call.h:227:9: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     227 |         EXPORT_SYMBOL_GPL(STATIC_CALL_TRAMP(name))
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
   include/linux/static_call.h:227:27: note: in expansion of macro 'STATIC_CALL_TRAMP'
     227 |         EXPORT_SYMBOL_GPL(STATIC_CALL_TRAMP(name))
         |                           ^~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:337:9: note: in expansion of macro 'EXPORT_STATIC_CALL_GPL'
     337 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/android/vendor_hooks.c:471:1: note: in expansion of macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     471 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_rvh_dma_buf_stats_teardown);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:15:41: note: previous declaration of '__SCT__tp_func_android_rvh_dma_buf_stats_teardown' with type 'int(void *, struct dma_buf_sysfs_entry *, bool *)' {aka 'int(void *, struct dma_buf_sysfs_entry *, _Bool *)'}
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
   include/trace/hooks/vendor_hooks.h:79:9: note: in expansion of macro 'DECLARE_STATIC_CALL'
      79 |         DECLARE_STATIC_CALL(tp_func_##name, __traceiter_##name);        \
         |         ^~~~~~~~~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:104:9: note: in expansion of macro '__DECLARE_HOOK'
     104 |         __DECLARE_HOOK(name, PARAMS(proto), PARAMS(args),               \
         |         ^~~~~~~~~~~~~~
   include/trace/hooks/dmabuf.h:21:1: note: in expansion of macro 'DECLARE_RESTRICTED_HOOK'
      21 | DECLARE_RESTRICTED_HOOK(android_rvh_dma_buf_stats_teardown,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102:
   include/trace/trace_events.h:27:23: warning: 'str__dmabuf__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/pci.h:22,
                    from drivers/android/vendor_hooks.c:76:
   include/trace/trace_events.h:27:23: warning: 'str__pci__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/ipv4.h:34,
                    from drivers/android/vendor_hooks.c:75:
   include/trace/trace_events.h:27:23: warning: 'str__ipv4__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:27:23: note: in definition of macro '__app__'
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:30:29: note: in expansion of macro '__app'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]


vim +/__SCT__tp_func_android_rvh_dma_buf_stats_teardown +23 include/trace/hooks/dmabuf.h

    20	
    21	DECLARE_RESTRICTED_HOOK(android_rvh_dma_buf_stats_teardown,
    22		TP_PROTO(struct dma_buf_sysfs_entry *sysfs_entry, bool *skip_sysfs_release),
  > 23		TP_ARGS(sysfs_entry, skip_sysfs_release), 1);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
