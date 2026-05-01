Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFEB3242AB
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 May 2026 07:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777620278; cv=none; b=ToPAMo06xYml78aej6TG79fD/QBMpDc0k4gOq9S/FHdZs5uhgSsdkB1pSB/Pv6gBAAo/SeeecQoaygwglAe+vkkJ+zcaS4Z0hopB7gp2QMW+DJLxd6orLhBZC0/H1P50vH+SEikA3s1Cmx326zR/iDi7Dg3gZ3qZA8Q0uWExL9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777620278; c=relaxed/simple;
	bh=l9tybwHsLKK5o0fly03MZwJ7gzjMeJqoo+TK9kqJ21A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tIWi28vMOM+CZQIc782AIXHofSe29RWTbZ3FvbsrMUCkUGbJ0q8/iu0/B3ZqlkFAlre4HB0JKj3klKfINEeJ27Do9GsroKlL52x6fGwH6F9JgFXFonXakIpnDV+ElsYbE5/3F079WbJ/R4AgklwsnFBM8rMyezmYN5ScaGOYdKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ljCJ7csb; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ljCJ7csb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777620275; x=1809156275;
  h=date:from:to:cc:subject:message-id;
  bh=l9tybwHsLKK5o0fly03MZwJ7gzjMeJqoo+TK9kqJ21A=;
  b=ljCJ7csbElmcpkqxW6xnHhj8YXlV5lqCwB2U0z7KN+QVF9OX7Ifw4ovC
   eH055orf+6QRDXR4ngxMmqaq+aa1OrgEwKpiffPcy8UiHxUDDVvDNF9mf
   YhrCjkJG65MGucSgwjEWg4n4NpTQjoF3qA4Q8lf94ElL1ONOdzNzuh+dp
   0mV1lOK6DkFB0zR024/xYAFIK9lhIm2Q89nGByAuESNas/iSvZevTZOwO
   uJ0PN0NiovoZwwz6tylHxRxgxaG/PSfeWdg6uyYl4LkCRhk4oCjcO4r4c
   +D8nIA6dnrPax9M1ruAroEkW14jAa/kwk3rL6Ph4Uuu+HW3MGCQ0WFG5Z
   Q==;
X-CSE-ConnectionGUID: PGVWoaWSQNebl2jtx4kfdw==
X-CSE-MsgGUID: 9TVvqjn1Q1eXqZTD82slPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="82188644"
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="82188644"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 00:24:34 -0700
X-CSE-ConnectionGUID: LS9ccLYDS3Wu3MV6uLUhMA==
X-CSE-MsgGUID: /1fbI4rlT4KnIp4m+PYwRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="233938047"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 May 2026 00:24:33 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIiEg-000000000Ir-35cc;
	Fri, 01 May 2026 07:24:30 +0000
Date: Fri, 01 May 2026 15:23:59 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fanotify_event_type 5/5]
 fs/notify/fanotify/fanotify.c:963:25: error: use of undeclared identifier
 'FANOTIFY_OUTGOING_EVENTS'
Message-ID: <202605011535.1rygQCcD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/amir73il/linux fanotify_event_type
head:   2d7a09f9a3381b4d0e7ea35728b0c14ebc6b2c69
commit: 2d7a09f9a3381b4d0e7ea35728b0c14ebc6b2c69 [5/5] fanotify_event_type
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260501/202605011535.1rygQCcD-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260501/202605011535.1rygQCcD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605011535.1rygQCcD-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/notify/fanotify/fanotify.c:318:15: warning: implicit conversion from 'unsigned long' to '__u32' (aka 'unsigned int') changes value from 4345315328 to 50348032 [-Wconstant-conversion]
     318 |                 user_mask = FANOTIFY_OUTGOING_NS_EVENTS;
         |                           ~ ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fanotify.h:131:57: note: expanded from macro 'FANOTIFY_OUTGOING_NS_EVENTS'
     131 | #define FANOTIFY_OUTGOING_NS_EVENTS     (FANOTIFY_NS_EVENTS | \
         |                                          ~~~~~~~~~~~~~~~~~~~^~~
     132 |                                          FAN_Q_OVERFLOW)
         |                                          ~~~~~~~~~~~~~~
>> fs/notify/fanotify/fanotify.c:963:25: error: use of undeclared identifier 'FANOTIFY_OUTGOING_EVENTS'
     963 |         BUILD_BUG_ON(HWEIGHT32(ALL_FANOTIFY_EVENT_BITS) != 24);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fanotify.h:138:35: note: expanded from macro 'ALL_FANOTIFY_EVENT_BITS'
     138 | #define ALL_FANOTIFY_EVENT_BITS         (FANOTIFY_OUTGOING_EVENTS | \
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~
>> fs/notify/fanotify/fanotify.c:963:25: error: use of undeclared identifier 'FANOTIFY_OUTGOING_EVENTS'
     963 |         BUILD_BUG_ON(HWEIGHT32(ALL_FANOTIFY_EVENT_BITS) != 24);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fanotify.h:138:35: note: expanded from macro 'ALL_FANOTIFY_EVENT_BITS'
     138 | #define ALL_FANOTIFY_EVENT_BITS         (FANOTIFY_OUTGOING_EVENTS | \
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~
>> fs/notify/fanotify/fanotify.c:963:25: error: use of undeclared identifier 'FANOTIFY_OUTGOING_EVENTS'
     963 |         BUILD_BUG_ON(HWEIGHT32(ALL_FANOTIFY_EVENT_BITS) != 24);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fanotify.h:138:35: note: expanded from macro 'ALL_FANOTIFY_EVENT_BITS'
     138 | #define ALL_FANOTIFY_EVENT_BITS         (FANOTIFY_OUTGOING_EVENTS | \
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~
>> fs/notify/fanotify/fanotify.c:963:25: error: use of undeclared identifier 'FANOTIFY_OUTGOING_EVENTS'
     963 |         BUILD_BUG_ON(HWEIGHT32(ALL_FANOTIFY_EVENT_BITS) != 24);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fanotify.h:138:35: note: expanded from macro 'ALL_FANOTIFY_EVENT_BITS'
     138 | #define ALL_FANOTIFY_EVENT_BITS         (FANOTIFY_OUTGOING_EVENTS | \
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~
>> fs/notify/fanotify/fanotify.c:963:25: error: use of undeclared identifier 'FANOTIFY_OUTGOING_EVENTS'
     963 |         BUILD_BUG_ON(HWEIGHT32(ALL_FANOTIFY_EVENT_BITS) != 24);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fanotify.h:138:35: note: expanded from macro 'ALL_FANOTIFY_EVENT_BITS'
     138 | #define ALL_FANOTIFY_EVENT_BITS         (FANOTIFY_OUTGOING_EVENTS | \
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~
>> fs/notify/fanotify/fanotify.c:963:25: error: use of undeclared identifier 'FANOTIFY_OUTGOING_EVENTS'
     963 |         BUILD_BUG_ON(HWEIGHT32(ALL_FANOTIFY_EVENT_BITS) != 24);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fanotify.h:138:35: note: expanded from macro 'ALL_FANOTIFY_EVENT_BITS'
     138 | #define ALL_FANOTIFY_EVENT_BITS         (FANOTIFY_OUTGOING_EVENTS | \
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~
>> fs/notify/fanotify/fanotify.c:963:25: error: use of undeclared identifier 'FANOTIFY_OUTGOING_EVENTS'
     963 |         BUILD_BUG_ON(HWEIGHT32(ALL_FANOTIFY_EVENT_BITS) != 24);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fanotify.h:138:35: note: expanded from macro 'ALL_FANOTIFY_EVENT_BITS'
     138 | #define ALL_FANOTIFY_EVENT_BITS         (FANOTIFY_OUTGOING_EVENTS | \
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~
>> fs/notify/fanotify/fanotify.c:963:25: error: use of undeclared identifier 'FANOTIFY_OUTGOING_EVENTS'
     963 |         BUILD_BUG_ON(HWEIGHT32(ALL_FANOTIFY_EVENT_BITS) != 24);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fanotify.h:138:35: note: expanded from macro 'ALL_FANOTIFY_EVENT_BITS'
     138 | #define ALL_FANOTIFY_EVENT_BITS         (FANOTIFY_OUTGOING_EVENTS | \
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~
>> fs/notify/fanotify/fanotify.c:963:25: error: use of undeclared identifier 'FANOTIFY_OUTGOING_EVENTS'
     963 |         BUILD_BUG_ON(HWEIGHT32(ALL_FANOTIFY_EVENT_BITS) != 24);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fanotify.h:138:35: note: expanded from macro 'ALL_FANOTIFY_EVENT_BITS'
     138 | #define ALL_FANOTIFY_EVENT_BITS         (FANOTIFY_OUTGOING_EVENTS | \
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~
>> fs/notify/fanotify/fanotify.c:963:25: error: use of undeclared identifier 'FANOTIFY_OUTGOING_EVENTS'
     963 |         BUILD_BUG_ON(HWEIGHT32(ALL_FANOTIFY_EVENT_BITS) != 24);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fanotify.h:138:35: note: expanded from macro 'ALL_FANOTIFY_EVENT_BITS'
     138 | #define ALL_FANOTIFY_EVENT_BITS         (FANOTIFY_OUTGOING_EVENTS | \
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~
>> fs/notify/fanotify/fanotify.c:963:25: error: use of undeclared identifier 'FANOTIFY_OUTGOING_EVENTS'
     963 |         BUILD_BUG_ON(HWEIGHT32(ALL_FANOTIFY_EVENT_BITS) != 24);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fanotify.h:138:35: note: expanded from macro 'ALL_FANOTIFY_EVENT_BITS'
     138 | #define ALL_FANOTIFY_EVENT_BITS         (FANOTIFY_OUTGOING_EVENTS | \
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~
>> fs/notify/fanotify/fanotify.c:963:25: error: use of undeclared identifier 'FANOTIFY_OUTGOING_EVENTS'
     963 |         BUILD_BUG_ON(HWEIGHT32(ALL_FANOTIFY_EVENT_BITS) != 24);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fanotify.h:138:35: note: expanded from macro 'ALL_FANOTIFY_EVENT_BITS'
     138 | #define ALL_FANOTIFY_EVENT_BITS         (FANOTIFY_OUTGOING_EVENTS | \
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~
>> fs/notify/fanotify/fanotify.c:963:25: error: use of undeclared identifier 'FANOTIFY_OUTGOING_EVENTS'
     963 |         BUILD_BUG_ON(HWEIGHT32(ALL_FANOTIFY_EVENT_BITS) != 24);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fanotify.h:138:35: note: expanded from macro 'ALL_FANOTIFY_EVENT_BITS'
     138 | #define ALL_FANOTIFY_EVENT_BITS         (FANOTIFY_OUTGOING_EVENTS | \
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~
>> fs/notify/fanotify/fanotify.c:963:25: error: use of undeclared identifier 'FANOTIFY_OUTGOING_EVENTS'
     963 |         BUILD_BUG_ON(HWEIGHT32(ALL_FANOTIFY_EVENT_BITS) != 24);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fanotify.h:138:35: note: expanded from macro 'ALL_FANOTIFY_EVENT_BITS'
     138 | #define ALL_FANOTIFY_EVENT_BITS         (FANOTIFY_OUTGOING_EVENTS | \
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~
>> fs/notify/fanotify/fanotify.c:963:25: error: use of undeclared identifier 'FANOTIFY_OUTGOING_EVENTS'
     963 |         BUILD_BUG_ON(HWEIGHT32(ALL_FANOTIFY_EVENT_BITS) != 24);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fanotify.h:138:35: note: expanded from macro 'ALL_FANOTIFY_EVENT_BITS'
     138 | #define ALL_FANOTIFY_EVENT_BITS         (FANOTIFY_OUTGOING_EVENTS | \
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~
>> fs/notify/fanotify/fanotify.c:963:25: error: use of undeclared identifier 'FANOTIFY_OUTGOING_EVENTS'
     963 |         BUILD_BUG_ON(HWEIGHT32(ALL_FANOTIFY_EVENT_BITS) != 24);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fanotify.h:138:35: note: expanded from macro 'ALL_FANOTIFY_EVENT_BITS'
     138 | #define ALL_FANOTIFY_EVENT_BITS         (FANOTIFY_OUTGOING_EVENTS | \
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~
>> fs/notify/fanotify/fanotify.c:963:25: error: use of undeclared identifier 'FANOTIFY_OUTGOING_EVENTS'
     963 |         BUILD_BUG_ON(HWEIGHT32(ALL_FANOTIFY_EVENT_BITS) != 24);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fanotify.h:138:35: note: expanded from macro 'ALL_FANOTIFY_EVENT_BITS'
     138 | #define ALL_FANOTIFY_EVENT_BITS         (FANOTIFY_OUTGOING_EVENTS | \
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~
>> fs/notify/fanotify/fanotify.c:963:25: error: use of undeclared identifier 'FANOTIFY_OUTGOING_EVENTS'
     963 |         BUILD_BUG_ON(HWEIGHT32(ALL_FANOTIFY_EVENT_BITS) != 24);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fanotify.h:138:35: note: expanded from macro 'ALL_FANOTIFY_EVENT_BITS'
     138 | #define ALL_FANOTIFY_EVENT_BITS         (FANOTIFY_OUTGOING_EVENTS | \
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~
>> fs/notify/fanotify/fanotify.c:963:25: error: use of undeclared identifier 'FANOTIFY_OUTGOING_EVENTS'
     963 |         BUILD_BUG_ON(HWEIGHT32(ALL_FANOTIFY_EVENT_BITS) != 24);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fanotify.h:138:35: note: expanded from macro 'ALL_FANOTIFY_EVENT_BITS'
     138 | #define ALL_FANOTIFY_EVENT_BITS         (FANOTIFY_OUTGOING_EVENTS | \
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   1 warning and 20 errors generated.
--
>> fs/notify/fanotify/fanotify_user.c:851:32: error: use of undeclared identifier 'FANOTIFY_OUTGOING_EVENTS'
     851 |         metadata.mask = event->mask & FANOTIFY_OUTGOING_EVENTS;
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/notify/fanotify/fanotify_user.c:1894:16: warning: implicit conversion from 'unsigned long' to 'u32' (aka 'unsigned int') changes value from 4345298944 to 50331648 [-Wconstant-conversion]
    1894 |                 valid_mask = FANOTIFY_NS_EVENTS;
         |                            ~ ^~~~~~~~~~~~~~~~~~
   include/linux/fanotify.h:120:29: note: expanded from macro 'FANOTIFY_NS_EVENTS'
     120 | #define FANOTIFY_NS_EVENTS      (FANOTIFY_MOUNT_EVENTS)
         |                                  ^~~~~~~~~~~~~~~~~~~~~
   include/linux/fanotify.h:112:47: note: expanded from macro 'FANOTIFY_MOUNT_EVENTS'
     112 | #define FANOTIFY_MOUNT_EVENTS   (FAN_MNT_ATTACH | FAN_MNT_DETACH)
         |                                  ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +/FANOTIFY_OUTGOING_EVENTS +963 fs/notify/fanotify/fanotify.c

94e00d28a680dff Amir Goldstein          2021-03-04   927  
b54cecf5e2293d1 Amir Goldstein          2020-06-07   928  static int fanotify_handle_event(struct fsnotify_group *group, u32 mask,
b54cecf5e2293d1 Amir Goldstein          2020-06-07   929  				 const void *data, int data_type,
b54cecf5e2293d1 Amir Goldstein          2020-06-07   930  				 struct inode *dir,
e43e9c339a78a09 Al Viro                 2019-04-26   931  				 const struct qstr *file_name, u32 cookie,
9385a84d7e1f658 Jan Kara                2016-11-10   932  				 struct fsnotify_iter_info *iter_info)
7053aee26a3548e Jan Kara                2014-01-21   933  {
7053aee26a3548e Jan Kara                2014-01-21   934  	int ret = 0;
33913997d5c0678 Amir Goldstein          2019-01-10   935  	struct fanotify_event *event;
7053aee26a3548e Jan Kara                2014-01-21   936  	struct fsnotify_event *fsn_event;
77115225acc67d9 Amir Goldstein          2019-01-10   937  	__kernel_fsid_t fsid = {};
2bfbcccde6e7a78 Amir Goldstein          2021-11-29   938  	u32 match_mask = 0;
7053aee26a3548e Jan Kara                2014-01-21   939  
7053aee26a3548e Jan Kara                2014-01-21   940  	BUILD_BUG_ON(FAN_ACCESS != FS_ACCESS);
7053aee26a3548e Jan Kara                2014-01-21   941  	BUILD_BUG_ON(FAN_MODIFY != FS_MODIFY);
235328d1fa4251c Amir Goldstein          2019-01-10   942  	BUILD_BUG_ON(FAN_ATTRIB != FS_ATTRIB);
7053aee26a3548e Jan Kara                2014-01-21   943  	BUILD_BUG_ON(FAN_CLOSE_NOWRITE != FS_CLOSE_NOWRITE);
7053aee26a3548e Jan Kara                2014-01-21   944  	BUILD_BUG_ON(FAN_CLOSE_WRITE != FS_CLOSE_WRITE);
7053aee26a3548e Jan Kara                2014-01-21   945  	BUILD_BUG_ON(FAN_OPEN != FS_OPEN);
235328d1fa4251c Amir Goldstein          2019-01-10   946  	BUILD_BUG_ON(FAN_MOVED_TO != FS_MOVED_TO);
235328d1fa4251c Amir Goldstein          2019-01-10   947  	BUILD_BUG_ON(FAN_MOVED_FROM != FS_MOVED_FROM);
235328d1fa4251c Amir Goldstein          2019-01-10   948  	BUILD_BUG_ON(FAN_CREATE != FS_CREATE);
235328d1fa4251c Amir Goldstein          2019-01-10   949  	BUILD_BUG_ON(FAN_DELETE != FS_DELETE);
235328d1fa4251c Amir Goldstein          2019-01-10   950  	BUILD_BUG_ON(FAN_DELETE_SELF != FS_DELETE_SELF);
235328d1fa4251c Amir Goldstein          2019-01-10   951  	BUILD_BUG_ON(FAN_MOVE_SELF != FS_MOVE_SELF);
7053aee26a3548e Jan Kara                2014-01-21   952  	BUILD_BUG_ON(FAN_EVENT_ON_CHILD != FS_EVENT_ON_CHILD);
7053aee26a3548e Jan Kara                2014-01-21   953  	BUILD_BUG_ON(FAN_Q_OVERFLOW != FS_Q_OVERFLOW);
7053aee26a3548e Jan Kara                2014-01-21   954  	BUILD_BUG_ON(FAN_OPEN_PERM != FS_OPEN_PERM);
7053aee26a3548e Jan Kara                2014-01-21   955  	BUILD_BUG_ON(FAN_ACCESS_PERM != FS_ACCESS_PERM);
7053aee26a3548e Jan Kara                2014-01-21   956  	BUILD_BUG_ON(FAN_ONDIR != FS_ISDIR);
9b076f1c0f4869b Matthew Bobrowski       2018-11-08   957  	BUILD_BUG_ON(FAN_OPEN_EXEC != FS_OPEN_EXEC);
66917a3130f218d Matthew Bobrowski       2018-11-08   958  	BUILD_BUG_ON(FAN_OPEN_EXEC_PERM != FS_OPEN_EXEC_PERM);
8d11a4f43ef4679 Gabriel Krisman Bertazi 2021-10-25   959  	BUILD_BUG_ON(FAN_FS_ERROR != FS_ERROR);
3982534ba5ce45e Amir Goldstein          2021-11-29   960  	BUILD_BUG_ON(FAN_RENAME != FS_RENAME);
4f8afa33817a642 Amir Goldstein          2024-11-15   961  	BUILD_BUG_ON(FAN_PRE_ACCESS != FS_PRE_ACCESS);
7053aee26a3548e Jan Kara                2014-01-21   962  
0f46d81f2bce970 Miklos Szeredi          2025-01-29  @963  	BUILD_BUG_ON(HWEIGHT32(ALL_FANOTIFY_EVENT_BITS) != 24);
bdd5a46fe30653c Amir Goldstein          2018-10-04   964  
2bfbcccde6e7a78 Amir Goldstein          2021-11-29   965  	mask = fanotify_group_event_mask(group, iter_info, &match_mask,
2bfbcccde6e7a78 Amir Goldstein          2021-11-29   966  					 mask, data, data_type, dir);
2d10b23082a7eb8 Matthew Bobrowski       2018-11-08   967  	if (!mask)
83c4c4b0a3aadc1 Jan Kara                2014-01-21   968  		return 0;
83c4c4b0a3aadc1 Jan Kara                2014-01-21   969  
2bfbcccde6e7a78 Amir Goldstein          2021-11-29   970  	pr_debug("%s: group=%p mask=%x report_mask=%x\n", __func__,
2bfbcccde6e7a78 Amir Goldstein          2021-11-29   971  		 group, mask, match_mask);
7053aee26a3548e Jan Kara                2014-01-21   972  
6685df31255493c Miklos Szeredi          2017-10-30   973  	if (fanotify_is_perm_event(mask)) {
f37650f1c7c71cf Miklos Szeredi          2017-10-30   974  		/*
f37650f1c7c71cf Miklos Szeredi          2017-10-30   975  		 * fsnotify_prepare_user_wait() fails if we race with mark
f37650f1c7c71cf Miklos Szeredi          2017-10-30   976  		 * deletion.  Just let the operation pass in that case.
f37650f1c7c71cf Miklos Szeredi          2017-10-30   977  		 */
f37650f1c7c71cf Miklos Szeredi          2017-10-30   978  		if (!fsnotify_prepare_user_wait(iter_info))
f37650f1c7c71cf Miklos Szeredi          2017-10-30   979  			return 0;
f37650f1c7c71cf Miklos Szeredi          2017-10-30   980  	}
f37650f1c7c71cf Miklos Szeredi          2017-10-30   981  
30ad1938326bf93 Amir Goldstein          2023-11-30   982  	if (FAN_GROUP_FLAG(group, FANOTIFY_FID_BITS))
77115225acc67d9 Amir Goldstein          2019-01-10   983  		fsid = fanotify_get_fsid(iter_info);
77115225acc67d9 Amir Goldstein          2019-01-10   984  
b54cecf5e2293d1 Amir Goldstein          2020-06-07   985  	event = fanotify_alloc_event(group, mask, data, data_type, dir,
2bfbcccde6e7a78 Amir Goldstein          2021-11-29   986  				     file_name, &fsid, match_mask);
f37650f1c7c71cf Miklos Szeredi          2017-10-30   987  	ret = -ENOMEM;
7b1f641776e0c8b Jan Kara                2018-02-21   988  	if (unlikely(!event)) {
7b1f641776e0c8b Jan Kara                2018-02-21   989  		/*
7b1f641776e0c8b Jan Kara                2018-02-21   990  		 * We don't queue overflow events for permission events as
7b1f641776e0c8b Jan Kara                2018-02-21   991  		 * there the access is denied and so no event is in fact lost.
7b1f641776e0c8b Jan Kara                2018-02-21   992  		 */
7b1f641776e0c8b Jan Kara                2018-02-21   993  		if (!fanotify_is_perm_event(mask))
7b1f641776e0c8b Jan Kara                2018-02-21   994  			fsnotify_queue_overflow(group);
f37650f1c7c71cf Miklos Szeredi          2017-10-30   995  		goto finish;
7b1f641776e0c8b Jan Kara                2018-02-21   996  	}
7053aee26a3548e Jan Kara                2014-01-21   997  
7053aee26a3548e Jan Kara                2014-01-21   998  	fsn_event = &event->fse;
1ad03c3a326a86e Gabriel Krisman Bertazi 2021-10-25   999  	ret = fsnotify_insert_event(group, fsn_event, fanotify_merge,
cc53b55f697fe5a Gabriel Krisman Bertazi 2021-10-25  1000  				    fanotify_insert_event);
83c0e1b442b4885 Jan Kara                2014-01-28  1001  	if (ret) {
482ef06c5e946aa Jan Kara                2014-02-21  1002  		/* Permission events shouldn't be merged */
23c9deeb3285d34 Amir Goldstein          2018-10-04  1003  		BUG_ON(ret == 1 && mask & FANOTIFY_PERM_EVENTS);
7053aee26a3548e Jan Kara                2014-01-21  1004  		/* Our event wasn't used in the end. Free it. */
7053aee26a3548e Jan Kara                2014-01-21  1005  		fsnotify_destroy_event(group, fsn_event);
482ef06c5e946aa Jan Kara                2014-02-21  1006  
f37650f1c7c71cf Miklos Szeredi          2017-10-30  1007  		ret = 0;
6685df31255493c Miklos Szeredi          2017-10-30  1008  	} else if (fanotify_is_perm_event(mask)) {
7088f35720a55b9 Jan Kara                2020-03-24  1009  		ret = fanotify_get_response(group, FANOTIFY_PERM(event),
05f0e38724e8449 Jan Kara                2016-11-10  1010  					    iter_info);
85816794240b965 Jan Kara                2014-01-28  1011  	}
f37650f1c7c71cf Miklos Szeredi          2017-10-30  1012  finish:
6685df31255493c Miklos Szeredi          2017-10-30  1013  	if (fanotify_is_perm_event(mask))
f37650f1c7c71cf Miklos Szeredi          2017-10-30  1014  		fsnotify_finish_user_wait(iter_info);
6685df31255493c Miklos Szeredi          2017-10-30  1015  
7053aee26a3548e Jan Kara                2014-01-21  1016  	return ret;
7053aee26a3548e Jan Kara                2014-01-21  1017  }
7053aee26a3548e Jan Kara                2014-01-21  1018  

:::::: The code at line 963 was first introduced by commit
:::::: 0f46d81f2bce970b1c562aa3c944a271bbec2729 fanotify: notify on mount attach and detach

:::::: TO: Miklos Szeredi <mszeredi@redhat.com>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
