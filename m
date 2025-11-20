Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E482C79CF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 10:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763634417; cv=none; b=q2WEHo5+zoMC1UCnTLTbl7uFCqSomP7KqvHKN0fONU7mRaF3mPy2+sxfvQ1pLet/KaVjkDdCruyUvyGp5ipPKyEu0twjsxJ4VTq4BosHx/2+JrwHlWAjoM0BosEb4xlZpHNI0sXRHt0+J8iEXRVDsn35k5AaV40QfVR2IzetRnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763634417; c=relaxed/simple;
	bh=MZtEx1hTVdTka3zso3fo/X2RKteMxsaJZ2LqsmHyAxM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z/4KinO3vnCDWeBhMKMX/agaPorYxQ+jOt7NGTbmbG1+NB4N1Gu/Xh72OGrVpkPhhlTMWdoc8ma5LUWCzjhopGBajhdkrnSFraNok/wYZRqi/qapgtdny2PybX2NFTlsGisFsTecgDFcO+fMd73qdZaIRTeUczEhinyAdnfieeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m2L/9b2v; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m2L/9b2v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763634416; x=1795170416;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MZtEx1hTVdTka3zso3fo/X2RKteMxsaJZ2LqsmHyAxM=;
  b=m2L/9b2v3nvLFt2XrdqssQy8orE48KNKwp775uFNxzQzq+5h8iN9UthF
   94cndge/HhzDzVqX1G0gZlvIy08uBwPsIv4wyBRJbXf07FMAHmFK7Lv8P
   bprBhzf/vdzC4lplMu6AVWePDxfL31+/IKi4H3d2QvXsDpsN3rgSz8rRq
   Nj6U5F9cuqguUvgwPti/wry1nJtYLabCCgdHHFN0L5PAhm66Y6gyE+8Yy
   o/gECT7tthvlsnZ6aGJTLMvWLVDBEX1y7u+D5BWC+aloN63ljHhwaJtSq
   860gF67T8eUMz+Ou5mXQTbf/RnFiL3HiGq6MQH4Hnv8+LnpDk82P79vRq
   g==;
X-CSE-ConnectionGUID: cxYAporMQHiNtAvYysFpnQ==
X-CSE-MsgGUID: s0LaQH6GSuyI4p3JvAh2hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65736205"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="65736205"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 02:26:56 -0800
X-CSE-ConnectionGUID: h4dd6JT6RjqC/9fNyfPIrg==
X-CSE-MsgGUID: NFIKZJfXRzi9D7REkT+NGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="221966254"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Nov 2025 02:26:55 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vM1sJ-0003r5-2P;
	Thu, 20 Nov 2025 10:26:51 +0000
Date: Thu, 20 Nov 2025 18:26:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 3/3] kernel/rcu/update.c:53:1: error:
 use of undeclared identifier '__tracepoint_rcu_stall_warning'; did you mean
 '__tracepoint_rcu_utilization'?
Message-ID: <202511201846.jbzY99Bi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   a15958de6871ffdaddb3c5736a489a5e3d6a3059
commit: 5019ece9a34a655ee3def1159956106b706cde5e [3/3] ANDROID: rcu: allow hooks into rcu stall warning
config: x86_64-randconfig-075-20251120 (https://download.01.org/0day-ci/archive/20251120/202511201846.jbzY99Bi-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511201846.jbzY99Bi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511201846.jbzY99Bi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/rcu/update.c:53:1: error: use of undeclared identifier '__tracepoint_rcu_stall_warning'; did you mean '__tracepoint_rcu_utilization'?
      53 | EXPORT_TRACEPOINT_SYMBOL_GPL(rcu_stall_warning);
         | ^
   include/linux/tracepoint.h:385:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     385 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^
   <scratch space>:6:1: note: expanded from here
       6 | __tracepoint_rcu_stall_warning
         | ^
   include/trace/events/rcu.h:27:1: note: '__tracepoint_rcu_utilization' declared here
      27 | TRACE_EVENT(rcu_utilization,
         | ^
   include/trace/define_trace.h:28:2: note: expanded from macro 'TRACE_EVENT'
      28 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:382:2: note: expanded from macro 'DEFINE_TRACE'
     382 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |         ^
   include/linux/tracepoint.h:347:20: note: expanded from macro 'DEFINE_TRACE_FN'
     347 |         struct tracepoint __tracepoint_##_name  __used                  \
         |                           ^
   <scratch space>:124:1: note: expanded from here
     124 | __tracepoint_rcu_utilization
         | ^
>> kernel/rcu/update.c:53:1: error: use of undeclared identifier '__traceiter_rcu_stall_warning'; did you mean '__tracepoint_rcu_stall_warning'?
      53 | EXPORT_TRACEPOINT_SYMBOL_GPL(rcu_stall_warning);
         | ^
   include/linux/tracepoint.h:386:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     386 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |                           ^
   <scratch space>:13:1: note: expanded from here
      13 | __traceiter_rcu_stall_warning
         | ^
   kernel/rcu/update.c:53:1: note: '__tracepoint_rcu_stall_warning' declared here
   include/linux/tracepoint.h:385:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     385 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^
   <scratch space>:6:1: note: expanded from here
       6 | __tracepoint_rcu_stall_warning
         | ^
>> kernel/rcu/update.c:53:1: error: use of undeclared identifier '__SCK__tp_func_rcu_stall_warning'; did you mean '__SCK__tp_func_rcu_utilization'?
      53 | EXPORT_TRACEPOINT_SYMBOL_GPL(rcu_stall_warning);
         | ^
   include/linux/tracepoint.h:387:2: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     387 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^
   include/linux/static_call.h:217:20: note: expanded from macro 'EXPORT_STATIC_CALL_GPL'
     217 |         EXPORT_SYMBOL_GPL(STATIC_CALL_KEY(name));                       \
         |                           ^
   include/linux/static_call_types.h:12:32: note: expanded from macro 'STATIC_CALL_KEY'
      12 | #define STATIC_CALL_KEY(name)           __PASTE(STATIC_CALL_KEY_PREFIX, name)
         |                                         ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:21:1: note: expanded from here
      21 | __SCK__tp_func_rcu_stall_warning
         | ^
   include/trace/events/rcu.h:27:1: note: '__SCK__tp_func_rcu_utilization' declared here
      27 | TRACE_EVENT(rcu_utilization,
         | ^
   include/trace/define_trace.h:28:2: note: expanded from macro 'TRACE_EVENT'
      28 |         DEFINE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:382:2: note: expanded from macro 'DEFINE_TRACE'
     382 |         DEFINE_TRACE_FN(name, NULL, NULL, PARAMS(proto), PARAMS(args));
         |         ^
   include/linux/tracepoint.h:378:2: note: expanded from macro 'DEFINE_TRACE_FN'
     378 |         DEFINE_STATIC_CALL(tp_func_##_name, __traceiter_##_name);       \
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:149:1: note: expanded from here
     149 | __SCK__tp_func_rcu_utilization
         | ^
>> kernel/rcu/update.c:53:1: error: use of undeclared identifier '__SCT__tp_func_rcu_stall_warning'; did you mean '__SCK__tp_func_rcu_stall_warning'?
      53 | EXPORT_TRACEPOINT_SYMBOL_GPL(rcu_stall_warning);
         | ^
   include/linux/tracepoint.h:387:2: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     387 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^
   include/linux/static_call.h:218:20: note: expanded from macro 'EXPORT_STATIC_CALL_GPL'
     218 |         EXPORT_SYMBOL_GPL(STATIC_CALL_TRAMP(name))
         |                           ^
   include/linux/static_call_types.h:18:34: note: expanded from macro 'STATIC_CALL_TRAMP'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                         ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:28:1: note: expanded from here
      28 | __SCT__tp_func_rcu_stall_warning
         | ^
   kernel/rcu/update.c:53:1: note: '__SCK__tp_func_rcu_stall_warning' declared here
   include/linux/tracepoint.h:387:2: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     387 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^
   include/linux/static_call.h:217:20: note: expanded from macro 'EXPORT_STATIC_CALL_GPL'
     217 |         EXPORT_SYMBOL_GPL(STATIC_CALL_KEY(name));                       \
         |                           ^
   include/linux/static_call_types.h:12:32: note: expanded from macro 'STATIC_CALL_KEY'
      12 | #define STATIC_CALL_KEY(name)           __PASTE(STATIC_CALL_KEY_PREFIX, name)
         |                                         ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:21:1: note: expanded from here
      21 | __SCK__tp_func_rcu_stall_warning
         | ^
   4 errors generated.


vim +53 kernel/rcu/update.c

    52	
  > 53	EXPORT_TRACEPOINT_SYMBOL_GPL(rcu_stall_warning);
    54	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
