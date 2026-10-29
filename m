Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793277207;
	b=PwsJZqvs8YrgJjAAFeKJlhrVgJs3OWTkV2fAuu2klyCPe6+iFrLZ4F9QfK3ZDrHymvjO
	 tEcNcCclZHzF84iR8j/WF60pV0jm/muWgNzn05keQDtetK9sdT8Jvle+as0Wk0s6RatLi
	 ZTCGaNncxHMKDafITjFVydd9HbMtwcDVQgyZgoQBMS4shSjBLIoIPZNl/ud7Vk6FiIAGr
	 Q7SI6lo5SH8hzBiOqI9bcwnC4G1orgypfwzfN3wItq2Mvxnt2Af6ZfdBKwJquz2NUurWW
	 mQudwcOtaOf/OqjZIemN7hbCncXuLJFzNAyZNJy7598DT6IrllKzhYUcaJ3x0JfZ36g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793277207;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=9L1FvHrJpW2/aU0AVQehFY+ZAYAMItfLEotdNa0c58U=;
	b=EekXGdjy/NOFUqAc6W6nAn9VRjwmPQIzY8mrIpwMK7nnzM89RAMpEmwpGEGtm6SNkZUa
	 VXQkm0ah/XBpU1HMEt3484ffDQVHIKA+Eoc/7sEREAPXUzA7ptTFuEkNUPNDnnrVCPykv
	 ibqgxReBeUnoEVkrGEFVgxlXXUuNAd5waCOOG3IZaS7MwQlATG+ESaJPUmh8i/p3YZvNs
	 0r2dppjfNyAEzgSXpw3icGDdPUMEHr9BWAM3BOAohzcnUKYwrAxnCXs4fO4ixvKlJEB2a
	 +9unCQB7xgr+oAB1mAThLddZXWW5E0WqdxVj5jUxf1QAl1yjfZ7iOU3Q2z8V65RUjjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dy0DeykJ;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A19E606A31A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 12:33:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A19E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dy0DeykJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793277204; x=1824813204;
  h=date:from:to:cc:subject:message-id;
  bh=Pxp7uNctAoBmoT6hnMSvhZAURAY9tYT2Nryc2Xh3cTs=;
  b=dy0DeykJPaJMBcQMD6FxE9kbzMAm+pwSz86mbrfxeYRQ+m5HWfxDM6ET
   RFbnXATYELtsCprlDksGe0kgujBSCQBOEwmw2Ybiwpo2PoupdybaVpgrm
   6n6/m/cczWBGRxPl4RhzlVyrEFLC+/wvRSRTx1QtzQmnTzneVf+m0nI58
   Y97jVM3zVDbgaU4BKYTFqGHTQREnbcDbUUDgEpjZGhIXZtK3RKqi8F9tR
   qWyqZtQ1/qb6eGM6yeJ0hO98xTeMHhbFJOniDkuPYOx4bMQagQoKekl1z
   nERDDcABNdKFoTFawbrlxEPObA4LBJYki3lcJEZsdbCf0HhlZ9em8saDY
   w==;
X-CSE-ConnectionGUID: cJAfFWqpTWCIis1R+Jj4UA==
X-CSE-MsgGUID: uLfhvZREQKSWPvRQbEpRCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1915980"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1915980"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 05:33:23 -0700
X-CSE-ConnectionGUID: +dZ2MxoxR0mBs1U9WzMDmA==
X-CSE-MsgGUID: upQ+sW5fQ+q+GeXTM7wETg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5236777"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 29 Oct 2026 05:33:21 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMPJn-000000005F5-2Aop;
	Thu, 29 Oct 2026 12:33:19 +0000
Date: Thu, 29 Oct 2026 13:32:29 +0100
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett (Google)" <liam@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [liam:dense_ulong 2/80] include/linux/build_bug.h:80:41:
 error: static assertion failed: "sizeof(struct maple_node) == 256"
Message-ID: <202610291358.XyTYl6ty-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/liam/linux.git dense_ulong
head:   05d6e5c4cab7c4912959bf9ea5f797e6bc55eca5
commit: 02b16ccaeab9ace765973a2fb9f473e84982b58b [2/80] maple_tree: assert the node size
config: x86_64-randconfig-r2201-20261029 (https://download.01.org/0day-ci/archive/20261029/202610291358.XyTYl6ty-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610291358.XyTYl6ty-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610291358.XyTYl6ty-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bits.h:30,
                    from include/linux/bitops.h:6,
                    from include/linux/log2.h:12,
                    from arch/x86/include/asm/div64.h:8,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from arch/x86/entry/vdso/vdso32/../common/vclock_gettime.c:11,
                    from arch/x86/entry/vdso/vdso32/vclock_gettime.c:1:
>> include/linux/build_bug.h:80:41: error: static assertion failed: "sizeof(struct maple_node) == 256"
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:79:34: note: in expansion of macro '__static_assert'
      79 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/maple_tree.h:346:1: note: in expansion of macro 'static_assert'
     346 | static_assert(sizeof(struct maple_node) == 256);
         | ^~~~~~~~~~~~~


vim +80 include/linux/build_bug.h

bc6245e5efd70c4 Ian Abbott       2017-07-10  61  
6bab69c65013bed Rasmus Villemoes 2019-03-07  62  /**
6bab69c65013bed Rasmus Villemoes 2019-03-07  63   * static_assert - check integer constant expression at build time
6ffd853b0b10e1e Randy Dunlap     2026-03-01  64   * @expr: expression to be checked
6bab69c65013bed Rasmus Villemoes 2019-03-07  65   *
6bab69c65013bed Rasmus Villemoes 2019-03-07  66   * static_assert() is a wrapper for the C11 _Static_assert, with a
6bab69c65013bed Rasmus Villemoes 2019-03-07  67   * little macro magic to make the message optional (defaulting to the
6bab69c65013bed Rasmus Villemoes 2019-03-07  68   * stringification of the tested expression).
6bab69c65013bed Rasmus Villemoes 2019-03-07  69   *
6bab69c65013bed Rasmus Villemoes 2019-03-07  70   * Contrary to BUILD_BUG_ON(), static_assert() can be used at global
6bab69c65013bed Rasmus Villemoes 2019-03-07  71   * scope, but requires the expression to be an integer constant
6bab69c65013bed Rasmus Villemoes 2019-03-07  72   * expression (i.e., it is not enough that __builtin_constant_p() is
6bab69c65013bed Rasmus Villemoes 2019-03-07  73   * true for expr).
6bab69c65013bed Rasmus Villemoes 2019-03-07  74   *
6bab69c65013bed Rasmus Villemoes 2019-03-07  75   * Also note that BUILD_BUG_ON() fails the build if the condition is
6bab69c65013bed Rasmus Villemoes 2019-03-07  76   * true, while static_assert() fails the build if the expression is
6bab69c65013bed Rasmus Villemoes 2019-03-07  77   * false.
6bab69c65013bed Rasmus Villemoes 2019-03-07  78   */
6bab69c65013bed Rasmus Villemoes 2019-03-07  79  #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
6bab69c65013bed Rasmus Villemoes 2019-03-07 @80  #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
6bab69c65013bed Rasmus Villemoes 2019-03-07  81  
07a368b3f55a79d Maxim Levitsky   2022-10-25  82  

:::::: The code at line 80 was first introduced by commit
:::::: 6bab69c65013bed5fce9f101a64a84d0385b3946 build_bug.h: add wrapper for _Static_assert

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
