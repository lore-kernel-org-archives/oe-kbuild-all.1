Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1BF51614C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 18:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790189079; cv=none; b=aB2XSrfpn0d1OZJVGRa+57MCJmhJBkNjLWcGBKSlZCWgJqHuwPxWbnmloe59rPv9EwiQlfag1PgO9knzgvERM0MqPBTwG70IIeMePjMgDS6JOIpMnTOd5LDktzll1wPfb6yKSIKn6hVjcX3mp2OCZb9h39cvuvA+HF/JtJtiOHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790189079; c=relaxed/simple;
	bh=VcvQSZ7kdm6/MgvaVCr6cLtzW1OtUUe5SMH6SS7qokw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QJsOm3CM9J4dA7D/QAMhVi22LRx2ni3m+BkhD1OIB6Eei2M9sheD1DAwRmDxTwwelEgZBy1xpdkqD92Muw2mc7AQy2zsgIkUtbLfFtkQhXF0U2LaSSRAN2Bio5saQPS6cDTK8nrUnzrXRYwllSfd21q5XqDpLiKPsQRL0Ugy+D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bJ18MprC; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bJ18MprC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790189067; x=1821725067;
  h=date:from:to:cc:subject:message-id;
  bh=VcvQSZ7kdm6/MgvaVCr6cLtzW1OtUUe5SMH6SS7qokw=;
  b=bJ18MprCMNYNqYjhJXivma1gskNTVdElX3jcphMH/5RYoVO7YR/5MJAL
   ZVBXpEPuObHtu2/XVuUiiw7UUdQDJE10czHLQW3z37aRLbuQ/OkHgc1kJ
   L/bdUZdirq/A2yQdifhs072+9B6bzRimsgEyyEDO9tD6k7BkYipSs9yM1
   KXx99uZwDjszO5lPSE/CQnT9h7I7P3B1Jv+V8gqZ3FCUeKaOoqFcBUsic
   Ntufd1zpsDTbTgUQnpImeU/ytf6dj/BDPG1oyKGPvl/qbvjMZ9DDCeoZC
   zF0bXKFH8BnKXWUBc18OQvXL9GgPYdYZ6+0RtmzLcmkwogfJ1yeFKddo7
   A==;
X-CSE-ConnectionGUID: yNzkeDVrSVKsFlcCd3v3hw==
X-CSE-MsgGUID: CGbzyYiFQtOaf/HPYaKBLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="90047572"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="90047572"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 11:44:20 -0700
X-CSE-ConnectionGUID: LzUpiGtHR2SgfyI8SwGkHA==
X-CSE-MsgGUID: iJU1ncYnT+WxPmCxSJYp/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="272314935"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Sep 2026 11:44:18 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9Rx1-00000000HXy-2UIu;
	Wed, 23 Sep 2026 18:44:15 +0000
Date: Thu, 24 Sep 2026 02:44:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1]
 include/trace/trace_events.h:27:23: warning:
 'str__cpufreq__trace_system_name' defined but not used
Message-ID: <202609240229.9hWXLftq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Todd,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   9b98c0cbf9c92b8fcc9077e711bed14b4e40ce3b
commit: efab334061ff7ed8f9dd5e28f2c7bdb09e2a77ec [1/1] ANDROID: add vendor hooks to override show_cpufinfo_max_freq
config: arm64-randconfig-1001-20260918 (https://download.01.org/0day-ci/archive/20260924/202609240229.9hWXLftq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609240229.9hWXLftq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609240229.9hWXLftq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/trace/define_trace.h:73:28: note: in expansion of macro 'PARAMS'
      73 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                            ^~~~~~
   include/trace/hooks/vendor_hooks.h:12:22: note: in expansion of macro 'DECLARE_TRACE'
      12 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/cpufreq.h:20:9: note: in expansion of macro 'TP_PROTO'
      20 |         TP_PROTO(struct cpufreq_policy *policy, unsigned int min_freq,
         |         ^~~~~~~~
   include/linux/tracepoint.h:303:13: error: conflicting types for '__traceiter_android_vh_freq_table_limits'; have 'int(void *, struct cpufreq_policy *, unsigned int,  unsigned int)'
     303 |         int __traceiter_##_name(void *__data, proto)                    \
         |             ^~~~~~~~~~~~
   include/linux/tracepoint.h:320:9: note: in expansion of macro 'DEFINE_TRACE_FN'
     320 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |         ^~~~~~~~~~~~~~~
   include/trace/define_trace.h:73:9: note: in expansion of macro 'DEFINE_TRACE'
      73 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:12:22: note: in expansion of macro 'DECLARE_TRACE'
      12 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/cpufreq.h:19:1: note: in expansion of macro 'DECLARE_HOOK'
      19 | DECLARE_HOOK(android_vh_freq_table_limits,
         | ^~~~~~~~~~~~
   include/linux/tracepoint.h:235:20: note: previous declaration of '__traceiter_android_vh_freq_table_limits' with type 'int(void *, struct cpufreq_policy *, unsigned int,  unsigned int)'
     235 |         extern int __traceiter_##name(data_proto);                      \
         |                    ^~~~~~~~~~~~
   include/linux/tracepoint.h:411:9: note: in expansion of macro '__DECLARE_TRACE'
     411 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:12:22: note: in expansion of macro 'DECLARE_TRACE'
      12 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/cpufreq.h:19:1: note: in expansion of macro 'DECLARE_HOOK'
      19 | DECLARE_HOOK(android_vh_freq_table_limits,
         | ^~~~~~~~~~~~
   In file included from <command-line>:
   include/linux/static_call_types.h:13:41: error: conflicting types for '__SCT__tp_func_android_vh_freq_table_limits'; have 'int(void *, struct cpufreq_policy *, unsigned int,  unsigned int)'
      13 | #define STATIC_CALL_TRAMP_PREFIX        __SCT__
         |                                         ^~~~~~~
   include/linux/compiler_types.h:59:23: note: in definition of macro '___PASTE'
      59 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/static_call_types.h:16:41: note: in expansion of macro '__PASTE'
      16 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                         ^~~~~~~
   include/linux/static_call_types.h:16:49: note: in expansion of macro 'STATIC_CALL_TRAMP_PREFIX'
      16 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:128:29: note: in expansion of macro 'STATIC_CALL_TRAMP'
     128 |         extern typeof(func) STATIC_CALL_TRAMP(name);
         |                             ^~~~~~~~~~~~~~~~~
   include/linux/static_call.h:244:9: note: in expansion of macro 'DECLARE_STATIC_CALL'
     244 |         DECLARE_STATIC_CALL(name, _func);                               \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:317:9: note: in expansion of macro 'DEFINE_STATIC_CALL'
     317 |         DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:320:9: note: in expansion of macro 'DEFINE_TRACE_FN'
     320 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |         ^~~~~~~~~~~~~~~
   include/trace/define_trace.h:73:9: note: in expansion of macro 'DEFINE_TRACE'
      73 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:12:22: note: in expansion of macro 'DECLARE_TRACE'
      12 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/cpufreq.h:19:1: note: in expansion of macro 'DECLARE_HOOK'
      19 | DECLARE_HOOK(android_vh_freq_table_limits,
         | ^~~~~~~~~~~~
   include/linux/static_call_types.h:13:41: note: previous declaration of '__SCT__tp_func_android_vh_freq_table_limits' with type 'int(void *, struct cpufreq_policy *, unsigned int,  unsigned int)'
      13 | #define STATIC_CALL_TRAMP_PREFIX        __SCT__
         |                                         ^~~~~~~
   include/linux/compiler_types.h:59:23: note: in definition of macro '___PASTE'
      59 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/static_call_types.h:16:41: note: in expansion of macro '__PASTE'
      16 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                         ^~~~~~~
   include/linux/static_call_types.h:16:49: note: in expansion of macro 'STATIC_CALL_TRAMP_PREFIX'
      16 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:128:29: note: in expansion of macro 'STATIC_CALL_TRAMP'
     128 |         extern typeof(func) STATIC_CALL_TRAMP(name);
         |                             ^~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:236:9: note: in expansion of macro 'DECLARE_STATIC_CALL'
     236 |         DECLARE_STATIC_CALL(tp_func_##name, __traceiter_##name);        \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:411:9: note: in expansion of macro '__DECLARE_TRACE'
     411 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:12:22: note: in expansion of macro 'DECLARE_TRACE'
      12 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/cpufreq.h:19:1: note: in expansion of macro 'DECLARE_HOOK'
      19 | DECLARE_HOOK(android_vh_freq_table_limits,
         | ^~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/cpufreq.h:32,
                    from drivers/android/vendor_hooks.c:27:
>> include/trace/trace_events.h:27:23: warning: 'str__cpufreq__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:28:21: note: in expansion of macro '__app__'
      28 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
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
                    from include/trace/hooks/epoch.h:31,
                    from drivers/android/vendor_hooks.c:26:
   include/trace/trace_events.h:27:23: warning: 'str__epoch__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:28:21: note: in expansion of macro '__app__'
      28 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
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
                    from include/trace/hooks/gic_v3.h:29,
                    from drivers/android/vendor_hooks.c:25:
   include/trace/trace_events.h:27:23: warning: 'str__gic_v3__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:28:21: note: in expansion of macro '__app__'
      28 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
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
                    from include/trace/hooks/printk.h:27,
                    from drivers/android/vendor_hooks.c:24:
   include/trace/trace_events.h:27:23: warning: 'str__printk__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:28:21: note: in expansion of macro '__app__'
      28 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
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
                    from include/trace/hooks/sysrqcrash.h:24,
                    from drivers/android/vendor_hooks.c:23:
   include/trace/trace_events.h:27:23: warning: 'str__sysrqcrash__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:28:21: note: in expansion of macro '__app__'
      28 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
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
                    from include/trace/hooks/debug.h:26,
                    from drivers/android/vendor_hooks.c:22:
   include/trace/trace_events.h:27:23: warning: 'str__debug__trace_system_name' defined but not used [-Wunused-const-variable=]
      27 | #define __app__(x, y) str__##x##y
         |                       ^~~~~
   include/trace/trace_events.h:28:21: note: in expansion of macro '__app__'
      28 | #define __app(x, y) __app__(x, y)
         |                     ^~~~~~~
   include/trace/trace_events.h:30:29: note: in expansion of macro '__app'
      30 | #define TRACE_SYSTEM_STRING __app(TRACE_SYSTEM_VAR,__trace_system_name)
         |                             ^~~~~
   include/trace/trace_events.h:33:27: note: in expansion of macro 'TRACE_SYSTEM_STRING'
      33 |         static const char TRACE_SYSTEM_STRING[] =       \

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=y] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +/str__cpufreq__trace_system_name +27 include/trace/trace_events.h

acd388fd3af350a include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31  26) 
acd388fd3af350a include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31 @27) #define __app__(x, y) str__##x##y
acd388fd3af350a include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31  28) #define __app(x, y) __app__(x, y)
acd388fd3af350a include/trace/ftrace.h Steven Rostedt (Red Hat  2015-03-31  29) 

:::::: The code at line 27 was first introduced by commit
:::::: acd388fd3af350ab24c6ab6f19b83fc4a4f3aa60 tracing: Give system name a pointer

:::::: TO: Steven Rostedt (Red Hat) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt <rostedt@goodmis.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
