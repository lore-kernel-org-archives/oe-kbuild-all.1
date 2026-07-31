Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0F942C511
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 14:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785507524; cv=none; b=jVxnQEAp+tdOt94HASdrEkLkp6NQ9g9wLPTkCmswZYg1yqrEOVe2imhx16SZvVv84Fki06KO5kUjOdrEWbRN6ZSV7b0SMoOvl6DSFmCUzZmtUooGV0M4aqlLCVgPh5YgI5lNeqQWYIiso/8sWn+Vl07qcflx2MWMCJruMPwePcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785507524; c=relaxed/simple;
	bh=Dsouj5NQ0aoYx8mbdUPoT/H2rOxslBo1CToUGaGu0a4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hTxB6mnLCpCbvDMEdpzjFBfaOSq2jBV65+mUpQMJhSQ6TYHeFCkyhLgH2ebevp0sY/twsD/AXT2ERVAdXXmqBVe1AWUV/Oza4lpbMErBjnR+w0kHjQtERPAHtjB5X7hj3IBKT42Cub7xKOSnLdTMKb0HkOOjCSXRnSw6VVBGVok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LOkaxx0t; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LOkaxx0t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785507523; x=1817043523;
  h=date:from:to:cc:subject:message-id;
  bh=Dsouj5NQ0aoYx8mbdUPoT/H2rOxslBo1CToUGaGu0a4=;
  b=LOkaxx0tbWE1HhJW6yhUIcypkOeNrtzd6nERVSyh8lXAEGgX6fls0YUh
   9mHA0PIqdl328DB8meLP5nRVThEbwmxSEkcrnCe/L10/cbA3hwfajr07V
   2+YVSbEb8/7KhEiDyB3blZ+ToxmY0KtpokZ6xLZNj77HO/oUPO3eVKxh/
   pEKGesyzGJXWCedKw0sy9bw++CgUjryzwHrmYR8VxXM1TZ1mK3Q0Txsol
   JiNIKaIucRLmXFZeuLEntusjAUWvNmVK3pcGgo6xGMD2FxiPR21swn3r5
   OuwpEoWQKz4qesMpRML70tb0axaJPJ2mcFryi9c9cif0ZfwQXBtItY2/q
   A==;
X-CSE-ConnectionGUID: 8efp8lgLRXSh67+Q8Almsg==
X-CSE-MsgGUID: 4xz5moDTTtip6QQRSvDD0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="86331909"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="86331909"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 07:18:41 -0700
X-CSE-ConnectionGUID: 14VAhja1SpGoHQsV2DMRCg==
X-CSE-MsgGUID: YrI1m831QuOU1UdYvGp3gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="285194877"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Jul 2026 07:18:39 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpo4K-000000001BP-2vp9;
	Fri, 31 Jul 2026 14:18:36 +0000
Date: Fri, 31 Jul 2026 22:17:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 0/2]
 kernel/rcu/update.c:52:1: error: use of undeclared identifier
 '__tracepoint_rcu_stall_warning'; did you mean
 '__tracepoint_rcu_utilization'?
Message-ID: <202607312206.zBPEeEsm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Qinglin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   b10e5e5b5c5e01d49829aec34b65a0d717d6f2f5
commit: d35bd9468fc35137ce63aff26dcb4bb3856d1657 [0/2] ANDROID: rcu: allow hooks into rcu stall warning
config: x86_64-randconfig-013-20260731 (https://download.01.org/0day-ci/archive/20260731/202607312206.zBPEeEsm-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project bacfe2950f8218268fcc0a8765644ea0c15f0360)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607312206.zBPEeEsm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607312206.zBPEeEsm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/rcu/update.c:52:1: error: use of undeclared identifier '__tracepoint_rcu_stall_warning'; did you mean '__tracepoint_rcu_utilization'?
      52 | EXPORT_TRACEPOINT_SYMBOL_GPL(rcu_stall_warning);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:328:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     328 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^~~~~~~~~~~~~~~~~~~
   <scratch space>:132:1: note: expanded from here
     132 | __tracepoint_rcu_stall_warning
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
   <scratch space>:42:1: note: expanded from here
      42 | __tracepoint_rcu_utilization
         | ^
>> kernel/rcu/update.c:52:1: error: use of undeclared identifier '__traceiter_rcu_stall_warning'; did you mean '__tracepoint_rcu_stall_warning'?
      52 | EXPORT_TRACEPOINT_SYMBOL_GPL(rcu_stall_warning);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:329:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     329 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |                           ^~~~~~~~~~~~~~~~~~
   <scratch space>:147:1: note: expanded from here
     147 | __traceiter_rcu_stall_warning
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/update.c:52:1: note: '__tracepoint_rcu_stall_warning' declared here
   include/linux/tracepoint.h:328:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     328 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^
   <scratch space>:132:1: note: expanded from here
     132 | __tracepoint_rcu_stall_warning
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
   <scratch space>:163:1: note: expanded from here
     163 | __SCK__tp_func_rcu_stall_warning
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
   <scratch space>:68:1: note: expanded from here
      68 | __SCK__tp_func_rcu_utilization
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
   <scratch space>:178:1: note: expanded from here
     178 | __SCT__tp_func_rcu_stall_warning
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
   <scratch space>:163:1: note: expanded from here
     163 | __SCK__tp_func_rcu_stall_warning
         | ^
   4 errors generated.


vim +52 kernel/rcu/update.c

    51	
  > 52	EXPORT_TRACEPOINT_SYMBOL_GPL(rcu_stall_warning);
    53	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
