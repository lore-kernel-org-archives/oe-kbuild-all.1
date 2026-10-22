Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792697112;
	b=okO2yKOSeLYjMda6mTPCtZOp+lqMZorG89ezoM/tl0T3+Le1Cfk/pgCoXGuLaZBS0keg
	 uqIe5nzrUzxi5whixMtMsZrNkBxr/LFFTmduSd2Ctcm8CfzVgZBtdH4MZ4rDfYLfoYSRn
	 EhnjIsD+kq+cinEMn3XFNcW21NYlheBM15fykqDZWA4/5y8YZD1BbSydK81YT2UdymQiY
	 glB6raROm75wvFMAjRi4bqKj43TUeW+yYK+jikyaM0BVx467W+bx3TNR41T/rsyvAwX9y
	 aLlGzUvlTBckjJ+m9ZOqyOuo/TzevraAOS3IUTa2NzQfyDu+n76MENx2EQ1bAR7nqnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792697112;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=yU2Wd/OSiKBHGJhpIyfr5K43hGpvQsw+3rtjBCGw/d0=;
	b=TrzZZmUuPeiBglIiiSApBXTrUI0VK3/CVf8yO69QqE/VxYcFDXBCziBe6O5a19Atr6EQ
	 cJ6MkmMBPx8nq4Qa/lxFP++4E8eIbdrWRAT7O0KLl9jWSAlfX07HrPLlHvxQBdT5wnGLs
	 h21cWUpUiRBQt6nfv26lUIU77n3YwFQ0FVKxZcxGExKhbBV57EvQk0i8d0rxEJHCFApOy
	 eRykoLLR6FU2Fq9SmKi7qXcYVZ6R7cvsN0ao7vCTivyVi/gFhdZq/d2FvJnnFssTYgwfA
	 TV2mRfF0yi3LLtbg+LfQ9M4GyUy4oXKuBN2CIMh8sMGli7NXOIcf59c2sDDqfy478DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AboJhZ6v;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04569606A319
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Oct 2026 19:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04569606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AboJhZ6v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792697111; x=1824233111;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=eAp9gljk4UybR/oNh7U9uQkDVNeAKHsQqNAtuM2ETuU=;
  b=AboJhZ6vLNEyeIAmLiGbMKOJHzf685zICMEOlC5+qZSIGvavdZfprghI
   RKuP/sBD1ZPFMQqR5rWzLYBA905M8nmAhXS0FNW+l0gdzzsWXjlaDbO61
   3wh5GqHFTxTR/gdeEG11OqP6ZKOEZHw2NPo9Mxty2CVUTjKLHEiRab2ik
   S6N8aA5ZpcVt5hQ4asipimK0lnzloUaP/NcqvhEQ2ONbgmwiBuyRpMJkV
   BBM0m4oO79/W4cJ2KqJirJsvA+5CiqU5LGHv9IUYiYXgj9IPeow1OkVeZ
   ChlxoV8yziwPLfu4UrbbA01J2pOSdenKqqT7/ftNzjX5erXmPSCseyPH8
   A==;
X-CSE-ConnectionGUID: SHRM+q7hRSa77nLV4MxyOA==
X-CSE-MsgGUID: 5Gi4BfSlRyepYRURVoYX7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1492868"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1492868"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 12:25:10 -0700
X-CSE-ConnectionGUID: tR7lYt9RThKX6ygIbL+O9g==
X-CSE-MsgGUID: TtqtRkSFS+mUDkinC5i96A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3311591"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 22 Oct 2026 12:25:09 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJyPS-000000000O3-3sfZ;
	Thu, 22 Oct 2026 19:25:06 +0000
Date: Thu, 22 Oct 2026 21:24:47 +0200
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.3/mglru-fg-v4 27/31]
 include/linux/compiler_types.h:702:38: error: call to
 '__compiletime_assert_811' declared with attribute error: min(refs,
 (((((1UL))) << (({ __auto_type __UNIQUE_ID_x__806 = (1); __auto_type
 __UNIQUE_ID_y__807 = (64 - 23 - 2 - 3 - 0 - 8 - 0 - 0); do { __a...
Message-ID: <202610222150.j5vZXFfl-lkp@intel.com>
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
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/zen-kernel/zen-kernel 7.3/mglru-fg-v4
head:   5bcfc49e533b1f416d1ca87f1de9093990df777b
commit: 6d374f1c0995a0c5775d1a47e8c93e880ad4c6ff [27/31] mm/mglru: folio LR=
U refs based active/inactive number accounting
config: powerpc64-randconfig-2001-20261022 (https://download.01.org/0day-ci=
/archive/20261022/202610222150.j5vZXFfl-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261022/202610222150.j5vZXFfl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610222150.j5vZXFfl-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   mm/vmscan.c: In function 'folio_inc_lru_refs':
>> include/linux/compiler_types.h:702:38: error: call to '__compiletime_ass=
ert_811' declared with attribute error: min(refs, (((((1UL))) << (({ __auto=
_type __UNIQUE_ID_x__806 =3D (1); __auto_type __UNIQUE_ID_y__807 =3D (64 - =
23 - 2 - 3 - 0 - 8 - 0 - 0); do { __attribute__((__noreturn__)) extern void=
 __compiletime_assert_808(void) __attribute__((__error__("min""(""1"", ""64=
 - 23 - 2 - 3 - 0 - 8 - 0 - 0"") signedness error"))); if (!(!(!(((((typeof=
(__UNIQUE_ID_x__806))(-1)) < ( typeof(__UNIQUE_ID_x__806))1) ? (2 + (__buil=
tin_constant_p((long long)(__UNIQUE_ID_x__806) >=3D 0) && ((long long)(__UN=
IQUE_ID_x__806) >=3D 0))) : (1 + 2 * (sizeof(__UNIQUE_ID_x__806) < 4))) & (=
(((typeof(__UNIQUE_ID_y__807))(-1)) < ( typeof(__UNIQUE_ID_y__807))1) ? (2 =
+ (__builtin_constant_p((long long)(__UNIQUE_ID_y__807) >=3D 0) && ((long l=
ong)(__UNIQUE_ID_y__807) >=3D 0))) : (1 + 2 * (sizeof(__UNIQUE_ID_y__807) <=
 4))))))) __compiletime_assert_808(); } while (0); ((__UNIQUE_ID_x__806) < =
(__UNIQUE_ID_y__807) ? (__UNIQUE_ID_x__806) : (__UNIQUE_ID_y__807)); }) + 2=
)) - 1)) signedness error
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:683:4: note: in definition of macro '__co=
mpiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:702:2: note: in expansion of macro '_comp=
iletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletim=
e_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:2: note: in expansion of macro 'BUILD_BUG_ON_M=
SG'
     BUILD_BUG_ON_MSG(!__types_ok(ux, uy),  \
     ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:98:2: note: in expansion of macro '__careful_cmp_=
once'
     __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:105:19: note: in expansion of macro '__careful_cm=
p'
    #define min(x, y) __careful_cmp(min, x, y)
                      ^~~~~~~~~~~~~
   mm/vmscan.c:951:10: note: in expansion of macro 'min'
      refs =3D min(refs, LRU_REFS_MAX);
             ^~~
   In function 'folio_inc_lru_refs_walk',
       inlined from 'walk_update_folio' at mm/vmscan.c:3775:13:
   include/linux/compiler_types.h:702:38: error: call to '__compiletime_ass=
ert_824' declared with attribute error: min(refs, (((((1UL))) << (({ __auto=
_type __UNIQUE_ID_x__819 =3D (1); __auto_type __UNIQUE_ID_y__820 =3D (64 - =
23 - 2 - 3 - 0 - 8 - 0 - 0); do { __attribute__((__noreturn__)) extern void=
 __compiletime_assert_821(void) __attribute__((__error__("min""(""1"", ""64=
 - 23 - 2 - 3 - 0 - 8 - 0 - 0"") signedness error"))); if (!(!(!(((((typeof=
(__UNIQUE_ID_x__819))(-1)) < ( typeof(__UNIQUE_ID_x__819))1) ? (2 + (__buil=
tin_constant_p((long long)(__UNIQUE_ID_x__819) >=3D 0) && ((long long)(__UN=
IQUE_ID_x__819) >=3D 0))) : (1 + 2 * (sizeof(__UNIQUE_ID_x__819) < 4))) & (=
(((typeof(__UNIQUE_ID_y__820))(-1)) < ( typeof(__UNIQUE_ID_y__820))1) ? (2 =
+ (__builtin_constant_p((long long)(__UNIQUE_ID_y__820) >=3D 0) && ((long l=
ong)(__UNIQUE_ID_y__820) >=3D 0))) : (1 + 2 * (sizeof(__UNIQUE_ID_y__820) <=
 4))))))) __compiletime_assert_821(); } while (0); ((__UNIQUE_ID_x__819) < =
(__UNIQUE_ID_y__820) ? (__UNIQUE_ID_x__819) : (__UNIQUE_ID_y__820)); }) + 2=
)) - 1)) signedness error
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:683:4: note: in definition of macro '__co=
mpiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:702:2: note: in expansion of macro '_comp=
iletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletim=
e_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:2: note: in expansion of macro 'BUILD_BUG_ON_M=
SG'
     BUILD_BUG_ON_MSG(!__types_ok(ux, uy),  \
     ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:98:2: note: in expansion of macro '__careful_cmp_=
once'
     __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:105:19: note: in expansion of macro '__careful_cm=
p'
    #define min(x, y) __careful_cmp(min, x, y)
                      ^~~~~~~~~~~~~
   mm/vmscan.c:1053:16: note: in expansion of macro 'min'
       *new_refs =3D min(refs, LRU_REFS_MAX);
                   ^~~


vim +702 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  688 =20
eb5c2d4b45e3d2 Will Deacon 2020-07-21  689  #define _compiletime_assert(con=
dition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  690  	__compiletime_assert(condition=
, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  691 =20
eb5c2d4b45e3d2 Will Deacon 2020-07-21  692  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  693   * compiletime_assert - break b=
uild and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  694   * @condition: a compile-time c=
onstant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  695   * @msg:       a message to emi=
t if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  696   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  697   * In tradition of POSIX assert=
, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  698   * supplied condition is *false=
*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  699   * compiler has support to do s=
o.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  700   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  701  #define compiletime_assert(cond=
ition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @702  	_compiletime_assert(condition,=
 msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  703 =20

:::::: The code at line 702 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletim=
e_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
