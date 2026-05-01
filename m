Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7045C3806D2
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 May 2026 09:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777627137; cv=none; b=llyH5d12PjjWJhJdyTqxYPPvHBvaE0qidgKM7bARVzIiisozmoj7KCXE2mDwaIKpmbhZXW8sihx5aM7E7/CYjb+6JU5//X9vN3wjiAMQtvgOd5zvWgK7BII6osqhagrbkIfuS9XQ8jhqiI+V7OmK5zEDk20Vb+kdLGL/s3e5SUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777627137; c=relaxed/simple;
	bh=cq7N61fplI6NGm8QGMF6jXuYbGMk2stv4/tE5tRxKAU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WHMsouU1mmrvbZ8h13TS/zr6kFUVT1dqlmA8HVGlGngZyOo2MIGOefc/sXlwj4TENo8EFwXWhXyflkd4LYJwdxtFHQ29/D4PsjM27p6bIZ8AOxuek3zNsunFba6j9KsmAunDFhhJQXnX7npDXwNQXOI8dEDr8W8A5xq0aYSvZ/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AJ2NOLKw; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AJ2NOLKw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777627135; x=1809163135;
  h=date:from:to:cc:subject:message-id;
  bh=cq7N61fplI6NGm8QGMF6jXuYbGMk2stv4/tE5tRxKAU=;
  b=AJ2NOLKwXMq/TS/kNHTieg6CTvELoX/DTH2ruDGz+BO+pu9ad5qe6Zzp
   21yo3xzrCdwJcvORpHCzei/Y5KrT+MiqU23lFhLG/xaZku99xNVch3IKo
   yUI009gekyoVnrgjWPBCrL76QojVQZfW+8vUWV0bdTsM2Uol+EZ7jEOeD
   ryQnH/X82fad/M7E84jtCGQLsM9yrKdp32/Qkp1ai2va6I2Lif1T/sgMP
   Qmi6acfNNsmq5Pfnjl2l3/Az4StpWRHduqgMVLmm3n9HVInm11edUguz9
   ZM3HyVNUAYpD0Li8LIiSb/UCYw1WTlxrGftnCyCx2arAY3wCiwMjT0X46
   w==;
X-CSE-ConnectionGUID: GFeHmMkBSrGitejv1vDXEA==
X-CSE-MsgGUID: lLc866NRRr6pwBmLTGoZFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="66121510"
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="66121510"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 02:18:52 -0700
X-CSE-ConnectionGUID: ZOychDfIQ5CVa79GDJRK1g==
X-CSE-MsgGUID: vgp55AFaT6C5pqoZg6YcDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="238800538"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 01 May 2026 02:18:51 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIk1I-000000000Or-0hKr;
	Fri, 01 May 2026 09:18:48 +0000
Date: Fri, 01 May 2026 17:18:24 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fanotify_event_type 5/5]
 include/linux/fanotify.h:138:42: error: 'FANOTIFY_OUTGOING_EVENTS'
 undeclared; did you mean 'FANOTIFY_OUTGOING_NS_EVENTS'?
Message-ID: <202605011714.84WNyXX9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/amir73il/linux fanotify_event_type
head:   2d7a09f9a3381b4d0e7ea35728b0c14ebc6b2c69
commit: 2d7a09f9a3381b4d0e7ea35728b0c14ebc6b2c69 [5/5] fanotify_event_type
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20260501/202605011714.84WNyXX9-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260501/202605011714.84WNyXX9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605011714.84WNyXX9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/notify/fanotify/fanotify.c:2:
   fs/notify/fanotify/fanotify.c: In function 'fanotify_group_event_mask':
   include/linux/fanotify.h:131:41: warning: conversion from 'long long unsigned int' to '__u32' {aka 'unsigned int'} changes value from '4345315328' to '50348032' [-Woverflow]
     131 | #define FANOTIFY_OUTGOING_NS_EVENTS     (FANOTIFY_NS_EVENTS | \
         |                                         ^
   fs/notify/fanotify/fanotify.c:318:29: note: in expansion of macro 'FANOTIFY_OUTGOING_NS_EVENTS'
     318 |                 user_mask = FANOTIFY_OUTGOING_NS_EVENTS;
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   fs/notify/fanotify/fanotify.c: In function 'fanotify_handle_event':
>> include/linux/fanotify.h:138:42: error: 'FANOTIFY_OUTGOING_EVENTS' undeclared (first use in this function); did you mean 'FANOTIFY_OUTGOING_NS_EVENTS'?
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
>> include/linux/compiler.h:200:82: error: expression in static assertion is not an integer
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
>> fs/notify/fanotify/fanotify_user.c:851:39: error: 'FANOTIFY_OUTGOING_EVENTS' undeclared (first use in this function); did you mean 'FANOTIFY_OUTGOING_NS_EVENTS'?
     851 |         metadata.mask = event->mask & FANOTIFY_OUTGOING_EVENTS;
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~
         |                                       FANOTIFY_OUTGOING_NS_EVENTS
   fs/notify/fanotify/fanotify_user.c:851:39: note: each undeclared identifier is reported only once for each function it appears in
   In file included from fs/notify/fanotify/fanotify_user.c:2:
   fs/notify/fanotify/fanotify_user.c: In function 'fanotify_event_type':
   include/linux/fanotify.h:120:33: warning: conversion from 'long long unsigned int' to 'u32' {aka 'unsigned int'} changes value from '4345298944' to '50331648' [-Woverflow]
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


vim +138 include/linux/fanotify.h

bdd5a46fe30653 Amir Goldstein 2018-10-04  124  
2d7a09f9a3381b Amir Goldstein 2026-04-19  125  /* Events that may be reported to user on filesystem watchers */
2d7a09f9a3381b Amir Goldstein 2026-04-19  126  #define FANOTIFY_OUTGOING_FS_EVENTS	(FANOTIFY_FS_EVENTS | \
23c9deeb3285d3 Amir Goldstein 2018-10-04  127  					 FANOTIFY_PERM_EVENTS | \
e7fce6d94cc1f7 Amir Goldstein 2019-01-10  128  					 FAN_Q_OVERFLOW | FAN_ONDIR)
23c9deeb3285d3 Amir Goldstein 2018-10-04  129  
2d7a09f9a3381b Amir Goldstein 2026-04-19  130  /* Events that may be reported to user on namepsace watchers */
2d7a09f9a3381b Amir Goldstein 2026-04-19 @131  #define FANOTIFY_OUTGOING_NS_EVENTS	(FANOTIFY_NS_EVENTS | \
2d7a09f9a3381b Amir Goldstein 2026-04-19  132  					 FAN_Q_OVERFLOW)
2d7a09f9a3381b Amir Goldstein 2026-04-19  133  
8698e3bab4dd79 Amir Goldstein 2022-06-27  134  /* Events and flags relevant only for directories */
8698e3bab4dd79 Amir Goldstein 2022-06-27  135  #define FANOTIFY_DIRONLY_EVENT_BITS	(FANOTIFY_DIRENT_EVENTS | \
8698e3bab4dd79 Amir Goldstein 2022-06-27  136  					 FAN_EVENT_ON_CHILD | FAN_ONDIR)
8698e3bab4dd79 Amir Goldstein 2022-06-27  137  
bdd5a46fe30653 Amir Goldstein 2018-10-04 @138  #define ALL_FANOTIFY_EVENT_BITS		(FANOTIFY_OUTGOING_EVENTS | \
bdd5a46fe30653 Amir Goldstein 2018-10-04  139  					 FANOTIFY_EVENT_FLAGS)
bdd5a46fe30653 Amir Goldstein 2018-10-04  140  

:::::: The code at line 138 was first introduced by commit
:::::: bdd5a46fe30653cb4d26c7c787a22159bf79eed9 fanotify: add BUILD_BUG_ON() to count the bits of fanotify constants

:::::: TO: Amir Goldstein <amir73il@gmail.com>
:::::: CC: Jan Kara <jack@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
