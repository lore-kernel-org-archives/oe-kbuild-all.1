Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6961431CA4E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 23:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783552500; cv=none; b=cXa4lGN8UmV8f6ZzihHkYf/MIdsGxAnVKkJYUp9XNxfC5hQ9mqdu0HKhc47c5bfm6OOb86ZxcwZwJAmrfog966kn/1ou3pa1KskGBVL+e2u4KYSsow5o0nXv+4XPkp46uM0vhETAvDaO0MeygG1ZD3XwMtwFHum338Ra7UDxB/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783552500; c=relaxed/simple;
	bh=supM8W1V+6istUONdnKaagsykYTqMbIBUIOEpXVFSow=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tAYEpX5301aipAkxHasnnvN5a0D1FL8+2I1vrfruDuuOgv2jC9d4ko8FwmO4wVqY404lgcmuKRX6jHXNfG5lkC9d6vlttC0vltOqdAlnHJbMh1fEgPnYv7kD2izz+CBs5o2hAsJHZ5qb0SWCa3GkTP4JCaUJ972rCQpqPRb/3+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EWLUQBTO; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EWLUQBTO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783552499; x=1815088499;
  h=date:from:to:cc:subject:message-id;
  bh=supM8W1V+6istUONdnKaagsykYTqMbIBUIOEpXVFSow=;
  b=EWLUQBTO9H0Vp9gwKwx38UuGiVQ8zuascN+HcUEuNDN9zsoxULvDfx+1
   xgr9fEG8QLRuoWxCMbn2A0L4r+vJbpmaHEn8BaSjOWdtkIHN1Olyta3+m
   0ztrP60ssI+d7wzOhyI3GdC71M+Y0J2oxmQDthkpwnD/oKaEIIhYFEuxe
   tyRiQJ4b5xsC+dhyaQ/OJ24cCr/PcTAH9gocjghB466tmAhf/IALSB+d/
   7MH8wIQJ4eORCZ4ZIG5FHrXy+ZIsXyubQtD43+ngWM3fW3U27iXmYXelS
   eZQvUBLSdSDTv3t3aqDWVXNNqKJHJewPQpzXLbsYhILAh31nhW/LpI1Na
   w==;
X-CSE-ConnectionGUID: ByFV8TqhTkq6czBPLwhE6Q==
X-CSE-MsgGUID: fhenIWfCRLKSNbKMBrBhhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83341939"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="83341939"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 16:14:58 -0700
X-CSE-ConnectionGUID: L0egl+UNTSOBCakhqTWFSA==
X-CSE-MsgGUID: VeX5LloUSomjH8Dzw1HVOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="278806052"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 08 Jul 2026 16:14:57 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whbTh-00000000Gy7-3O0C;
	Wed, 08 Jul 2026 23:14:53 +0000
Date: Thu, 09 Jul 2026 07:14:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 10/10]
 kernel/rcu/update.c:52:1: error: use of undeclared identifier
 '__tracepoint_rcu_stall_warning'; did you mean
 '__tracepoint_rcu_utilization'?
Message-ID: <202607090753.CaGOW0Vd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Qinglin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   810dd01a31df33d13d6ca0e223841a64968adfb1
commit: d35bd9468fc35137ce63aff26dcb4bb3856d1657 [10/10] ANDROID: rcu: allow hooks into rcu stall warning
config: x86_64-buildonly-randconfig-001-20260708 (https://download.01.org/0day-ci/archive/20260709/202607090753.CaGOW0Vd-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c279890c85da307abe34f10333442bbf72a60644)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607090753.CaGOW0Vd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607090753.CaGOW0Vd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/rcu/update.c:52:1: error: use of undeclared identifier '__tracepoint_rcu_stall_warning'; did you mean '__tracepoint_rcu_utilization'?
      52 | EXPORT_TRACEPOINT_SYMBOL_GPL(rcu_stall_warning);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:328:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     328 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^~~~~~~~~~~~~~~~~~~
   <scratch space>:91:1: note: expanded from here
      91 | __tracepoint_rcu_stall_warning
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
   <scratch space>:7:1: note: expanded from here
       7 | __tracepoint_rcu_utilization
         | ^
>> kernel/rcu/update.c:52:1: error: use of undeclared identifier '__traceiter_rcu_stall_warning'; did you mean '__tracepoint_rcu_stall_warning'?
      52 | EXPORT_TRACEPOINT_SYMBOL_GPL(rcu_stall_warning);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:329:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     329 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |                           ^~~~~~~~~~~~~~~~~~
   <scratch space>:109:1: note: expanded from here
     109 | __traceiter_rcu_stall_warning
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/update.c:52:1: note: '__tracepoint_rcu_stall_warning' declared here
   include/linux/tracepoint.h:328:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     328 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^
   <scratch space>:91:1: note: expanded from here
      91 | __tracepoint_rcu_stall_warning
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
   <scratch space>:128:1: note: expanded from here
     128 | __SCK__tp_func_rcu_stall_warning
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
   <scratch space>:27:1: note: expanded from here
      27 | __SCK__tp_func_rcu_utilization
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
   <scratch space>:9:1: note: expanded from here
       9 | __SCT__tp_func_rcu_stall_warning
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
   <scratch space>:128:1: note: expanded from here
     128 | __SCK__tp_func_rcu_stall_warning
         | ^
   4 errors generated.


vim +52 kernel/rcu/update.c

    51	
  > 52	EXPORT_TRACEPOINT_SYMBOL_GPL(rcu_stall_warning);
    53	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
