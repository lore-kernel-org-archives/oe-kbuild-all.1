Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B9740DFBD
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 May 2026 02:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777603874; cv=none; b=EZ/wGIWP/TCz+2y4O7xfsqiPlRsYbIxJeFPaMdaXmD306Qc7ucJoKeDFwDtdcZ+ySSo2Ej+vOmlIc5h4uiq/+cglbI8NrzgQE1ODUqku9etu/ia6JOdZRNE4SsrjX8R/qq1CQKtB/xFn9IMK6cqfVJJvk64YS0fQz794pujoUq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777603874; c=relaxed/simple;
	bh=vvEWUAXBz4Sj3PwvSw56rr3gat6hSSh6PoxAMr1sez0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n6EuwXyJ7W4q9cyLW8k0llXOqC/pjGpyDKlYrsaLN2HnDSAkg10mu/TqBqxGyo5LdHyC7E0SBpCesAhD2J+Lgj3H4UiN8IXW+oGlO7VBXYM9YwL7Q3WVxQaGXNPhZLc6l3jHFnROhTUQrsq/njRuMKTR7GJLDb3qwcI7rFHDQr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G4Iab3z5; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G4Iab3z5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777603872; x=1809139872;
  h=date:from:to:cc:subject:message-id;
  bh=vvEWUAXBz4Sj3PwvSw56rr3gat6hSSh6PoxAMr1sez0=;
  b=G4Iab3z5tgFCOE2IWdgg5NlRmrPiqX8l+34RGQdtjDi0PQIzrPIUhY3K
   p/IwjkvyUwsuIfEdSVR/+uWpTS2EcyluN0epJkD2qWOLfyfAet8SyayCG
   Z50XyMkbd/CQvrwgSHyHv/ABk9MK0ZMGutrLjXJqBJWDG5lSn8urXzczL
   BtSyPP3wZUU8ndmD7JtfN3PKdFsMoXWxrpWXw6Wf00fZ8l46/0Hib3YD/
   7Njw7leMtk1Pvwx6Ic4/RwP7+WDbdOajvkDRUQmwHIPG6y1Nkusxp4tMg
   wHFJhbROy8JVHSNnGPEPL+80DYsVLYcOwDYk44j+OTyBi45oNfwQEQKH1
   g==;
X-CSE-ConnectionGUID: oOtPzpU3SzaJQPlH+8FK5Q==
X-CSE-MsgGUID: rwx0ePXWQSucgBFaELqxXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="78499893"
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="78499893"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:51:12 -0700
X-CSE-ConnectionGUID: vJwCncauTe25lM59jPrLDQ==
X-CSE-MsgGUID: MGv9WMANS1OhoU33hh/N5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="234655827"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 Apr 2026 19:51:10 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIdy7-0000000006z-3v7A;
	Fri, 01 May 2026 02:51:07 +0000
Date: Fri, 01 May 2026 10:50:22 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fanotify_event_type 5/5]
 include/linux/fanotify.h:131:41: warning: conversion from 'long unsigned int'
 to '__u32' {aka 'unsigned int'} changes value from '4345315328' to '50348032'
Message-ID: <202605011054.vlTGxd0k-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/amir73il/linux fanotify_event_type
head:   2d7a09f9a3381b4d0e7ea35728b0c14ebc6b2c69
commit: 2d7a09f9a3381b4d0e7ea35728b0c14ebc6b2c69 [5/5] fanotify_event_type
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20260501/202605011054.vlTGxd0k-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260501/202605011054.vlTGxd0k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605011054.vlTGxd0k-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/notify/fanotify/fanotify.c:2:
   fs/notify/fanotify/fanotify.c: In function 'fanotify_group_event_mask':
>> include/linux/fanotify.h:131:41: warning: conversion from 'long unsigned int' to '__u32' {aka 'unsigned int'} changes value from '4345315328' to '50348032' [-Woverflow]
     131 | #define FANOTIFY_OUTGOING_NS_EVENTS     (FANOTIFY_NS_EVENTS | \
         |                                         ^
   fs/notify/fanotify/fanotify.c:318:29: note: in expansion of macro 'FANOTIFY_OUTGOING_NS_EVENTS'
     318 |                 user_mask = FANOTIFY_OUTGOING_NS_EVENTS;
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   fs/notify/fanotify/fanotify.c: In function 'fanotify_handle_event':
   include/linux/fanotify.h:138:42: error: 'FANOTIFY_OUTGOING_EVENTS' undeclared (first use in this function); did you mean 'FANOTIFY_OUTGOING_NS_EVENTS'?
     138 | #define ALL_FANOTIFY_EVENT_BITS         (FANOTIFY_OUTGOING_EVENTS | \
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:679:23: note: in definition of macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   fs/notify/fanotify/fanotify.c:963:9: note: in expansion of macro 'BUILD_BUG_ON'
     963 |         BUILD_BUG_ON(HWEIGHT32(ALL_FANOTIFY_EVENT_BITS) != 24);
         |         ^~~~~~~~~~~~
   include/linux/build_bug.h:17:9: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
      17 |         __BUILD_BUG_ON_ZERO_MSG(e, ##__VA_ARGS__, #e " is true")
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:36:23: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
      36 | #define HWEIGHT32(w) (BUILD_BUG_ON_ZERO(!__builtin_constant_p(w)) + __const_hweight32(w))
         |                       ^~~~~~~~~~~~~~~~~
   fs/notify/fanotify/fanotify.c:963:22: note: in expansion of macro 'HWEIGHT32'
     963 |         BUILD_BUG_ON(HWEIGHT32(ALL_FANOTIFY_EVENT_BITS) != 24);
         |                      ^~~~~~~~~
   fs/notify/fanotify/fanotify.c:963:32: note: in expansion of macro 'ALL_FANOTIFY_EVENT_BITS'
     963 |         BUILD_BUG_ON(HWEIGHT32(ALL_FANOTIFY_EVENT_BITS) != 24);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fanotify.h:138:42: note: each undeclared identifier is reported only once for each function it appears in
     138 | #define ALL_FANOTIFY_EVENT_BITS         (FANOTIFY_OUTGOING_EVENTS | \
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:679:23: note: in definition of macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   fs/notify/fanotify/fanotify.c:963:9: note: in expansion of macro 'BUILD_BUG_ON'
     963 |         BUILD_BUG_ON(HWEIGHT32(ALL_FANOTIFY_EVENT_BITS) != 24);
         |         ^~~~~~~~~~~~
   include/linux/build_bug.h:17:9: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
      17 |         __BUILD_BUG_ON_ZERO_MSG(e, ##__VA_ARGS__, #e " is true")
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:36:23: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
      36 | #define HWEIGHT32(w) (BUILD_BUG_ON_ZERO(!__builtin_constant_p(w)) + __const_hweight32(w))
         |                       ^~~~~~~~~~~~~~~~~
   fs/notify/fanotify/fanotify.c:963:22: note: in expansion of macro 'HWEIGHT32'
     963 |         BUILD_BUG_ON(HWEIGHT32(ALL_FANOTIFY_EVENT_BITS) != 24);
         |                      ^~~~~~~~~
   fs/notify/fanotify/fanotify.c:963:32: note: in expansion of macro 'ALL_FANOTIFY_EVENT_BITS'
     963 |         BUILD_BUG_ON(HWEIGHT32(ALL_FANOTIFY_EVENT_BITS) != 24);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:200:82: error: expression in static assertion is not an integer
     200 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                                  ^
   include/linux/compiler_types.h:679:23: note: in definition of macro '__compiletime_assert'
     679 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:699:9: note: in expansion of macro '_compiletime_assert'
     699 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   fs/notify/fanotify/fanotify.c:963:9: note: in expansion of macro 'BUILD_BUG_ON'
     963 |         BUILD_BUG_ON(HWEIGHT32(ALL_FANOTIFY_EVENT_BITS) != 24);
         |         ^~~~~~~~~~~~
   include/linux/build_bug.h:17:9: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
      17 |         __BUILD_BUG_ON_ZERO_MSG(e, ##__VA_ARGS__, #e " is true")
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/const_hweight.h:36:23: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
      36 | #define HWEIGHT32(w) (BUILD_BUG_ON_ZERO(!__builtin_constant_p(w)) + __const_hweight32(w))
         |                       ^~~~~~~~~~~~~~~~~
   fs/notify/fanotify/fanotify.c:963:22: note: in expansion of macro 'HWEIGHT32'
     963 |         BUILD_BUG_ON(HWEIGHT32(ALL_FANOTIFY_EVENT_BITS) != 24);
         |                      ^~~~~~~~~
--
   fs/notify/fanotify/fanotify_user.c: In function 'copy_event_to_user':
   fs/notify/fanotify/fanotify_user.c:851:39: error: 'FANOTIFY_OUTGOING_EVENTS' undeclared (first use in this function); did you mean 'FANOTIFY_OUTGOING_NS_EVENTS'?
     851 |         metadata.mask = event->mask & FANOTIFY_OUTGOING_EVENTS;
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~
         |                                       FANOTIFY_OUTGOING_NS_EVENTS
   fs/notify/fanotify/fanotify_user.c:851:39: note: each undeclared identifier is reported only once for each function it appears in
   In file included from fs/notify/fanotify/fanotify_user.c:2:
   fs/notify/fanotify/fanotify_user.c: In function 'fanotify_event_type':
>> include/linux/fanotify.h:120:33: warning: conversion from 'long unsigned int' to 'u32' {aka 'unsigned int'} changes value from '4345298944' to '50331648' [-Woverflow]
     120 | #define FANOTIFY_NS_EVENTS      (FANOTIFY_MOUNT_EVENTS)
         |                                 ^
   fs/notify/fanotify/fanotify_user.c:1894:30: note: in expansion of macro 'FANOTIFY_NS_EVENTS'
    1894 |                 valid_mask = FANOTIFY_NS_EVENTS;
         |                              ^~~~~~~~~~~~~~~~~~
   fs/notify/fanotify/fanotify_user.c:1894:28: warning: this statement may fall through [-Wimplicit-fallthrough=]
    1894 |                 valid_mask = FANOTIFY_NS_EVENTS;
   fs/notify/fanotify/fanotify_user.c:1895:9: note: here
    1895 |         default:
         |         ^~~~~~~


vim +131 include/linux/fanotify.h

   113	
   114	/* Events that user can request to be notified on filesystem watchers */
   115	#define FANOTIFY_FS_EVENTS		(FANOTIFY_PATH_EVENTS | \
   116					 FANOTIFY_INODE_EVENTS | \
   117					 FANOTIFY_ERROR_EVENTS)
   118	
   119	/* Events that user can request to be notified on namepsace watchers */
 > 120	#define FANOTIFY_NS_EVENTS	(FANOTIFY_MOUNT_EVENTS)
   121	
   122	/* Extra flags that may be reported with event or control handling of events */
   123	#define FANOTIFY_EVENT_FLAGS	(FAN_EVENT_ON_CHILD | FAN_ONDIR)
   124	
   125	/* Events that may be reported to user on filesystem watchers */
   126	#define FANOTIFY_OUTGOING_FS_EVENTS	(FANOTIFY_FS_EVENTS | \
   127						 FANOTIFY_PERM_EVENTS | \
   128						 FAN_Q_OVERFLOW | FAN_ONDIR)
   129	
   130	/* Events that may be reported to user on namepsace watchers */
 > 131	#define FANOTIFY_OUTGOING_NS_EVENTS	(FANOTIFY_NS_EVENTS | \
   132						 FAN_Q_OVERFLOW)
   133	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
