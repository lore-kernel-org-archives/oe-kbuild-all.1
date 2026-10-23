Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792731156;
	b=kj+wQ5iAeiJqroQ5hR/2v0KNQF6EVpz5fjqtJNzj8q7Up9fGAkDuG3U6tT1dkaYCpxKc
	 +q5wyFULI6nl6pC1m8LDxW7lzCqukJMKDd3GV+ZsNbSN07fRHImpm1Dw+uE4sEnvLkEKE
	 7Sqg8KAZBrEVTg4k1WntGmO2mR/tdqhwkUB+0NLfbqRjxS0fO7+VW4WJGyunlZs3jdoku
	 NMOT6RLUoOdWYV3kT5XqDmydvI66wWF8+z7tV9e8gh0SL1K+f9wq5/4OfoWb0ALy++wgs
	 +dKj7ZaQP6AthYkgzpmGZVJPIguPDQ0TnIzHmMCXslxdlyRAT9Ax5v1C6RZsWkSGwaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792731156;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=j7smt9a3HeTm07E9N66TbD4N4zmyBNjOqexGnkH8Y1Q=;
	b=StSqdkQBz9Bmmcpip2DdvzE4CkIyH1cAQDmDKW/B24QOyBS26bqSB2vOHiqoDDJAuQQz
	 K0VVo465tIyPIue7vq/LBFVboWYpL9/BAqEgimDl22/dy5HqtD8MZjDPcTIXw+3McNR1n
	 JdUyZEARdhuOjCkyEpfCilJSABYvVzNFNvQ/vuvOv/f11srBUPEk8ylr7N15mLN09qB2w
	 UjrPAaSEnk4ZDhWLTKqOZ0XbylCTZxkqHzXQk/v4c+wfrGDTvl/L1klvoj76gjoCbIlV8
	 RjdzfE2cTfjaBxNqLKYTX/EiQiwt06m3itB76eNI7wNqG7G6ISZ95/F549mKgyLz4RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eiI6Hc4l;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898BC606A31A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Oct 2026 04:52:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 898BC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eiI6Hc4l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792731153; x=1824267153;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+B48iumM2KUcIWyjf2nZM61sRrHcdWJzhfWqo1k5Z94=;
  b=eiI6Hc4lGop/aq7Ep8PZeX1kS9259DIbI4aVgd+6VrsKqvmfmEYk1XYs
   SfoviQndBhXQFzizxQ7W0rDiVsdprKUjxd6yc8SaFYdx2tE6XBLcbpvOx
   vpCz4Sv8yC7pLlQn4P2cH31sGNRxy70dt3bD4scyoggmm5dVRn3PfF64P
   8oLCNUFZLOtA+R4SJr9UgJmsJTW9jsk2EQMec3/8RnwULrTUwMvowdHod
   G8HpnbzLiuhhKX43PigSScg+s25xQwV7Ha+Zu1ND1UiEUYuBzM6HnM3qn
   Kat04anj4eF+benU1XKp98isbOxEjPIWYL34XbH3bU8YSsSiPtp9FHfMF
   w==;
X-CSE-ConnectionGUID: OJQaDGliQ5q9bHMXvjWdwg==
X-CSE-MsgGUID: 8FCz06GiSfGTFvlmhcpCDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1382101"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1382101"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 21:52:32 -0700
X-CSE-ConnectionGUID: oqfKrh4pRguc2lSoc0waqw==
X-CSE-MsgGUID: oWFZqr50QX+CMB+LcowXjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3484051"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 22 Oct 2026 21:52:31 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xK7GW-000000000WB-33wp;
	Fri, 23 Oct 2026 04:52:28 +0000
Date: Fri, 23 Oct 2026 06:51:54 +0200
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.3/mglru-fg-v4 21/31]
 include/linux/compiler_types.h:702:45: error: call to
 '__compiletime_assert_517' declared with attribute error: min(refs,
 (((((1UL))) << (({ __auto_type __UNIQUE_ID_x__512 = (1); __auto_type
 __UNIQUE_ID_y__513 = (32 - 21 - 1 - 3 - 0 - 0 - 0 - 0); do { __a...
Message-ID: <202610230646.yDGrRBuZ-lkp@intel.com>
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
commit: 2db1a6c8be9d003bc549e3f4f312fb144a064b1a [21/31] mm/mglru, gup: mar=
k folios referenced via a fast helper
config: parisc-randconfig-2000-20261023 (https://download.01.org/0day-ci/ar=
chive/20261023/202610230646.yDGrRBuZ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261023/202610230646.yDGrRBuZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610230646.yDGrRBuZ-lkp@i=
ntel.com/

Note: the zen/7.3/mglru-fg-v4 HEAD 5bcfc49e533b1f416d1ca87f1de9093990df777b=
 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   include/linux/mm_inline.h: In function 'lru_tier_from_refs':
   include/linux/compiler_types.h:702:45: error: call to '__compiletime_ass=
ert_377' declared with attribute error: BUILD_BUG_ON failed: fls(LRU_REFS_M=
AX - 1) > MAX_NR_TIERS - 1
     702 |         _compiletime_assert(condition, msg, __compiletime_assert=
_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:683:25: note: in definition of macro '__c=
ompiletime_assert'
     683 |                         prefix ## suffix();                     =
        \
         |                         ^~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_comp=
iletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert=
_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletim=
e_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), =
msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:9: note: in expansion of macro 'BUILD_BUG_O=
N_MSG'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #con=
dition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/mm_inline.h:149:9: note: in expansion of macro 'BUILD_BUG_=
ON'
     149 |         BUILD_BUG_ON(fls(LRU_REFS_MAX - 1) > MAX_NR_TIERS - 1);
         |         ^~~~~~~~~~~~
   mm/vmscan.c: In function 'folio_inc_lru_refs_walk.constprop':
>> include/linux/compiler_types.h:702:45: error: call to '__compiletime_ass=
ert_517' declared with attribute error: min(refs, (((((1UL))) << (({ __auto=
_type __UNIQUE_ID_x__512 =3D (1); __auto_type __UNIQUE_ID_y__513 =3D (32 - =
21 - 1 - 3 - 0 - 0 - 0 - 0); do { __attribute__((__noreturn__)) extern void=
 __compiletime_assert_514(void) __attribute__((__error__("min""(""1"", ""32=
 - 21 - 1 - 3 - 0 - 0 - 0 - 0"") signedness error"))); if (!(!(!(((((typeof=
(__UNIQUE_ID_x__512))(-1)) < ( typeof(__UNIQUE_ID_x__512))1) ? (2 + (__buil=
tin_constant_p((typeof(__builtin_choose_expr(sizeof(__UNIQUE_ID_x__512) > 4=
, 1LL, 1L)))(__UNIQUE_ID_x__512) >=3D 0) && ((typeof(__builtin_choose_expr(=
sizeof(__UNIQUE_ID_x__512) > 4, 1LL, 1L)))(__UNIQUE_ID_x__512) >=3D 0))) : =
(1 + 2 * (sizeof(__UNIQUE_ID_x__512) < 4))) & ((((typeof(__UNIQUE_ID_y__513=
))(-1)) < ( typeof(__UNIQUE_ID_y__513))1) ? (2 + (__builtin_constant_p((typ=
eof(__builtin_choose_expr(sizeof(__UNIQUE_ID_y__513) > 4, 1LL, 1L)))(__UNIQ=
UE_ID_y__513) >=3D 0) && ((typeof(__builtin_choose_expr(sizeof(__UNIQUE_ID_=
y__513) > 4, 1LL, 1L)))(__UNIQUE_ID_y__513) >=3D 0))) : (1 + 2 * (sizeof(__=
UNIQUE_ID_y__513) < 4))))))) __compiletime_assert_514(); } while (0); ((__U=
NIQUE_ID_x__512) < (__UNIQUE_ID_y__513) ? (__UNIQUE_ID_x__512) : (__UNIQUE_=
ID_y__513)); }) + 2)) - 1)) signedness error
     702 |         _compiletime_assert(condition, msg, __compiletime_assert=
_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:683:25: note: in definition of macro '__c=
ompiletime_assert'
     683 |                         prefix ## suffix();                     =
        \
         |                         ^~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_comp=
iletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert=
_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletim=
e_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), =
msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_M=
SG'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_=
once'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_I=
D(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cm=
p'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   mm/vmscan.c:1000:56: note: in expansion of macro 'min'
    1000 |                         lru_set_refs_flags(&new_flags, min(refs,=
 LRU_REFS_MAX));
         |                                                        ^~~
   mm/vmscan.c: In function 'folio_inc_lru_refs':
   include/linux/compiler_types.h:702:45: error: call to '__compiletime_ass=
ert_506' declared with attribute error: min(refs, (((((1UL))) << (({ __auto=
_type __UNIQUE_ID_x__501 =3D (1); __auto_type __UNIQUE_ID_y__502 =3D (32 - =
21 - 1 - 3 - 0 - 0 - 0 - 0); do { __attribute__((__noreturn__)) extern void=
 __compiletime_assert_503(void) __attribute__((__error__("min""(""1"", ""32=
 - 21 - 1 - 3 - 0 - 0 - 0 - 0"") signedness error"))); if (!(!(!(((((typeof=
(__UNIQUE_ID_x__501))(-1)) < ( typeof(__UNIQUE_ID_x__501))1) ? (2 + (__buil=
tin_constant_p((typeof(__builtin_choose_expr(sizeof(__UNIQUE_ID_x__501) > 4=
, 1LL, 1L)))(__UNIQUE_ID_x__501) >=3D 0) && ((typeof(__builtin_choose_expr(=
sizeof(__UNIQUE_ID_x__501) > 4, 1LL, 1L)))(__UNIQUE_ID_x__501) >=3D 0))) : =
(1 + 2 * (sizeof(__UNIQUE_ID_x__501) < 4))) & ((((typeof(__UNIQUE_ID_y__502=
))(-1)) < ( typeof(__UNIQUE_ID_y__502))1) ? (2 + (__builtin_constant_p((typ=
eof(__builtin_choose_expr(sizeof(__UNIQUE_ID_y__502) > 4, 1LL, 1L)))(__UNIQ=
UE_ID_y__502) >=3D 0) && ((typeof(__builtin_choose_expr(sizeof(__UNIQUE_ID_=
y__502) > 4, 1LL, 1L)))(__UNIQUE_ID_y__502) >=3D 0))) : (1 + 2 * (sizeof(__=
UNIQUE_ID_y__502) < 4))))))) __compiletime_assert_503(); } while (0); ((__U=
NIQUE_ID_x__501) < (__UNIQUE_ID_y__502) ? (__UNIQUE_ID_x__501) : (__UNIQUE_=
ID_y__502)); }) + 2)) - 1)) signedness error
     702 |         _compiletime_assert(condition, msg, __compiletime_assert=
_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:683:25: note: in definition of macro '__c=
ompiletime_assert'
     683 |                         prefix ## suffix();                     =
        \
         |                         ^~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_comp=
iletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert=
_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletim=
e_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), =
msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_M=
SG'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_=
once'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_I=
D(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cm=
p'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   mm/vmscan.c:949:24: note: in expansion of macro 'min'
     949 |                 refs =3D min(refs, LRU_REFS_MAX);
         |                        ^~~


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
