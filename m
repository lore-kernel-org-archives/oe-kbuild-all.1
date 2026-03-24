Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90E9388E71
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 02:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774320348; cv=none; b=WdA5KMC4FC0HbaHbac9mrZHb26eSyN+Xl0QcfW8eD7r8daFqSaENTZxryTT3SBSLrhlLdhDcwkIem/j4MF2dRI7Kg+Zqs3/nw/xCfUc2FaI12zwccWRIwARQblJ1RW13UqpNBvJHWDTfix+a3m0pnJcINz6bTgM0t4ZvuTIbXL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774320348; c=relaxed/simple;
	bh=cStBIhYzx1TnTIlWlxuweqo2sZeAGw7MS+Fn231euhI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DtGbUs4L739D77v2jjXWLBmg5RvVDa2DLvBGX39kdOHrZ01Q3JlYekQE9n+OMUP3Hku/nkY3PLukv5NeTfCCt71OZKy6WkQxVBwUeMcg4cb71r9fcjK48TRFxsWuLi2uqZrAP48MZIbdAlbr4Vxhenymt5uhFkKv+1JmthPkfNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cvqyxVYa; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cvqyxVYa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774320346; x=1805856346;
  h=date:from:to:cc:subject:message-id;
  bh=cStBIhYzx1TnTIlWlxuweqo2sZeAGw7MS+Fn231euhI=;
  b=cvqyxVYahbi3vfCpJQ0l3xYTzPnRS2oNc+qiUNB1CuG5BmMJBYrLHaBx
   5cAE2fVO3X6k58ZeBT1L4gV0P9jUkiod1xbV79b/m/1WprpN2MuC5C6w/
   W3wQoWqTGZVOzZC+lV7AageDobKQTNIs3e1J2LoQhoXplvPdehz4zWCSY
   U/X3fka1w5sNF37y7X6m+9GAuyTcUrZpORWTVQPpuQvWAvxM45gq+srqz
   t097rWvYeDK6QbKvavyP16RrxVoSEJaZ5NLlNjFeRKxNEtqncO4FJ8vlk
   6XjzWHwi4vxP3fDNt64VbQh+HTZaU6zqtBfAewSvPEnjCdjQkecOjvUj+
   A==;
X-CSE-ConnectionGUID: gGwj2/ppRzKqfl8tuCopiA==
X-CSE-MsgGUID: VxXr+GNOTRePxagYapMsXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75298301"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75298301"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 19:45:45 -0700
X-CSE-ConnectionGUID: /Ft4hXclSPCRwUUJO3R1iw==
X-CSE-MsgGUID: 0sLtQ5TSROeKNZlFgpVtsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="223282939"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Mar 2026 19:45:44 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4rm0-000000003gd-3pJV;
	Tue, 24 Mar 2026 02:45:40 +0000
Date: Tue, 24 Mar 2026 10:45:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 3/3] block/blk-mq.c:3573:1:
 error: use of undeclared identifier
 '__tracepoint_android_rvh_blk_mq_has_request'; did you mean
 'trace_android_rvh_blk_mq_has_request'?
Message-ID: <202603241010.DTQC2txd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   3a8949cdc45bfeb1a68ac0e70e90909c13d3910e
commit: f7f28e6be255caed90a67df47625ba2296183ece [3/3] ANDROID: block: Introduce the android_rvh_blk_mq_has_request() vendor hook
config: i386-buildonly-randconfig-002-20260324 (https://download.01.org/0day-ci/archive/20260324/202603241010.DTQC2txd-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603241010.DTQC2txd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603241010.DTQC2txd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> block/blk-mq.c:3573:1: error: use of undeclared identifier '__tracepoint_android_rvh_blk_mq_has_request'; did you mean 'trace_android_rvh_blk_mq_has_request'?
    3573 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_rvh_blk_mq_has_request);
         | ^
   include/linux/tracepoint.h:344:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     344 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^
   <scratch space>:55:1: note: expanded from here
      55 | __tracepoint_android_rvh_blk_mq_has_request
         | ^
   include/trace/hooks/blk.h:33:1: note: 'trace_android_rvh_blk_mq_has_request' declared here
      33 | DECLARE_RESTRICTED_HOOK(android_rvh_blk_mq_has_request,
         | ^
   include/trace/hooks/vendor_hooks.h:121:2: note: expanded from macro 'DECLARE_RESTRICTED_HOOK'
     121 |         DECLARE_EVENT_NOP(name, PARAMS(proto), PARAMS(args))
         |         ^
   include/linux/tracepoint.h:584:21: note: expanded from macro 'DECLARE_EVENT_NOP'
     584 |         static inline void trace_##name(proto)                          \
         |                            ^
   <scratch space>:36:1: note: expanded from here
      36 | trace_android_rvh_blk_mq_has_request
         | ^
>> block/blk-mq.c:3573:1: error: use of undeclared identifier '__traceiter_android_rvh_blk_mq_has_request'; did you mean '__tracepoint_android_rvh_blk_mq_has_request'?
    3573 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_rvh_blk_mq_has_request);
         | ^
   include/linux/tracepoint.h:345:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     345 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |                           ^
   <scratch space>:62:1: note: expanded from here
      62 | __traceiter_android_rvh_blk_mq_has_request
         | ^
   block/blk-mq.c:3573:1: note: '__tracepoint_android_rvh_blk_mq_has_request' declared here
   include/linux/tracepoint.h:344:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     344 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^
   <scratch space>:55:1: note: expanded from here
      55 | __tracepoint_android_rvh_blk_mq_has_request
         | ^
>> block/blk-mq.c:3573:1: error: use of undeclared identifier '__SCK__tp_func_android_rvh_blk_mq_has_request'; did you mean '__tracepoint_android_rvh_blk_mq_has_request'?
    3573 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_rvh_blk_mq_has_request);
         | ^
   include/linux/tracepoint.h:346:2: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     346 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^
   include/linux/static_call.h:277:20: note: expanded from macro 'EXPORT_STATIC_CALL_GPL'
     277 |         EXPORT_SYMBOL_GPL(STATIC_CALL_KEY(name));                       \
         |                           ^
   include/linux/static_call_types.h:12:32: note: expanded from macro 'STATIC_CALL_KEY'
      12 | #define STATIC_CALL_KEY(name)           __PASTE(STATIC_CALL_KEY_PREFIX, name)
         |                                         ^
   include/linux/compiler_types.h:88:22: note: expanded from macro '__PASTE'
      88 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:87:23: note: expanded from macro '___PASTE'
      87 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:70:1: note: expanded from here
      70 | __SCK__tp_func_android_rvh_blk_mq_has_request
         | ^
   block/blk-mq.c:3573:1: note: '__tracepoint_android_rvh_blk_mq_has_request' declared here
   include/linux/tracepoint.h:344:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     344 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^
   <scratch space>:55:1: note: expanded from here
      55 | __tracepoint_android_rvh_blk_mq_has_request
         | ^
>> block/blk-mq.c:3573:1: error: use of undeclared identifier '__SCT__tp_func_android_rvh_blk_mq_has_request'; did you mean '__SCK__tp_func_android_rvh_blk_mq_has_request'?
    3573 | EXPORT_TRACEPOINT_SYMBOL_GPL(android_rvh_blk_mq_has_request);
         | ^
   include/linux/tracepoint.h:346:2: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     346 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^
   include/linux/static_call.h:278:20: note: expanded from macro 'EXPORT_STATIC_CALL_GPL'
     278 |         EXPORT_SYMBOL_GPL(STATIC_CALL_TRAMP(name))
         |                           ^
   include/linux/static_call_types.h:18:34: note: expanded from macro 'STATIC_CALL_TRAMP'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                         ^
   include/linux/compiler_types.h:88:22: note: expanded from macro '__PASTE'
      88 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:87:23: note: expanded from macro '___PASTE'
      87 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:77:1: note: expanded from here
      77 | __SCT__tp_func_android_rvh_blk_mq_has_request
         | ^
   block/blk-mq.c:3573:1: note: '__SCK__tp_func_android_rvh_blk_mq_has_request' declared here
   include/linux/tracepoint.h:346:2: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     346 |         EXPORT_STATIC_CALL_GPL(tp_func_##name)
         |         ^
   include/linux/static_call.h:277:20: note: expanded from macro 'EXPORT_STATIC_CALL_GPL'
     277 |         EXPORT_SYMBOL_GPL(STATIC_CALL_KEY(name));                       \
         |                           ^
   include/linux/static_call_types.h:12:32: note: expanded from macro 'STATIC_CALL_KEY'
      12 | #define STATIC_CALL_KEY(name)           __PASTE(STATIC_CALL_KEY_PREFIX, name)
         |                                         ^
   include/linux/compiler_types.h:88:22: note: expanded from macro '__PASTE'
      88 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:87:23: note: expanded from macro '___PASTE'
      87 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:70:1: note: expanded from here
      70 | __SCK__tp_func_android_rvh_blk_mq_has_request
         | ^
   4 errors generated.


vim +3573 block/blk-mq.c

  3572	
> 3573	EXPORT_TRACEPOINT_SYMBOL_GPL(android_rvh_blk_mq_has_request);
  3574	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
