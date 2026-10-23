Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758545;
	b=RG6cX2Y9AayNLkFlZihejg1EP85/DOb5H8D13CoKq2FmV8JjhnlVTtDZn0eZdp/zNZt3
	 wWjg4GlcmDd4X81+uYA4iNSBNNN8Rkat+TgwgyXrTgVDT4tAESiirwvai9ABCbhH5GtwM
	 BSKVZtZIfIkZcFX3CHtSRDClo4KbbI+SOLlQD+23S4viEiQTLlUGW3d9j/ZU6OQ/z6A50
	 hoAGFmm2QNHPNFgcUTiTli4lgZ5PLICUjmrr2rI1Omsyn300Axyg07KwEkH3kTQxl3YoJ
	 B32Yn86xEPjcixTAKTc0rr+VoJZWo1iK95t8py2Emh12Lw6XurZedgeZyAOqxcDx72A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758545;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=sWiVfmFlzSHUMfPEz6MXQt/FlCMME9oC7w/RATPd4Yc=;
	b=RsUIUDZuMZBR1h+nA4TbE5SOsnN7WZIYE2cidFCQlG5hqHENUcSIns8qDomxngszUVyR
	 J0VCdxYQ5uBXH0d/ULAQxdRsNcBGGg572xXxe3JMT7FDCU8Oy/hYaL8acQlNUQ97osQHJ
	 zfz95aCDP8W9Q6jm6fM8JnOape7tDf9T1eEOYac2OMHrGPq7vWOU5M/nQ2IFNWHmlJokr
	 ofrLiuYCMsD9MpDriOmHRYV28NaBskLf2yffBZgH7hRyLFO5BbhKVpWcoCVbuSDrTIOLZ
	 m0qqLuhYs2s1LTaYnl/5ZT44WWyVI28O/zn7okLFsKENCfNFrMOaTszmA+6PUu/FRSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dZCcQYD2;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B08E606A31B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Oct 2026 12:29:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B08E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dZCcQYD2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792758543; x=1824294543;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=8g01GWd7k5DSJehSsgqT2VhB8q2dcU+6hXyBej9MeGE=;
  b=dZCcQYD2rJpnamAlNwSbeSAXmcVzh/MTek7ZSgna6KotUYyew8sRtpB/
   JP8QXQoq7REJbOaahIB26mZT2wN/tKhRPqxN4m9hJPM5CXsIivqqdldSN
   9XL/ktdvmbChHs4W7Ok7pUTyOgD+n+Chp7TgRp5ThPZ4K0/di/UMJz4HF
   so1LXUBkqvWU4+cG0NPNnoCTrK9BWDGib14AE3s3I3zfpqBAfSIxAfLIS
   qhj1LQUDZMJfI7BEI8mHIoo7lbK9LkrPe9xp4hMA8WiG44cxKGZuPE9H8
   fHr+VcCXAhYVHJ5n0EjW8O0srYRmBHA5bcC7jRRMGOsfso5zSe03OItcW
   w==;
X-CSE-ConnectionGUID: zYlSo2btTx6piUQKyBz2/Q==
X-CSE-MsgGUID: gw7jR9DYRcirgS9tGmntDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1529829"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1529829"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 05:29:03 -0700
X-CSE-ConnectionGUID: HfDpaXQ0SN6aHKE5JBJN5A==
X-CSE-MsgGUID: H8syvRFYRAmW/LILrCALyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3526101"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 23 Oct 2026 05:29:02 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKEOJ-000000000c7-24Xa;
	Fri, 23 Oct 2026 12:28:59 +0000
Date: Fri, 23 Oct 2026 14:28:55 +0200
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.3/mglru-fg-v4 29/31]
 include/linux/compiler_types.h:702:38: error: call to
 '__compiletime_assert_825' declared with attribute error: min(refs,
 (((((1UL))) << (({ __auto_type __UNIQUE_ID_x__820 = (1); __auto_type
 __UNIQUE_ID_y__821 = (64 - 23 - 2 - 3 - 0 - 8 - 0 - 0); do { __a...
Message-ID: <202610231415.t8bDBPBH-lkp@intel.com>
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
config: powerpc64-randconfig-2001-20261022 (https://download.01.org/0day-ci=
/archive/20261023/202610231415.t8bDBPBH-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261023/202610231415.t8bDBPBH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610231415.t8bDBPBH-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   mm/vmscan.c: In function 'folio_inc_lru_refs':
   include/linux/compiler_types.h:702:38: error: call to '__compiletime_ass=
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
   mm/vmscan.c:952:10: note: in expansion of macro 'min'
      refs =3D min(refs, LRU_REFS_MAX);
             ^~~
   In function 'folio_inc_lru_refs_walk',
       inlined from 'walk_update_folio' at mm/vmscan.c:3790:13:
>> include/linux/compiler_types.h:702:38: error: call to '__compiletime_ass=
ert_825' declared with attribute error: min(refs, (((((1UL))) << (({ __auto=
_type __UNIQUE_ID_x__820 =3D (1); __auto_type __UNIQUE_ID_y__821 =3D (64 - =
23 - 2 - 3 - 0 - 8 - 0 - 0); do { __attribute__((__noreturn__)) extern void=
 __compiletime_assert_822(void) __attribute__((__error__("min""(""1"", ""64=
 - 23 - 2 - 3 - 0 - 8 - 0 - 0"") signedness error"))); if (!(!(!(((((typeof=
(__UNIQUE_ID_x__820))(-1)) < ( typeof(__UNIQUE_ID_x__820))1) ? (2 + (__buil=
tin_constant_p((long long)(__UNIQUE_ID_x__820) >=3D 0) && ((long long)(__UN=
IQUE_ID_x__820) >=3D 0))) : (1 + 2 * (sizeof(__UNIQUE_ID_x__820) < 4))) & (=
(((typeof(__UNIQUE_ID_y__821))(-1)) < ( typeof(__UNIQUE_ID_y__821))1) ? (2 =
+ (__builtin_constant_p((long long)(__UNIQUE_ID_y__821) >=3D 0) && ((long l=
ong)(__UNIQUE_ID_y__821) >=3D 0))) : (1 + 2 * (sizeof(__UNIQUE_ID_y__821) <=
 4))))))) __compiletime_assert_822(); } while (0); ((__UNIQUE_ID_x__820) < =
(__UNIQUE_ID_y__821) ? (__UNIQUE_ID_x__820) : (__UNIQUE_ID_y__821)); }) + 2=
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
