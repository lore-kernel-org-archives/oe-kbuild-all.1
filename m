Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113AC24166D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Oct 2025 07:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760684849; cv=none; b=KpslYL9X1YlSC/06bijwCCorn5MZkt3ZLBEOj4PkEKOD4vbeRiVUAy/Pdn0gK9AIATPFk8kvvKH3nDoe3jxISvhauuqAUBqy/8oesQOY5cAZWOY7IxrUMKUBJwCucy67voT+7C6tDJrjiXLyh7V4PAKP27Nq6mkVnhNHIw3c91w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760684849; c=relaxed/simple;
	bh=UbgbfVthZEDL1KskeTE+rQOlDnbkxAcqhtSOYQgd6aQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V5LdgDEXUc6IJMpdfw7wNJj6h/cHnztWyRmt6ggPzQzW1dLYKbpFIDj05RaS5895wjuWfti94zj19ZGEJ5IKK7Ov7NE1V2YypIgWJCdqU6U4BJo37YIObLgfffGj7JuZO0qu0Y0vyCLzB4tl9xLqaih4NHukAFwIiJlxW50Cgos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fgh+zr8r; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fgh+zr8r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760684848; x=1792220848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UbgbfVthZEDL1KskeTE+rQOlDnbkxAcqhtSOYQgd6aQ=;
  b=fgh+zr8r8MRF3vVYxdLwWWhqX7k5qn5AAsF/PCDkgslmPoteGBI4CVWe
   fSWRdG6YCPd91FtaHnEfLytAIAysTAytVzoLVSsQDBDNpSlZsYKWAv7tZ
   Eg+2LlIu0zruScAU0jUIQhnKGeRejKVAtP2YjV1xcYonIh5ksj69iNkGS
   SApBDZ1WuenF0rJbznkK6m6Jclo/9TcC6mi0OXgYxj25O7URax7q3V2wO
   GB4SQ42PwAOBoilYSiq+UxzSZyd+yiyCEWpL7mds/VRCrdyqI4+vY8wLu
   a0uMebyhsO5PUk92nKkZe+wD1ZiGA/SGIWVWN1QaaIX93Q21JA6HCmJmw
   Q==;
X-CSE-ConnectionGUID: Z8T0G9B6RUWd9gP8Kyk0eQ==
X-CSE-MsgGUID: YCuDHHMkQreJZDBuJVv+iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="66756383"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="66756383"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 00:07:27 -0700
X-CSE-ConnectionGUID: N82J5V8KQ0+pTXQJPiUvDA==
X-CSE-MsgGUID: l2KejMNhQzGR3S4WeJ0t6g==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 17 Oct 2025 00:07:26 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9eX5-0005ej-10;
	Fri, 17 Oct 2025 07:06:05 +0000
Date: Fri, 17 Oct 2025 15:02:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-classmap-fix-6.17 27/38] lib/test_dynamic_debug.c:108:1:
 error: expected identifier
Message-ID: <202510171448.WEay4ucH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-classmap-fix-6.17
head:   36a2d67a6a00aa0b4e498e871326b3224207e569
commit: a1cb7cf5327448a6a51394e613a4bd7dd4985f3b [27/38] no-side-h-check
config: i386-buildonly-randconfig-002-20251017 (https://download.01.org/0day-ci/archive/20251017/202510171448.WEay4ucH-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510171448.WEay4ucH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510171448.WEay4ucH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/test_dynamic_debug.c:108:1: error: expected identifier
     108 | DYNAMIC_DEBUG_CLASSMAP_DEFINE(map_disjoint_bits, DD_CLASS_TYPE_DISJOINT_BITS,
         | ^
   include/linux/dynamic_debug.h:209:52: note: expanded from macro 'DYNAMIC_DEBUG_CLASSMAP_DEFINE'
     209 |         __DYNAMIC_DEBUG_CLASSMAP_CHECK(_var##_classnames, (_base));     \
         |                                                           ^
>> lib/test_dynamic_debug.c:108:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   include/linux/dynamic_debug.h:209:2: note: expanded from macro 'DYNAMIC_DEBUG_CLASSMAP_DEFINE'
     209 |         __DYNAMIC_DEBUG_CLASSMAP_CHECK(_var##_classnames, (_base));     \
         |         ^
   include/linux/dynamic_debug.h:188:2: note: expanded from macro '__DYNAMIC_DEBUG_CLASSMAP_CHECK'
     188 |         __no_side_effects(_clnames, _base)                              \
         |         ^
>> lib/test_dynamic_debug.c:108:1: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
   include/linux/dynamic_debug.h:209:2: note: expanded from macro 'DYNAMIC_DEBUG_CLASSMAP_DEFINE'
     209 |         __DYNAMIC_DEBUG_CLASSMAP_CHECK(_var##_classnames, (_base));     \
         |         ^
   include/linux/dynamic_debug.h:188:19: note: expanded from macro '__DYNAMIC_DEBUG_CLASSMAP_CHECK'
     188 |         __no_side_effects(_clnames, _base)                              \
         |                          ^
>> lib/test_dynamic_debug.c:108:1: error: expected ';' after top level declarator
   include/linux/dynamic_debug.h:209:2: note: expanded from macro 'DYNAMIC_DEBUG_CLASSMAP_DEFINE'
     209 |         __DYNAMIC_DEBUG_CLASSMAP_CHECK(_var##_classnames, (_base));     \
         |         ^
   include/linux/dynamic_debug.h:189:2: note: expanded from macro '__DYNAMIC_DEBUG_CLASSMAP_CHECK'
     189 |         static_assert(((_base) >= 0 && (_base) < _DPRINTK_CLASS_DFLT),  \
         |         ^
   include/linux/build_bug.h:77:34: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^
   include/linux/build_bug.h:78:41: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^
   lib/test_dynamic_debug.c:121:1: error: expected identifier
     121 | DYNAMIC_DEBUG_CLASSMAP_DEFINE(map_level_num, DD_CLASS_TYPE_LEVEL_NUM,
         | ^
   include/linux/dynamic_debug.h:209:52: note: expanded from macro 'DYNAMIC_DEBUG_CLASSMAP_DEFINE'
     209 |         __DYNAMIC_DEBUG_CLASSMAP_CHECK(_var##_classnames, (_base));     \
         |                                                           ^
   lib/test_dynamic_debug.c:121:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   include/linux/dynamic_debug.h:209:2: note: expanded from macro 'DYNAMIC_DEBUG_CLASSMAP_DEFINE'
     209 |         __DYNAMIC_DEBUG_CLASSMAP_CHECK(_var##_classnames, (_base));     \
         |         ^
   include/linux/dynamic_debug.h:188:2: note: expanded from macro '__DYNAMIC_DEBUG_CLASSMAP_CHECK'
     188 |         __no_side_effects(_clnames, _base)                              \
         |         ^
   lib/test_dynamic_debug.c:121:1: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
   include/linux/dynamic_debug.h:209:2: note: expanded from macro 'DYNAMIC_DEBUG_CLASSMAP_DEFINE'
     209 |         __DYNAMIC_DEBUG_CLASSMAP_CHECK(_var##_classnames, (_base));     \
         |         ^
   include/linux/dynamic_debug.h:188:19: note: expanded from macro '__DYNAMIC_DEBUG_CLASSMAP_CHECK'
     188 |         __no_side_effects(_clnames, _base)                              \
         |                          ^
   lib/test_dynamic_debug.c:121:1: error: expected ';' after top level declarator
   include/linux/dynamic_debug.h:209:2: note: expanded from macro 'DYNAMIC_DEBUG_CLASSMAP_DEFINE'
     209 |         __DYNAMIC_DEBUG_CLASSMAP_CHECK(_var##_classnames, (_base));     \
         |         ^
   include/linux/dynamic_debug.h:189:2: note: expanded from macro '__DYNAMIC_DEBUG_CLASSMAP_CHECK'
     189 |         static_assert(((_base) >= 0 && (_base) < _DPRINTK_CLASS_DFLT),  \
         |         ^
   include/linux/build_bug.h:77:34: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^
   include/linux/build_bug.h:78:41: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^
   8 errors generated.


vim +108 lib/test_dynamic_debug.c

d28e3ef3e2d17d Jim Cromie 2022-12-21  100  
d28e3ef3e2d17d Jim Cromie 2022-12-21  101  /* recapitulate DRM's multi-classmap setup */
d28e3ef3e2d17d Jim Cromie 2022-12-21  102  #if !defined(TEST_DYNAMIC_DEBUG_SUBMOD)
d28e3ef3e2d17d Jim Cromie 2022-12-21  103  /*
d28e3ef3e2d17d Jim Cromie 2022-12-21  104   * In single user, or parent / coordinator (drm.ko) modules, define
d28e3ef3e2d17d Jim Cromie 2022-12-21  105   * classmaps on the client enums above, and then declares the PARAMS
d28e3ef3e2d17d Jim Cromie 2022-12-21  106   * ref'g the classmaps.  Each is exported.
d28e3ef3e2d17d Jim Cromie 2022-12-21  107   */
d28e3ef3e2d17d Jim Cromie 2022-12-21 @108  DYNAMIC_DEBUG_CLASSMAP_DEFINE(map_disjoint_bits, DD_CLASS_TYPE_DISJOINT_BITS,
d28e3ef3e2d17d Jim Cromie 2022-12-21  109  			      D2_CORE,
6ea3bf466ac6ad Jim Cromie 2022-09-04  110  			      "D2_CORE",
6ea3bf466ac6ad Jim Cromie 2022-09-04  111  			      "D2_DRIVER",
6ea3bf466ac6ad Jim Cromie 2022-09-04  112  			      "D2_KMS",
6ea3bf466ac6ad Jim Cromie 2022-09-04  113  			      "D2_PRIME",
6ea3bf466ac6ad Jim Cromie 2022-09-04  114  			      "D2_ATOMIC",
6ea3bf466ac6ad Jim Cromie 2022-09-04  115  			      "D2_VBL",
6ea3bf466ac6ad Jim Cromie 2022-09-04  116  			      "D2_STATE",
6ea3bf466ac6ad Jim Cromie 2022-09-04  117  			      "D2_LEASE",
6ea3bf466ac6ad Jim Cromie 2022-09-04  118  			      "D2_DP",
6ea3bf466ac6ad Jim Cromie 2022-09-04  119  			      "D2_DRMRES");
6ea3bf466ac6ad Jim Cromie 2022-09-04  120  

:::::: The code at line 108 was first introduced by commit
:::::: d28e3ef3e2d17df21e65b2b5fc18ac9d159fe4cf dyndbg-API: replace DECLARE_DYNDBG_CLASSMAP

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Jim Cromie <jim.cromie@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
