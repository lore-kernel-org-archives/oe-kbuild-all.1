Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5636D2D5926
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Sep 2026 06:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790231619; cv=none; b=rz5QnsNhHld+SPt1pjqAU3ry/lDd679udFOV3hD4T1LMJtDgU/B3pLR1CMdnxtTZUUw1/5hyGhu21nLwo6tw7S6AbOC+3eES3UL7y95PVeOQsWMdEztypseICcOVC5YQ/25hUs4qwcw+j1PmJ7B8Pk6wtiJLyKCUh04Gr9phDuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790231619; c=relaxed/simple;
	bh=sd6t8mhAARXWRAxyiwRvFf0FC0SzfK6yx6AUXWHugig=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VrEYTxm/tTdyKLqBbZtZJzMxqKkRUGuNwDbg/uqhxYffZKQMltcViGTVudb+PMugWIFKGMaWlsMM/N+H8ioOJ6om1FqVFPPBfQeWnOkZoMM99mMQTmE7bvAKida//SoDaonQoFyNcb9Zr4DFFzPB0R4hZR1xGeKwLnllW6NnzoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yw1o4g2N; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yw1o4g2N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790231617; x=1821767617;
  h=date:from:to:cc:subject:message-id;
  bh=sd6t8mhAARXWRAxyiwRvFf0FC0SzfK6yx6AUXWHugig=;
  b=Yw1o4g2NArULhOJKoEnDzxV+8uuhZ0vyDzwqdZm6S2C391yMPyQKZGfo
   P1fqFPOp9wWDQfKGeQumUJVmKMZF9EuKCwZg67MmO6veGjZrXTgCyTqJt
   jacWtrVpPcIdqoilYptmB4V8R8Ko388SAvvGebT1UWuAXEp8j94AApfT6
   r+PVrB5E0SFeNxfvtwbbPnnZe6WVhdZWvdZPkCL83RjupRGB83Iaq+OUc
   Z3d+WR5FZXNhGFRM3uPVoco7KwDCPOQLB8xZaCnVO2m+N6StyPyAc1Hg0
   a8at631jAgdL3TMo6SJzuDhQ+KoQvLg0VLKX/eif+G8fk+3jTUwyfO0++
   Q==;
X-CSE-ConnectionGUID: KX1+uP9PT224h+rUh7wh0g==
X-CSE-MsgGUID: jrozThtIT1KhRO9qEprOtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="89854449"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="89854449"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 23:33:35 -0700
X-CSE-ConnectionGUID: NjdhjS2KR+WhUu09e5tjLw==
X-CSE-MsgGUID: 8OIyJqSoRfmL+OTE1P5lyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="270425768"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Sep 2026 23:33:33 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9d1P-00000000IIo-19Np;
	Thu, 24 Sep 2026 06:33:31 +0000
Date: Thu, 24 Sep 2026 14:33:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1]
 include/trace/trace_events.h:27:23: warning: 'str__bug__trace_system_name'
 defined but not used
Message-ID: <202609241433.crcTgXYz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Sangmoon,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   9b98c0cbf9c92b8fcc9077e711bed14b4e40ce3b
commit: 505e967879727f5c83185c633c7824e900fb2774 [1/1] ANDROID: bug: add vendor hook for bug trap
config: arm64-randconfig-1001-20260918 (https://download.01.org/0day-ci/archive/20260924/202609241433.crcTgXYz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609241433.crcTgXYz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609241433.crcTgXYz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/trace/define_trace.h:73:28: note: in expansion of macro 'PARAMS'
      73 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |                            ^~~~~~
   include/trace/hooks/vendor_hooks.h:14:22: note: in expansion of macro 'DECLARE_TRACE'
      14 | #define DECLARE_HOOK DECLARE_TRACE
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
   include/trace/hooks/vendor_hooks.h:14:22: note: in expansion of macro 'DECLARE_TRACE'
      14 | #define DECLARE_HOOK DECLARE_TRACE
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
   include/trace/hooks/vendor_hooks.h:14:22: note: in expansion of macro 'DECLARE_TRACE'
      14 | #define DECLARE_HOOK DECLARE_TRACE
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
   include/trace/hooks/vendor_hooks.h:14:22: note: in expansion of macro 'DECLARE_TRACE'
      14 | #define DECLARE_HOOK DECLARE_TRACE
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
   include/trace/hooks/vendor_hooks.h:14:22: note: in expansion of macro 'DECLARE_TRACE'
      14 | #define DECLARE_HOOK DECLARE_TRACE
         |                      ^~~~~~~~~~~~~
   include/trace/hooks/cpufreq.h:19:1: note: in expansion of macro 'DECLARE_HOOK'
      19 | DECLARE_HOOK(android_vh_freq_table_limits,
         | ^~~~~~~~~~~~
   In file included from include/trace/define_trace.h:102,
                    from include/trace/hooks/bug.h:22,
                    from drivers/android/vendor_hooks.c:32:
>> include/trace/trace_events.h:27:23: warning: 'str__bug__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/pm_domain.h:26,
                    from drivers/android/vendor_hooks.c:31:
   include/trace/trace_events.h:27:23: warning: 'str__pm_domain__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/ftrace_dump.h:50,
                    from drivers/android/vendor_hooks.c:30:
   include/trace/trace_events.h:27:23: warning: 'str__ftrace_dump__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/preemptirq.h:43,
                    from drivers/android/vendor_hooks.c:29:
   include/trace/trace_events.h:27:23: warning: 'str__preemptirq__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/mm.h:38,
                    from drivers/android/vendor_hooks.c:28:
   include/trace/trace_events.h:27:23: warning: 'str__mm__trace_system_name' defined but not used [-Wunused-const-variable=]
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
                    from include/trace/hooks/cpufreq.h:32,
                    from drivers/android/vendor_hooks.c:27:
   include/trace/trace_events.h:27:23: warning: 'str__cpufreq__trace_system_name' defined but not used [-Wunused-const-variable=]
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


vim +/str__bug__trace_system_name +27 include/trace/trace_events.h

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
