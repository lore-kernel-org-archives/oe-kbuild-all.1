Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8A8440630
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Sep 2026 21:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790285841; cv=none; b=R+Xvqp90ScHm9KGf1Popb597zCuqXvq/vEKHYvycvzAmpiAwXKRK8gDgD2q78HRalyiE7zAZ3aLs3gYf3S04VSraCLpbuuh4Z65j+NG1O9GaLn2t9ugaVXZDp4P1ngK3iwg6P4P0FfVCF05tpigpcjTNrL7fHkV1n1Cxz0ufpnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790285841; c=relaxed/simple;
	bh=H9nm683ofiAIjz+1NG6DswyTfFCQ3xWx1G+bxmB0x7w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IgIljTF560b4cKWmXDg3wPR1bdOTkrf8eZbDQPfDkBBWxZpgx92AsPKAPPzkELeveqK+5QPm2VZhM5b6h5GPyIf7aWEykdqzOX0d8iNK+wSinGqMSFqwKixLBhnGOgCIaLKkMAiSisWjJznNyupCUbdadAEVdmuF2yvx9Td3DXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z1EYYj71; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z1EYYj71"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790285839; x=1821821839;
  h=date:from:to:cc:subject:message-id;
  bh=H9nm683ofiAIjz+1NG6DswyTfFCQ3xWx1G+bxmB0x7w=;
  b=Z1EYYj71y3wjBM7GplQwESznYIZTegfdzDrNnh7jh3QLW8SEKvjg/B6r
   dC7RBHV74wiBvPRl5dZsKOwJUwUlmfa73IocxeMTtSx5DPR98ub/WuQzG
   +PSsgUeQSK9JHNBQU+ERaXlN9b4zlbKZX9iPyh+FSkyBF+cq8VIRE6QkF
   CZ/yzGRcPg+N6zn75rNtUZWBlzwzK3aZoGM7ShVh7Dzl1QmIumDviaU3i
   uCqPXXCTYZcpc7LxcMNnlyYg0HbvKj8+2Zsvc0dXeHtGixyAHvtj5gTFM
   sF+/iTksQmfPMh4LVmtAM+xErCOMuvEoHfrk2H2tMcumKqo3XhXVkUhtT
   A==;
X-CSE-ConnectionGUID: cIaOWJ4uRkCCae48IFwymw==
X-CSE-MsgGUID: bct6JO31QuCxgi6d+8vdqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="78629622"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="78629622"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 14:37:18 -0700
X-CSE-ConnectionGUID: G6F7fBA2Tda4KszciHqp6Q==
X-CSE-MsgGUID: iNRXU0+bQOSM1zwQ7gemhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="272264891"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Sep 2026 14:37:16 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9r7y-00000000Jd8-0Mpy;
	Thu, 24 Sep 2026 21:37:14 +0000
Date: Fri, 25 Sep 2026 05:36:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1]
 include/trace/trace_events.h:27:23: warning:
 'str__thermal__trace_system_name' defined but not used
Message-ID: <202609250537.UPPw4Ayo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi davidchao,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   9b98c0cbf9c92b8fcc9077e711bed14b4e40ce3b
commit: ea8600cea83a77a6f512578ebf02de43bf680c1e [1/1] ANDROID: thermal: Add vendor thermal genl event function
config: arm64-randconfig-1001-20260918 (https://download.01.org/0day-ci/archive/20260925/202609250537.UPPw4Ayo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609250537.UPPw4Ayo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609250537.UPPw4Ayo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/trace/define_trace.h:73:28: note: in expansion of macro 'PARAMS'
      73 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                            ^~~~~~
   include/trace/hooks/vendor_hooks.h:14:22: note: in expansion of macro 'DECLARE_TRACE'
      14 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/cpufreq.h:18:9: note: in expansion of macro 'TP_PROTO'
      18 |         TP_PROTO(struct cpufreq_policy *policy, unsigned int min_freq,
         |         ^~~~~~~~
   include/linux/tracepoint.h:303:13: error: conflicting types for '__traceiter_android_vh_freq_table_limits'; have 'int(void *, struct cpufreq_policy *, unsigned int,  unsigned int)'
     303 |         int __traceiter_##_name(void *__data, proto)                    \
         |             ^~~~~~~~~~~~
   include/linux/tracepoint.h:322:9: note: in expansion of macro 'DEFINE_TRACE_FN'
     322 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |         ^~~~~~~~~~~~~~~
   include/trace/define_trace.h:73:9: note: in expansion of macro 'DEFINE_TRACE'
      73 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:14:22: note: in expansion of macro 'DECLARE_TRACE'
      14 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/cpufreq.h:17:1: note: in expansion of macro 'DECLARE_HOOK'
      17 | DECLARE_HOOK(android_vh_freq_table_limits,
         | ^~~~~~~~~~~~
   include/linux/tracepoint.h:235:20: note: previous declaration of '__traceiter_android_vh_freq_table_limits' with type 'int(void *, struct cpufreq_policy *, unsigned int,  unsigned int)'
     235 |         extern int __traceiter_##name(data_proto);                      \
         |                    ^~~~~~~~~~~~
   include/linux/tracepoint.h:413:9: note: in expansion of macro '__DECLARE_TRACE'
     413 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:14:22: note: in expansion of macro 'DECLARE_TRACE'
      14 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/cpufreq.h:17:1: note: in expansion of macro 'DECLARE_HOOK'
      17 | DECLARE_HOOK(android_vh_freq_table_limits,
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
   include/linux/tracepoint.h:319:9: note: in expansion of macro 'DEFINE_STATIC_CALL'
     319 |         DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:322:9: note: in expansion of macro 'DEFINE_TRACE_FN'
     322 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |         ^~~~~~~~~~~~~~~
   include/trace/define_trace.h:73:9: note: in expansion of macro 'DEFINE_TRACE'
      73 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:14:22: note: in expansion of macro 'DECLARE_TRACE'
      14 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/cpufreq.h:17:1: note: in expansion of macro 'DECLARE_HOOK'
      17 | DECLARE_HOOK(android_vh_freq_table_limits,
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
   include/linux/tracepoint.h:413:9: note: in expansion of macro '__DECLARE_TRACE'
     413 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/trace/hooks/vendor_hooks.h:14:22: note: in expansion of macro 'DECLARE_TRACE'
      14 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/cpufreq.h:17:1: note: in expansion of macro 'DECLARE_HOOK'
      17 | DECLARE_HOOK(android_vh_freq_table_limits,
         | ^~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/thermal.h:19,
                    from drivers/android/vendor_hooks.c:39:
>> include/trace/trace_events.h:27:23: warning: 'str__thermal__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/iommu.h:30,
                    from drivers/android/vendor_hooks.c:38:
   include/trace/trace_events.h:27:23: warning: 'str__iommu__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/fault.h:36,
                    from drivers/android/vendor_hooks.c:37:
   include/trace/trace_events.h:27:23: warning: 'str__fault__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/power.h:27,
                    from drivers/android/vendor_hooks.c:36:
   include/trace/trace_events.h:27:23: warning: 'str__power__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/softlockup.h:23,
                    from drivers/android/vendor_hooks.c:35:
   include/trace/trace_events.h:27:23: warning: 'str__softlockup__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/timer.h:19,
                    from drivers/android/vendor_hooks.c:34:
   include/trace/trace_events.h:27:23: warning: 'str__timer__trace_system_name' defined but not used [-Wunused-const-variable=]
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


vim +/str__thermal__trace_system_name +27 include/trace/trace_events.h

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
