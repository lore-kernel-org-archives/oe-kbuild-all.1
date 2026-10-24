Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792812921;
	b=sB1YzDSXE+2HksxqawdWMc1Tpnlh238VOqRa8Ra+6lvcPmfxG2SSySitGtPsSJWjwPnP
	 T8yhKAva3FgI1/crlW9vqB4tk87NQjssHjcCXoTALG1YhdPpsMofFII/l3/0x2gf3fKRv
	 MHWCtZ5uGbXyMZqHS9aELSkSWXUw7I9ANqjvTP+KF/IEKu4j2aJ+91G01QPk8eN/XnSix
	 v5eHAkuCBM7gxZ+/XDnYVgyuCHnHrfO9A43+Sd+1A6fi90nGLwuvXdq2Az9Si4nuHvM+P
	 uFQQZGet2N1O4tFaTzIjaDM3OrmLdcd2CDZ7uYEBC/N0eGVn0zmNgqFF+MzspFJuogw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792812921;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=IMZV0uM1soWuC/BzPEz0DuZZPFD35v2X6ypcqGJk6u4=;
	b=xYF9TbaEEKoEfxJ6tAD2xgTvEYCQhtg3RFlFuJeAokG9R57yQhDMCQc0CqkbqJxRIqAk
	 lP2oLkQOZ5YIdO27h6XWFiaboUanOCbDQe3SFzsgxXFraYpysIKEjYeLAKb1ko/5Chxdp
	 GCrlzqCaWyIuA7dZfvXs/oB0zjHTYbTwElB99IVlkvDzzZhrxSEcie/5d7aVHjl9p/5XH
	 NU1GrpiUsfJnJEO0igTWet7U75ExRebylmVSoT+gO8yaU9ptwyV/zAfOY7ZvDwOMVZDnO
	 8fGo2hWx1xP/2TPtz+49M/uI+LGbclBiwLezBxuvHdaQEcCXdjRKbEIS2y3O1a4Nqcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S0H1nw4y;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C32606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Oct 2026 03:35:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5C32606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S0H1nw4y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792812919; x=1824348919;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Y9m3N08MjAHIhrzvhXbTcQj5REi3NS3AD0H5oOn8vnk=;
  b=S0H1nw4y6aru/hQ96prCOcaDUx6ldKJMUnUxqVBrASlSi7U5h3T2bxj2
   m9PreLIZrTE/QA6hRly4khvUQ6tNASauuCE+nabr1q/+ONGuffWzEfWHa
   evuiUtZYQdWcHVNXoUruo36lSTbOvO1CgMYOj/TE1/RWFzRrwOK0PMnSj
   0A6zEggoMAZbNJLhc9fJnwvGc5qcCIhaUtYe/5jPxODJR+JXebq1LG+Z4
   CXV/1LC/ey2gFeq3eVbTtV9ydS+/BnIkOBcvNl62CQ3Bd/YJEuQ3StMms
   OtgWY0P+UPOlx32yDE/NSlCNIwus2n2/T2ZUaJeEYslCKyP9udbaatxNn
   g==;
X-CSE-ConnectionGUID: 4PkyIRemQZawbFjPgBUbTA==
X-CSE-MsgGUID: +2afvU7sRfO6LD1338AIBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1443302"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1443302"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 20:35:19 -0700
X-CSE-ConnectionGUID: 7AFJgp42Qe6g+w+PG53YFQ==
X-CSE-MsgGUID: WqMuR5pSQuOOs4NXuDkuiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="4135252"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 23 Oct 2026 20:35:18 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKSXM-000000003Gp-0a5l;
	Sat, 24 Oct 2026 03:35:16 +0000
Date: Sat, 24 Oct 2026 05:34:45 +0200
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.3/mglru-fg-v4 29/31]
 include/linux/compiler_types.h:702:38: error: call to
 '__compiletime_assert_696' declared with attribute error: min(refs,
 (((((1UL))) << (({ __auto_type __UNIQUE_ID_x__691 = (1); __auto_type
 __UNIQUE_ID_y__692 = (64 - 23 - 2 - 3 - 0 - 0 - 0 - 0); do { __a...
Message-ID: <202610240549.wZwGyhZR-lkp@intel.com>
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
commit: 0bb79c27b3df116c04124af95548021cfae9dc89 [29/31] mm/mglru: make fol=
io_inc_lru_refs lruvec lockless
config: alpha-randconfig-r2109-20261023 (https://download.01.org/0day-ci/ar=
chive/20261024/202610240549.wZwGyhZR-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261024/202610240549.wZwGyhZR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610240549.wZwGyhZR-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   mm/vmscan.c: In function 'folio_inc_lru_refs':
   include/linux/compiler_types.h:702:38: error: call to '__compiletime_ass=
ert_682' declared with attribute error: min(refs, (((((1UL))) << (({ __auto=
_type __UNIQUE_ID_x__677 =3D (1); __auto_type __UNIQUE_ID_y__678 =3D (64 - =
23 - 2 - 3 - 0 - 0 - 0 - 0); do { __attribute__((__noreturn__)) extern void=
 __compiletime_assert_679(void) __attribute__((__error__("min""(""1"", ""64=
 - 23 - 2 - 3 - 0 - 0 - 0 - 0"") signedness error"))); if (!(!(!(((((typeof=
(__UNIQUE_ID_x__677))(-1)) < ( typeof(__UNIQUE_ID_x__677))1) ? (2 + (__buil=
tin_constant_p((long long)(__UNIQUE_ID_x__677) >=3D 0) && ((long long)(__UN=
IQUE_ID_x__677) >=3D 0))) : (1 + 2 * (sizeof(__UNIQUE_ID_x__677) < 4))) & (=
(((typeof(__UNIQUE_ID_y__678))(-1)) < ( typeof(__UNIQUE_ID_y__678))1) ? (2 =
+ (__builtin_constant_p((long long)(__UNIQUE_ID_y__678) >=3D 0) && ((long l=
ong)(__UNIQUE_ID_y__678) >=3D 0))) : (1 + 2 * (sizeof(__UNIQUE_ID_y__678) <=
 4))))))) __compiletime_assert_679(); } while (0); ((__UNIQUE_ID_x__677) < =
(__UNIQUE_ID_y__678) ? (__UNIQUE_ID_x__677) : (__UNIQUE_ID_y__678)); }) + 2=
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
   mm/vmscan.c:952:10: note: in expansion of macro 'min'
      refs =3D min(refs, LRU_REFS_MAX);
             ^~~
   In function 'folio_inc_lru_refs_walk.constprop',
       inlined from 'walk_update_folio.constprop' at mm/vmscan.c:3790:13:
>> include/linux/compiler_types.h:702:38: error: call to '__compiletime_ass=
ert_696' declared with attribute error: min(refs, (((((1UL))) << (({ __auto=
_type __UNIQUE_ID_x__691 =3D (1); __auto_type __UNIQUE_ID_y__692 =3D (64 - =
23 - 2 - 3 - 0 - 0 - 0 - 0); do { __attribute__((__noreturn__)) extern void=
 __compiletime_assert_693(void) __attribute__((__error__("min""(""1"", ""64=
 - 23 - 2 - 3 - 0 - 0 - 0 - 0"") signedness error"))); if (!(!(!(((((typeof=
(__UNIQUE_ID_x__691))(-1)) < ( typeof(__UNIQUE_ID_x__691))1) ? (2 + (__buil=
tin_constant_p((long long)(__UNIQUE_ID_x__691) >=3D 0) && ((long long)(__UN=
IQUE_ID_x__691) >=3D 0))) : (1 + 2 * (sizeof(__UNIQUE_ID_x__691) < 4))) & (=
(((typeof(__UNIQUE_ID_y__692))(-1)) < ( typeof(__UNIQUE_ID_y__692))1) ? (2 =
+ (__builtin_constant_p((long long)(__UNIQUE_ID_y__692) >=3D 0) && ((long l=
ong)(__UNIQUE_ID_y__692) >=3D 0))) : (1 + 2 * (sizeof(__UNIQUE_ID_y__692) <=
 4))))))) __compiletime_assert_693(); } while (0); ((__UNIQUE_ID_x__691) < =
(__UNIQUE_ID_y__692) ? (__UNIQUE_ID_x__691) : (__UNIQUE_ID_y__692)); }) + 2=
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
   mm/vmscan.c:1068:16: note: in expansion of macro 'min'
       *new_refs =3D min(refs, LRU_REFS_MAX);
                   ^~~


vim +702 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  688 =20
eb5c2d4b45e3d2d Will Deacon 2020-07-21  689  #define _compiletime_assert(co=
ndition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  690  	__compiletime_assert(conditio=
n, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  691 =20
eb5c2d4b45e3d2d Will Deacon 2020-07-21  692  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  693   * compiletime_assert - break =
build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  694   * @condition: a compile-time =
constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  695   * @msg:       a message to em=
it if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  696   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  697   * In tradition of POSIX asser=
t, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  698   * supplied condition is *fals=
e*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  699   * compiler has support to do =
so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  700   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  701  #define compiletime_assert(con=
dition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @702  	_compiletime_assert(condition=
, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  703 =20

:::::: The code at line 702 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletim=
e_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
