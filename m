Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890E03806CE
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Sep 2026 22:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788562326; cv=none; b=kleURQhIrZeabXzy7KaJMK2y2t3bKFeWAbgAlI9vHGgj5qwTCVB0K9JfprPxjGRWFMhB3Jd21GyLpQOxQ+OgXJviDJZt1A1E4ptu/3DHXN631Sc7/Qgj9q5RNqOhHJRJn626L6CNyX1IIsvy0oKP9nLWBWuTWZV8glfBMZNg97E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788562326; c=relaxed/simple;
	bh=EorygrDyIJrkJgQNC9S4/8YTC1ny2Di4m3zJYfEh/JA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=l6e+8tVQxRTzGrgZaC8IPjgAK1qbI98wPTxBJns2M8YOwq6mZvL3LZWSx750E0pdYmtIZovPU33PCEGanXhWQJLE0d7Klacjm9H40G5H9isK0mLysI6DWjf39SoOAhVb8Jy1qukx2rQ4qZYWvN3x9i5YzJwZuAnxVLF+BO+Q5KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kr/i83os; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kr/i83os"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788562324; x=1820098324;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EorygrDyIJrkJgQNC9S4/8YTC1ny2Di4m3zJYfEh/JA=;
  b=kr/i83os6J3NUXd7pR7vNEwCMbF5A3fR9+uP0AoS8StSw5TSSvwsik8r
   3Rk0nj/oRK3pL4p4ov+DH6xvCl1YYLaEGy83n2ZTi0M390a9Hhos1YdAG
   m0M3DQ8yur6qhEz70MOD9F4kTthNKtR3BIe8MNDPBLOXpSm0dKnNpHU9/
   JHrU/2TULLwyFJfEGsCtFaI/6K+GqEkHGxtulux/OX1phgGsUYQhuZVgl
   rnZS2g+o+0eSHqi1bBIhTdnzgmt1HEo4ocizBIXHgMX/7vndHet/1jcq3
   6MOh96rHpmT9BSXSq9hRhJeISJcxcJC58QLnzmKiuQLEquBj0Ao6rED+a
   Q==;
X-CSE-ConnectionGUID: M9dDLQi5SBSFFwMuaSj+xQ==
X-CSE-MsgGUID: JU/oji9xQD2O2ZESz745mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="88993725"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="88993725"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 15:52:03 -0700
X-CSE-ConnectionGUID: kwcKDp78RU+osCQypTigFw==
X-CSE-MsgGUID: BjJPjz0EQO22dNR8bSOcsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="267580173"
Received: from igk-lkp-server01.igk.intel.com (HELO bcd5fd227bc8) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 04 Sep 2026 15:52:01 -0700
Received: from kbuild by bcd5fd227bc8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2clL-00000000095-2KdX;
	Fri, 04 Sep 2026 22:51:59 +0000
Date: Sat, 05 Sep 2026 00:51:51 +0200
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:wk-merge-v8-all 216/234] lib/dynamic_debug.c:115:33:
 warning: conversion from 'long long unsigned int' to 'long unsigned int'
 changes value from '3458764513820540928' to '0'
Message-ID: <202609050027.Gs5XdM6m-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git wk-merge-v8-all
head:   15fc7b4f50950618237402fdf3a05eb0caaff2cc
commit: fbbcdc4bb3ae24bea37af4a59c08eeae5553e1dc [216/234] lib/dynamic_debug: Combine 3 site-data maple trees into a single tree
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260905/202609050027.Gs5XdM6m-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609050027.Gs5XdM6m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609050027.Gs5XdM6m-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/dynamic_debug.c: In function 'desc_function':
>> lib/dynamic_debug.c:115:33: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '3458764513820540928' to '0' [-Woverflow]
     115 | #define DD_TAG_FUNC             (3ULL << DD_KEY_TAG_SHIFT)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:300:68: note: in definition of macro 'DEFINE_DYNDBG_SITE_ACCESSOR'
     300 |         unsigned long key = ddebug_site_tag_key((unsigned long)dp, tag); \
         |                                                                    ^~~
   lib/dynamic_debug.c:309:39: note: in expansion of macro 'DD_TAG_FUNC'
     309 | DEFINE_DYNDBG_SITE_ACCESSOR(function, DD_TAG_FUNC)
         |                                       ^~~~~~~~~~~
   lib/dynamic_debug.c: In function 'desc_filename':
   lib/dynamic_debug.c:114:33: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '2305843009213693952' to '0' [-Woverflow]
     114 | #define DD_TAG_FILE             (2ULL << DD_KEY_TAG_SHIFT)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:300:68: note: in definition of macro 'DEFINE_DYNDBG_SITE_ACCESSOR'
     300 |         unsigned long key = ddebug_site_tag_key((unsigned long)dp, tag); \
         |                                                                    ^~~
   lib/dynamic_debug.c:310:39: note: in expansion of macro 'DD_TAG_FILE'
     310 | DEFINE_DYNDBG_SITE_ACCESSOR(filename, DD_TAG_FILE)
         |                                       ^~~~~~~~~~~
   lib/dynamic_debug.c: In function 'desc_modname':
   lib/dynamic_debug.c:113:33: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '1152921504606846976' to '0' [-Woverflow]
     113 | #define DD_TAG_MOD              (1ULL << DD_KEY_TAG_SHIFT)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:300:68: note: in definition of macro 'DEFINE_DYNDBG_SITE_ACCESSOR'
     300 |         unsigned long key = ddebug_site_tag_key((unsigned long)dp, tag); \
         |                                                                    ^~~
   lib/dynamic_debug.c:311:38: note: in expansion of macro 'DD_TAG_MOD'
     311 | DEFINE_DYNDBG_SITE_ACCESSOR(modname, DD_TAG_MOD)
         |                                      ^~~~~~~~~~
   lib/dynamic_debug.c: In function 'ddebug_condense_sites':
>> lib/dynamic_debug.c:115:33: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '3458764513820540928' to '0' [-Woverflow]
     115 | #define DD_TAG_FUNC             (3ULL << DD_KEY_TAG_SHIFT)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1746:63: note: in expansion of macro 'DD_TAG_FUNC'
    1746 |                                  "func", ddebug_get_function, DD_TAG_FUNC);
         |                                                               ^~~~~~~~~~~
   lib/dynamic_debug.c:114:33: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '2305843009213693952' to '0' [-Woverflow]
     114 | #define DD_TAG_FILE             (2ULL << DD_KEY_TAG_SHIFT)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1748:63: note: in expansion of macro 'DD_TAG_FILE'
    1748 |                                  "file", ddebug_get_filename, DD_TAG_FILE);
         |                                                               ^~~~~~~~~~~
   lib/dynamic_debug.c:113:33: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '1152921504606846976' to '0' [-Woverflow]
     113 | #define DD_TAG_MOD              (1ULL << DD_KEY_TAG_SHIFT)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:1750:60: note: in expansion of macro 'DD_TAG_MOD'
    1750 |                                 "mod", ddebug_get_modname, DD_TAG_MOD);
         |                                                            ^~~~~~~~~~
   lib/dynamic_debug.c: In function 'ddebug_module_sites_clear':
   lib/dynamic_debug.c:113:33: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '1152921504606846976' to '0' [-Woverflow]
     113 | #define DD_TAG_MOD              (1ULL << DD_KEY_TAG_SHIFT)
         |                                 ^
   lib/dynamic_debug.c:1912:34: note: in expansion of macro 'DD_TAG_MOD'
    1912 |         unsigned long tags[] = { DD_TAG_MOD, DD_TAG_FILE, DD_TAG_FUNC };
         |                                  ^~~~~~~~~~
   lib/dynamic_debug.c:114:33: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '2305843009213693952' to '0' [-Woverflow]
     114 | #define DD_TAG_FILE             (2ULL << DD_KEY_TAG_SHIFT)
         |                                 ^
   lib/dynamic_debug.c:1912:46: note: in expansion of macro 'DD_TAG_FILE'
    1912 |         unsigned long tags[] = { DD_TAG_MOD, DD_TAG_FILE, DD_TAG_FUNC };
         |                                              ^~~~~~~~~~~
>> lib/dynamic_debug.c:115:33: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '3458764513820540928' to '0' [-Woverflow]
     115 | #define DD_TAG_FUNC             (3ULL << DD_KEY_TAG_SHIFT)
         |                                 ^
   lib/dynamic_debug.c:1912:59: note: in expansion of macro 'DD_TAG_FUNC'
    1912 |         unsigned long tags[] = { DD_TAG_MOD, DD_TAG_FILE, DD_TAG_FUNC };
         |                                                           ^~~~~~~~~~~
   lib/dynamic_debug.c: In function 'dynamic_debug_init':
   lib/dynamic_debug.c:113:33: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '1152921504606846976' to '0' [-Woverflow]
     113 | #define DD_TAG_MOD              (1ULL << DD_KEY_TAG_SHIFT)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:2181:70: note: in expansion of macro 'DD_TAG_MOD'
    2181 |                 unsigned long mod_start_key = ddebug_site_tag_key(0, DD_TAG_MOD);
         |                                                                      ^~~~~~~~~~
   lib/dynamic_debug.c:113:33: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '1152921504606846976' to '0' [-Woverflow]
     113 | #define DD_TAG_MOD              (1ULL << DD_KEY_TAG_SHIFT)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:2182:76: note: in expansion of macro 'DD_TAG_MOD'
    2182 |                 unsigned long mod_end_key = ddebug_site_tag_key(ULONG_MAX, DD_TAG_MOD);
         |                                                                            ^~~~~~~~~~


vim +115 lib/dynamic_debug.c

   110	
   111	#define DD_KEY_TAG_SHIFT	60
   112	#define DD_KEY_TAG_MASK		(0xFULL << DD_KEY_TAG_SHIFT)
   113	#define DD_TAG_MOD		(1ULL << DD_KEY_TAG_SHIFT)
   114	#define DD_TAG_FILE		(2ULL << DD_KEY_TAG_SHIFT)
 > 115	#define DD_TAG_FUNC		(3ULL << DD_KEY_TAG_SHIFT)
   116	#define DD_KEY_ADDR_MASK	(~DD_KEY_TAG_MASK)
   117	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
