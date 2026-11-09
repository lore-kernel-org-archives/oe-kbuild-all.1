Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794210588;
	b=OysZqTpUpvlCP7wR//TxGjuwvcQI1Lp9oOkh2aavZNMbyvCdfs6Kvjin4nLUE0HkkJ56
	 gUwam1Rae1pEhXPHhWExYmAGgawxqiztzbnuEn2kk55noj0AgfsDhnGAO7BwEc3LXo+eN
	 89kUE8CXlXmwURtzcruPQI/AhkGVyI2Z3LRZL51oN0fn4F7uS2YW/Jq+qMGqt+OFWVdkV
	 Wgss/TTmYZ3ueBfU/im2EHLId33rRFIzNPkmKk2644jULrq3qS3Bew+JbUpyYFz7/y4LI
	 5dAP1Bie2+NIrUS2P5HSzAS83q35JXRP+mQ+TSaNISd0XYrAZudp1giA75f3IR9vNnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794210588;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=mFjRdZ3tDbGwqW1Mx3Yf8DWj/UP/jMO5bzv/IPZroos=;
	b=niBEGb+yrHDPdDvuQrsINPGqBapLyFnN0V+ofTps6nbkkYxTbl8dkybYeue2Q0Ct+9O1
	 ymxNmhr/FtdluSOir+9H+5pyvq6tfuKNww/pq06eVyu450hzrO5tYezYuNL4H5nBXFLOM
	 3d6od3sLEm8RP6FgwULnzZnVymrA4OpRKCK81yb1Pw7sNICIGjs/hlyKlqWVPQHHouEGd
	 4ffgSbxhfJcwVJpQIr/eGKaDZcyrEvMaXHa6D53kCR3qZYoi+X6ouZhZ6zoOgxWj0hgIt
	 MkIHjTdIIrYDR5r/Z8RbHXcVifvcMR0Ce7UkLo10z+whIPGN1Ag3rTnAYLfb/YVgQ/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dVxrdaHs;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68650606A32A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Nov 2026 07:49:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68650606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dVxrdaHs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794210586; x=1825746586;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3QyID9OVfsXog7jNUKh01EPf8zfhfJEyGXfR4nlZJyo=;
  b=dVxrdaHsxV6tjgG9p0EvblI7f/c1prdU5D8XKIGBF7OIQdfrelIcVi03
   x5UQ98nRC4KSwrU7P4vz+wAgknS5vX1y/uGygbsZcZeCAvEpjXYfoXTaa
   kKLhA2SY8xa9b8RD99TIDVizpmY2tcesUDA5p/JdYkddWcDzAeMxISQew
   c7+ALPScCoyPWJ3JcOurOqvwykIKNSfQBJgaFMbe8FU8CFydT45z19NGS
   uCQbVQ3hUSrftopq5l7rJvEMqfBhifYH7K0xIphRZgPbUQXV+9UADjlTT
   3gBf4n75ILs84AIWoIfZxBU/4V+kSAVfD5tzYZk5+gBJJzGBxXmYQ0RYp
   w==;
X-CSE-ConnectionGUID: ABe5Vg1UR/SPoZ3I0hNOiw==
X-CSE-MsgGUID: fbNZIfunRPeZPvKRKSYsvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2917409"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2917409"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 23:49:46 -0800
X-CSE-ConnectionGUID: 1FhTNQA8R/WZDuaUHcdqdQ==
X-CSE-MsgGUID: takQrXEkSNy6Jc2Y2KVxUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="8375401"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Nov 2026 23:49:44 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQK8L-00000000u71-49aS;
	Mon, 09 Nov 2026 07:49:41 +0000
Date: Mon, 09 Nov 2026 15:49:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dyndbg-maple-clean 47/50] lib/dynamic_debug.c:117:33:
 warning: conversion from 'long long unsigned int' to 'long unsigned int'
 changes value from '3458764513820540928' to '0'
Message-ID: <202611091712.A9rMTyUn-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dyndbg-maple-clean
head:   5f7782a41d4ca319992609b6589a592f87e83006
commit: af718ee6a3256d73ee276d2c2bbbae9df0da6bfb [47/50] dyndbg: Save _ddebug_site fields into a maple-tree
config: sh-randconfig-1000-20261109 (https://download.01.org/0day-ci/archive/20261109/202611091712.A9rMTyUn-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611091712.A9rMTyUn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611091712.A9rMTyUn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/dynamic_debug.c: In function 'desc_function':
>> lib/dynamic_debug.c:117:33: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '3458764513820540928' to '0' [-Woverflow]
     117 | #define DD_TAG_FUNC             (3ULL << DD_KEY_TAG_SHIFT)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:292:68: note: in definition of macro 'DEFINE_DYNDBG_SITE_ACCESSOR'
     292 |         unsigned long key = ddebug_site_tag_key((unsigned long)dp, tag); \
         |                                                                    ^~~
   lib/dynamic_debug.c:301:39: note: in expansion of macro 'DD_TAG_FUNC'
     301 | DEFINE_DYNDBG_SITE_ACCESSOR(function, DD_TAG_FUNC)
         |                                       ^~~~~~~~~~~
   lib/dynamic_debug.c: In function 'desc_filename':
   lib/dynamic_debug.c:116:33: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '2305843009213693952' to '0' [-Woverflow]
     116 | #define DD_TAG_FILE             (2ULL << DD_KEY_TAG_SHIFT)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:292:68: note: in definition of macro 'DEFINE_DYNDBG_SITE_ACCESSOR'
     292 |         unsigned long key = ddebug_site_tag_key((unsigned long)dp, tag); \
         |                                                                    ^~~
   lib/dynamic_debug.c:302:39: note: in expansion of macro 'DD_TAG_FILE'
     302 | DEFINE_DYNDBG_SITE_ACCESSOR(filename, DD_TAG_FILE)
         |                                       ^~~~~~~~~~~
   lib/dynamic_debug.c: In function 'desc_modname':
   lib/dynamic_debug.c:115:33: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '1152921504606846976' to '0' [-Woverflow]
     115 | #define DD_TAG_MOD              (1ULL << DD_KEY_TAG_SHIFT)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:292:68: note: in definition of macro 'DEFINE_DYNDBG_SITE_ACCESSOR'
     292 |         unsigned long key = ddebug_site_tag_key((unsigned long)dp, tag); \
         |                                                                    ^~~
   lib/dynamic_debug.c:303:38: note: in expansion of macro 'DD_TAG_MOD'
     303 | DEFINE_DYNDBG_SITE_ACCESSOR(modname, DD_TAG_MOD)
         |                                      ^~~~~~~~~~
   lib/dynamic_debug.c: In function 'ddebug_resolve_site':
   lib/dynamic_debug.c:115:33: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '1152921504606846976' to '0' [-Woverflow]
     115 | #define DD_TAG_MOD              (1ULL << DD_KEY_TAG_SHIFT)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:311:65: note: in expansion of macro 'DD_TAG_MOD'
     311 |                 *mod = mtree_load(mt, ddebug_site_tag_key(addr, DD_TAG_MOD)) ?: "unknown";
         |                                                                 ^~~~~~~~~~
   lib/dynamic_debug.c:116:33: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '2305843009213693952' to '0' [-Woverflow]
     116 | #define DD_TAG_FILE             (2ULL << DD_KEY_TAG_SHIFT)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:313:66: note: in expansion of macro 'DD_TAG_FILE'
     313 |                 *file = mtree_load(mt, ddebug_site_tag_key(addr, DD_TAG_FILE)) ?: "unknown";
         |                                                                  ^~~~~~~~~~~
>> lib/dynamic_debug.c:117:33: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '3458764513820540928' to '0' [-Woverflow]
     117 | #define DD_TAG_FUNC             (3ULL << DD_KEY_TAG_SHIFT)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:315:66: note: in expansion of macro 'DD_TAG_FUNC'
     315 |                 *func = mtree_load(mt, ddebug_site_tag_key(addr, DD_TAG_FUNC)) ?: "unknown";
         |                                                                  ^~~~~~~~~~~
   lib/dynamic_debug.c: In function 'ddebug_condense_sites':
>> lib/dynamic_debug.c:117:33: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '3458764513820540928' to '0' [-Woverflow]
     117 | #define DD_TAG_FUNC             (3ULL << DD_KEY_TAG_SHIFT)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1825:63: note: in expansion of macro 'DD_TAG_FUNC'
    1825 |                                  "func", ddebug_get_function, DD_TAG_FUNC);
         |                                                               ^~~~~~~~~~~
   lib/dynamic_debug.c:116:33: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '2305843009213693952' to '0' [-Woverflow]
     116 | #define DD_TAG_FILE             (2ULL << DD_KEY_TAG_SHIFT)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1827:63: note: in expansion of macro 'DD_TAG_FILE'
    1827 |                                  "file", ddebug_get_filename, DD_TAG_FILE);
         |                                                               ^~~~~~~~~~~
   lib/dynamic_debug.c:115:33: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '1152921504606846976' to '0' [-Woverflow]
     115 | #define DD_TAG_MOD              (1ULL << DD_KEY_TAG_SHIFT)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1829:60: note: in expansion of macro 'DD_TAG_MOD'
    1829 |                                 "mod", ddebug_get_modname, DD_TAG_MOD);
         |                                                            ^~~~~~~~~~
   lib/dynamic_debug.c: In function 'ddebug_module_sites_clear':
   lib/dynamic_debug.c:115:33: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '1152921504606846976' to '0' [-Woverflow]
     115 | #define DD_TAG_MOD              (1ULL << DD_KEY_TAG_SHIFT)
         |                                 ^
   lib/dynamic_debug.c:1968:34: note: in expansion of macro 'DD_TAG_MOD'
    1968 |         unsigned long tags[] = { DD_TAG_MOD, DD_TAG_FILE, DD_TAG_FUNC };
         |                                  ^~~~~~~~~~
   lib/dynamic_debug.c:116:33: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '2305843009213693952' to '0' [-Woverflow]
     116 | #define DD_TAG_FILE             (2ULL << DD_KEY_TAG_SHIFT)
         |                                 ^
   lib/dynamic_debug.c:1968:46: note: in expansion of macro 'DD_TAG_FILE'
    1968 |         unsigned long tags[] = { DD_TAG_MOD, DD_TAG_FILE, DD_TAG_FUNC };
         |                                              ^~~~~~~~~~~
>> lib/dynamic_debug.c:117:33: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '3458764513820540928' to '0' [-Woverflow]
     117 | #define DD_TAG_FUNC             (3ULL << DD_KEY_TAG_SHIFT)
         |                                 ^
   lib/dynamic_debug.c:1968:59: note: in expansion of macro 'DD_TAG_FUNC'
    1968 |         unsigned long tags[] = { DD_TAG_MOD, DD_TAG_FILE, DD_TAG_FUNC };
         |                                                           ^~~~~~~~~~~


vim +117 lib/dynamic_debug.c

   112	
   113	#define DD_KEY_TAG_SHIFT	60
   114	#define DD_KEY_TAG_MASK		(0xFULL << DD_KEY_TAG_SHIFT)
   115	#define DD_TAG_MOD		(1ULL << DD_KEY_TAG_SHIFT)
   116	#define DD_TAG_FILE		(2ULL << DD_KEY_TAG_SHIFT)
 > 117	#define DD_TAG_FUNC		(3ULL << DD_KEY_TAG_SHIFT)
   118	#define DD_KEY_ADDR_MASK	(~DD_KEY_TAG_MASK)
   119	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
