Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F6A2253FC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 May 2026 05:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778908883; cv=none; b=Bc4HElsXa4pfwW6P/OR2h+wR+L7AJarC8463gnSpQrgXLnnJQTArqNU2tu7YkDaJBtqhleZfSocK4lIZKNPBVnqiLeJZz3hsHxJBhBXLjvRlsvHJ2GJFrxaU6TqoHIwV8Ml235xg85iy2fExVniqnDrHlZN+r0ItuzpbQMvrzRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778908883; c=relaxed/simple;
	bh=Y2+bQxtfxtSrkLlXbOJLIE0R7sgTF4xzF2WgwGSGgis=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h4Xsws0i8KgB5oFcuCo79pQo9Pd8bt7ecAsSSuEdED+5PjyS3Reanc4lb6rVOxw85GhDnykPXpNJo8PTDe7jrlVArRNNKImykJuG2r5pZ/4kshJxdNyKFDXu7cmaKN/isp/j9kx7rMS+gRgY3z77+w1GKXSeNKarHhFwS3BWMbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b+UBzkaQ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b+UBzkaQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778908881; x=1810444881;
  h=date:from:to:cc:subject:message-id;
  bh=Y2+bQxtfxtSrkLlXbOJLIE0R7sgTF4xzF2WgwGSGgis=;
  b=b+UBzkaQ26zMjJuM5dskdWUfrOvU6ANQfDETBoy93Pg/lu1rolApfcCn
   vWJQt0NvETpNEhtepRcbcWgOFPoJgOGDk4Zxt7jtN88A/OBSw4j42yJS+
   DuyAryiQXWsqRx/sxfdMPbHkq5SEMFMPFzETfFq6oCr+WTb9bLqSIT6Sl
   g0Frm19SYlonYPfCWNojxG69RQ8H4UfsSfIacgmdwh9GToGK03NIWm9Cx
   3HhRw3d+d1/eXEZ4IkB3CndxPr95PZkf8LzcxJqYoVJm8CUP5orR1IWoo
   s8Gb1+UrP4agObLV4DeMXrXFHLJZCcsIO6zw9/ea2WEYHeclvHrQYEjOW
   Q==;
X-CSE-ConnectionGUID: d2bh6APUTkSt5JD3hY43eA==
X-CSE-MsgGUID: Al69B9saTp6wCBvURSP+Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79836827"
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="79836827"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 22:21:20 -0700
X-CSE-ConnectionGUID: 0i1Pwh+TR7aTLVIq/iZEmg==
X-CSE-MsgGUID: oFGL+ydIRO2Yo5FNbTvSUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,237,1770624000"; 
   d="scan'208";a="235858044"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 May 2026 22:21:18 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wO7Se-000000000Wr-2AJl;
	Sat, 16 May 2026 05:21:16 +0000
Date: Sat, 16 May 2026 13:21:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-sp 1/1]
 include/linux/compiler.h:166:45: error: '__UNIQUE_ID_y_348' undeclared; did
 you mean '__UNIQUE_ID_x_347'?
Message-ID: <202605161321.ClYlzI5Y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-sp
head:   f815f5cffc922b8894200a0522dcb04211c469ec
commit: 1d9d3192c3a2b90a68a3ebe4a9b5b0fa27af0b9e [1/1] BACKPORT: locking/local_lock, mm: replace localtry_ helpers with local_trylock_t type
config: arm-randconfig-001-20260516 (https://download.01.org/0day-ci/archive/20260516/202605161321.ClYlzI5Y-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605161321.ClYlzI5Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605161321.ClYlzI5Y-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/blk-crypto.h:127,
                    from include/linux/blk-crypto-profile.h:10,
                    from include/linux/mmc/host.h:19,
                    from drivers/mmc/host/mmci.c:23:
   include/linux/blkdev.h:1830:24: error: field 'req_list' has incomplete type
    1830 |         struct rq_list req_list;
         |                        ^~~~~~~~
   In file included from <command-line>:
   drivers/mmc/host/mmci.c: In function 'mmci_probe':
>> include/linux/compiler.h:166:45: error: '__UNIQUE_ID_y_348' undeclared (first use in this function); did you mean '__UNIQUE_ID_x_347'?
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:528:23: note: in definition of macro '__compiletime_assert'
     528 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:548:9: note: in expansion of macro '_compiletime_assert'
     548 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:49:25: note: in expansion of macro 'is_signed_type'
      49 | #define __sign_use(ux) (is_signed_type(typeof(ux)) ? \
         |                         ^~~~~~~~~~~~~~
   include/linux/minmax.h:75:27: note: in expansion of macro '__sign_use'
      75 |         (__sign_use(ux) & __sign_use(uy))
         |                           ^~~~~~~~~~
   include/linux/minmax.h:93:27: note: in expansion of macro '__types_ok'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:97:22: note: in expansion of macro '___PASTE'
      97 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:97:22: note: in expansion of macro '___PASTE'
      97 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/minmax.h:98:55: note: in expansion of macro '__UNIQUE_ID'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |                                                       ^~~~~~~~~~~
   include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   drivers/mmc/host/mmci.c:2333:40: note: in expansion of macro 'min'
    2333 |                                 fmax : min(host->mclk, fmax);
         |                                        ^~~
   include/linux/compiler.h:166:45: note: each undeclared identifier is reported only once for each function it appears in
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:528:23: note: in definition of macro '__compiletime_assert'
     528 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:548:9: note: in expansion of macro '_compiletime_assert'
     548 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:49:25: note: in expansion of macro 'is_signed_type'
      49 | #define __sign_use(ux) (is_signed_type(typeof(ux)) ? \
         |                         ^~~~~~~~~~~~~~
   include/linux/minmax.h:75:27: note: in expansion of macro '__sign_use'
      75 |         (__sign_use(ux) & __sign_use(uy))
         |                           ^~~~~~~~~~
   include/linux/minmax.h:93:27: note: in expansion of macro '__types_ok'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:97:22: note: in expansion of macro '___PASTE'
      97 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:29: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:97:22: note: in expansion of macro '___PASTE'
      97 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/minmax.h:98:55: note: in expansion of macro '__UNIQUE_ID'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |                                                       ^~~~~~~~~~~
   include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   drivers/mmc/host/mmci.c:2333:40: note: in expansion of macro 'min'
    2333 |                                 fmax : min(host->mclk, fmax);
         |                                        ^~~
   include/linux/minmax.h:71:17: error: first argument to '__builtin_choose_expr' not a constant
      71 |         (typeof(__builtin_choose_expr(sizeof(ux) > 4, 1LL, 1L)))(ux) >= 0)
         |                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:528:23: note: in definition of macro '__compiletime_assert'
     528 |                 if (!(condition))                                       \

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [m]:
   - INTEL_MEI_PXP [=m] && (DRM_I915 [=n] || DRM_XE [=m])


vim +166 include/linux/compiler.h

fe8c8a126806fea Cesar Eduardo Barros 2013-11-25  165  
a8306f2d4dcea03 Nick Desaulniers     2023-08-31 @166  #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
6f33d58794ef4ce Rusty Russell        2012-11-22  167  

:::::: The code at line 166 was first introduced by commit
:::::: a8306f2d4dcea03538c70c26d2948483f70254ff compiler.h: unify __UNIQUE_ID

:::::: TO: Nick Desaulniers <ndesaulniers@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
