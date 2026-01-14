Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C5B37E2F0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 08:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768379311; cv=none; b=S2VTwe2PFHet3okLk4nf9QsQ94dErFbvHOTHc4ucbbWluWqyTfDa18fpyvANx6VImtt1uvukZddRlyZZW/ADPoLClyl1s+bn1xSc9/6aSeKScinn2Piw/cHnGJVvNom0jERoRu1oGxYBt4Kk7e/SFH0DMWfb93MELYX5eoo4rgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768379311; c=relaxed/simple;
	bh=SeZwR5kuyj59Ap0O4i/EnkCYryjJwtjpNA/hDypS5qI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QIXErETgJ0NTTnAcMervEql5bRsrJewcMYmd9MgszQCY0W3Bqp/XcOcBze6CSJq8fWeXhyMaQe5XaJXcXzV1LoojYLO3dVEbeXqlWNOCEQnuk+mANLRmNAy2x0JCski1taO6SIlT189YvUJj9K1Lc/3m5jnCeqnGlcaWfpMqGCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ugcdzdkh; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ugcdzdkh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768379307; x=1799915307;
  h=date:from:to:cc:subject:message-id;
  bh=SeZwR5kuyj59Ap0O4i/EnkCYryjJwtjpNA/hDypS5qI=;
  b=UgcdzdkhqdxSQzLieQyQGHoYVehKVDbMNzLk0RJ+h/ZtMgVknNQhML5p
   XaBcRTqzvCv39AmvXPo/ig4puivgWGpJG3oi5yYxNORljnwL24oYe9LT9
   uJHPguZhhjqhfUVDMtD1TDV9Ecf9cq4KvTaMQkoLaH8y0LPIRYGGuKUX/
   kXfIdCFSmDgJtCJnn6Gqrg9ey9OhFLgKVnHmWKITK9KggIichlHRRjG/2
   jHPijMgLyHiq2XtPIpWnN3wW3pvXBcUs4d2hC9XATgGyAwHeDkHbwIHNz
   +NHdH+nzTRt30P/LZy9CYfLKTGp/LyLFq45vjKm4Sn1ZmRCmxWizkGTGB
   w==;
X-CSE-ConnectionGUID: y/sH6XmDRiqCL1HpN1dcbw==
X-CSE-MsgGUID: cv9OKg5MREmPqgjcvrkjlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69731178"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69731178"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 00:28:26 -0800
X-CSE-ConnectionGUID: ELedFjl/TAuciCyCKJwKHA==
X-CSE-MsgGUID: ts7viitmRHWHz+1fZWPi6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="205173787"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Jan 2026 00:28:25 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfwEp-00000000G4K-3dJR;
	Wed, 14 Jan 2026 08:28:23 +0000
Date: Wed, 14 Jan 2026 16:28:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/1]
 kernel/rcu/update.c:52:1: error: use of undeclared identifier
 '__tracepoint_rcu_stall_warning'
Message-ID: <202601141646.CKvhJpOV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   4da37933f87e227169be0a2d94ae3501e6f5e85a
commit: d35bd9468fc35137ce63aff26dcb4bb3856d1657 [1/1] ANDROID: rcu: allow hooks into rcu stall warning
config: x86_64-randconfig-161-20260113 (https://download.01.org/0day-ci/archive/20260114/202601141646.CKvhJpOV-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601141646.CKvhJpOV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601141646.CKvhJpOV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/rcu/update.c:52:1: error: use of undeclared identifier '__tracepoint_rcu_stall_warning'
      52 | EXPORT_TRACEPOINT_SYMBOL_GPL(rcu_stall_warning);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:328:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     328 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^~~~~~~~~~~~~~~~~~~
   <scratch space>:7:1: note: expanded from here
       7 | __tracepoint_rcu_stall_warning
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/rcu/update.c:52:1: error: use of undeclared identifier '__traceiter_rcu_stall_warning'; did you mean '__tracepoint_rcu_stall_warning'?
      52 | EXPORT_TRACEPOINT_SYMBOL_GPL(rcu_stall_warning);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:329:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     329 |         EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
         |                           ^~~~~~~~~~~~~~~~~~
   <scratch space>:22:1: note: expanded from here
      22 | __traceiter_rcu_stall_warning
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/update.c:52:1: note: '__tracepoint_rcu_stall_warning' declared here
   include/linux/tracepoint.h:328:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
     328 |         EXPORT_SYMBOL_GPL(__tracepoint_##name);                         \
         |                           ^
   <scratch space>:7:1: note: expanded from here
       7 | __tracepoint_rcu_stall_warning
         | ^
>> kernel/rcu/update.c:52:1: error: use of undeclared identifier '__SCK__tp_func_rcu_stall_warning'
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
   <scratch space>:38:1: note: expanded from here
      38 | __SCK__tp_func_rcu_stall_warning
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   <scratch space>:53:1: note: expanded from here
      53 | __SCT__tp_func_rcu_stall_warning
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
   <scratch space>:38:1: note: expanded from here
      38 | __SCK__tp_func_rcu_stall_warning
         | ^
   4 errors generated.


vim +/__tracepoint_rcu_stall_warning +52 kernel/rcu/update.c

    51	
  > 52	EXPORT_TRACEPOINT_SYMBOL_GPL(rcu_stall_warning);
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
