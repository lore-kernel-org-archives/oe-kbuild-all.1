Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F363F78F26
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 19:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766691213; cv=none; b=luT5d8NsGME4+Mk5Zsona4+uZ5a/eWcuxbwICe2hD8fVKquMX4qGOT2OJFjdWVhFMz96XFcEZG34uAYDPZvvlmE0IJfOOWF6+qkiRR0Afgtomf07flj28PNjFsO15tWu9HaU5e+NEXyBJxyQefUkAqhoeBsrJv56rw5jujul/Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766691213; c=relaxed/simple;
	bh=KvSCpLABEr4frOTceW6ajgc/9WMKPGjj9irTrYLSuGc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ny44OtRHC4wPvPlrSKcIbAZOZ8qDij1TdiRJ8IgjFX5UfqMPc/HpFDhItQ3RaXwFPbsm5YgIftMDGOpNhYEbHzh1rC2oZAY9x68rE7J2cMAohf6tCG4POnQ9Ss2myik3olIomkhgd1KaslujXUgrbr8QD6HgWtA3vOXUrYB2Los=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QDWHcU9i; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QDWHcU9i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766691211; x=1798227211;
  h=date:from:to:cc:subject:message-id;
  bh=KvSCpLABEr4frOTceW6ajgc/9WMKPGjj9irTrYLSuGc=;
  b=QDWHcU9ig+FYldzkDQM3vNg/wP9GZ/uDTFApcG/MQc8Uf6MCz2S/hFZk
   kLdftaQbpQNQC+NLWH2OQBILlzPn6rgbdmGTyU4tcll6Qd4X56aVM1qHr
   sEWuxRO9Ys92WVItQWPx1yMuuUMCqgXUVtJoA+XJiaXAQCp3OpML/iv29
   lCnV6ZxpWRHfa62Qa+diFYBVWrZmrEIaGTSqud8GqN6pxp4xr5mAfrtyc
   veXaKA2iikz1y24YxnrHV/WaRUy3WT370okaOgnWQOpzHMiBZnK+kzCtj
   1KkoAocx12pOKLOxxtIGpNUJhj+IO8ngY9OIGbEyy0GvMeGhDWsUT/zQR
   g==;
X-CSE-ConnectionGUID: cYZV6p1uSXKsaf+ZGgp+ZA==
X-CSE-MsgGUID: GaWftfeXQ8WN0VO7thX2Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="71060433"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="71060433"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 11:33:30 -0800
X-CSE-ConnectionGUID: 31eIdWK/QmuXtfk5nVKZhQ==
X-CSE-MsgGUID: s4FpSfxHT7eAtRSAmWGsVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="200175886"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 25 Dec 2025 11:33:29 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYr5Q-000000004Pd-1DGa;
	Thu, 25 Dec 2025 19:33:24 +0000
Date: Fri, 26 Dec 2025 03:33:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/1]
 kernel/rcu/update.c:52:1: error: use of undeclared identifier
 '__tracepoint_rcu_stall_warning'; did you mean
 '__tracepoint_rcu_utilization'?
Message-ID: <202512260306.APtzFC2U-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   eac9374c1d13f8d343094e7b0ceeafa4b833993d
commit: 4cb1881c45939c3e9415e76765b756f412f0fbe3 [1/1] ANDROID: rcu: allow hooks into rcu stall warning
config: x86_64-buildonly-randconfig-004-20251225 (https://download.01.org/0day-ci/archive/20251226/202512260306.APtzFC2U-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512260306.APtzFC2U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512260306.APtzFC2U-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/rcu/update.c:52:1: error: use of undeclared identifier '__tracepoint_rcu_stall_warning'; did you mean '__tracepoint_rcu_utilization'?
      52 | EXPORT_TRACEPOINT_SYMBOL_GPL(rcu_stall_warning);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:328:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     328 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^~~~~~~~~~~~~~~~~~~
   <scratch space>:60:1: note: expanded from here
      60 | __tracepoint_rcu_stall_warning
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/events/rcu.h:27:1: note: '__tracepoint_rcu_utilization' declared here
      27 | TRACE_EVENT(rcu_utilization,
         | ^
   include/trace/define_trace.h:28:2: note: expanded from macro 'TRACE_EVENT'
      28 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:325:2: note: expanded from macro 'DEFINE_TRACE'
     325 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |         ^
   include/linux/tracepoint.h:295:20: note: expanded from macro 'DEFINE_TRACE_FN'
     295 |         struct tracepoint __tracepoint_##_name  __used                  \
         |                           ^
   <scratch space>:151:1: note: expanded from here
     151 | __tracepoint_rcu_utilization
         | ^
>> kernel/rcu/update.c:52:1: error: use of undeclared identifier '__traceiter_rcu_stall_warning'; did you mean '__tracepoint_rcu_stall_warning'?
      52 | EXPORT_TRACEPOINT_SYMBOL_GPL(rcu_stall_warning);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:329:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     329 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |                           ^~~~~~~~~~~~~~~~~~
   <scratch space>:75:1: note: expanded from here
      75 | __traceiter_rcu_stall_warning
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/update.c:52:1: note: '__tracepoint_rcu_stall_warning' declared here
   include/linux/tracepoint.h:328:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     328 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^
   <scratch space>:60:1: note: expanded from here
      60 | __tracepoint_rcu_stall_warning
         | ^
>> kernel/rcu/update.c:52:1: error: use of undeclared identifier '__SCK__tp_func_rcu_stall_warning'; did you mean '__SCK__tp_func_rcu_utilization'?
      52 | EXPORT_TRACEPOINT_SYMBOL_GPL(rcu_stall_warning);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:330:2: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     330 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:207:20: note: expanded from macro 'EXPORT_STATIC_CALL_GPL'
     207 |         EXPORT_SYMBOL_GPL(STATIC_CALL_KEY(name));                       \
         |                           ^~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:12:32: note: expanded from macro 'STATIC_CALL_KEY'
      12 | #define STATIC_CALL_KEY(name)           __PASTE(STATIC_CALL_KEY_PREFIX, name)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:60:22: note: expanded from macro '__PASTE'
      60 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~~~~~~
   include/linux/compiler_types.h:59:23: note: expanded from macro '___PASTE'
      59 | #define ___PASTE(a,b) a##b
         |                       ^~~~
   <scratch space>:91:1: note: expanded from here
      91 | __SCK__tp_func_rcu_stall_warning
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/events/rcu.h:27:1: note: '__SCK__tp_func_rcu_utilization' declared here
      27 | TRACE_EVENT(rcu_utilization,
         | ^
   include/trace/define_trace.h:28:2: note: expanded from macro 'TRACE_EVENT'
      28 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:325:2: note: expanded from macro 'DEFINE_TRACE'
     325 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |         ^
   include/linux/tracepoint.h:322:2: note: expanded from macro 'DEFINE_TRACE_FN'
     322 |         DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);
         |         ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:60:22: note: expanded from macro '__PASTE'
      60 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:59:23: note: expanded from macro '___PASTE'
      59 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:171:1: note: expanded from here
     171 | __SCK__tp_func_rcu_utilization
         | ^
>> kernel/rcu/update.c:52:1: error: use of undeclared identifier '__SCT__tp_func_rcu_stall_warning'; did you mean '__SCK__tp_func_rcu_stall_warning'?
      52 | EXPORT_TRACEPOINT_SYMBOL_GPL(rcu_stall_warning);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:330:2: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     330 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:208:20: note: expanded from macro 'EXPORT_STATIC_CALL_GPL'
     208 |         EXPORT_SYMBOL_GPL(STATIC_CALL_TRAMP(name))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:18:34: note: expanded from macro 'STATIC_CALL_TRAMP'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:60:22: note: expanded from macro '__PASTE'
      60 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~~~~~~
   include/linux/compiler_types.h:59:23: note: expanded from macro '___PASTE'
      59 | #define ___PASTE(a,b) a##b
         |                       ^~~~
   <scratch space>:106:1: note: expanded from here
     106 | __SCT__tp_func_rcu_stall_warning
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/update.c:52:1: note: '__SCK__tp_func_rcu_stall_warning' declared here
   include/linux/tracepoint.h:330:2: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     330 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^
   include/linux/static_call.h:207:20: note: expanded from macro 'EXPORT_STATIC_CALL_GPL'
     207 |         EXPORT_SYMBOL_GPL(STATIC_CALL_KEY(name));                       \
         |                           ^
   include/linux/static_call_types.h:12:32: note: expanded from macro 'STATIC_CALL_KEY'
      12 | #define STATIC_CALL_KEY(name)           __PASTE(STATIC_CALL_KEY_PREFIX, name)
         |                                         ^
   include/linux/compiler_types.h:60:22: note: expanded from macro '__PASTE'
      60 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:59:23: note: expanded from macro '___PASTE'
      59 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:91:1: note: expanded from here
      91 | __SCK__tp_func_rcu_stall_warning
         | ^
   4 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for NETFILTER_FAMILY_BRIDGE
   Depends on [n]: NET [=y] && INET [=n] && NETFILTER [=y]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +52 kernel/rcu/update.c

    51	
  > 52	EXPORT_TRACEPOINT_SYMBOL_GPL(rcu_stall_warning);
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
