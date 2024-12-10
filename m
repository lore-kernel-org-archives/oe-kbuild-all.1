Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C1A23DE9F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Dec 2024 10:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.58.85.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733826423; cv=none; b=DPhPfSrRUf7wlwI2hB7S1Ofmxl9WnXeMz05MeeJnWetgavLsFSE7KZjdIOJOtKBmZQl1ZMlRHcJjIMtrojpmXmDvpEnxfXzxOtN8dQy8/pV7GAUH+6thvrR0kwV0ifJ/+FYSMP+iujz2hwGAJ20c+/80zPYEHj/Yrlvgk5m1mIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733826423; c=relaxed/simple;
	bh=bcce9u4ltxZ989fiEq7g7IsEKVuvR6UU8BkYkb3oe1E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=Ox8jCfES4bsFDI11SRJNiJEhdKxrRfMHdDb7PFZQ7g9xH2LbKjvlvAbGtCMA51ZwMBRBzm5yrqS4Q/OKTTt3l5/bfUz6/gDI5Ppumk3kCPJXPW1wQpMzDhnSVIZ2IOcMEpFUvFSAlt8ZCcmSdtIht0zaVBeCUFOPGPTMIhA2Dbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM; spf=pass smtp.mailfrom=aculab.com; arc=none smtp.client-ip=185.58.85.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aculab.com
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-318-T0mdwBzoMZWTGMO_oKF3Ww-1; Tue, 10 Dec 2024 10:26:55 +0000
X-MC-Unique: T0mdwBzoMZWTGMO_oKF3Ww-1
X-Mimecast-MFC-AGG-ID: T0mdwBzoMZWTGMO_oKF3Ww
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Tue, 10 Dec
 2024 10:26:00 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Tue, 10 Dec 2024 10:26:00 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'kernel test robot' <lkp@intel.com>, Jani Nikula
	<jani.nikula@linux.intel.com>, "'jbarnes@virtuousgeek.org'"
	<jbarnes@virtuousgeek.org>, Daniel Vetter <daniel@ffwll.ch>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, "Andrew
 Morton" <akpm@linux-foundation.org>, Linux Memory Management List
	<linux-mm@kvack.org>
Subject: RE: [linux-next:master 2241/2462]
 include/linux/compiler_types.h:542:45: error: call to
 '__compiletime_assert_413' declared with attribute error: clamp() low limit
 source_min greater than high limit source_max
Thread-Topic: [linux-next:master 2241/2462]
 include/linux/compiler_types.h:542:45: error: call to
 '__compiletime_assert_413' declared with attribute error: clamp() low limit
 source_min greater than high limit source_max
Thread-Index: AQHbSp/Lj7Q1RhUWJEeVU9C2tm5C/rLfQkoQ
Date: Tue, 10 Dec 2024 10:26:00 +0000
Message-ID: <dc1d4e0a1d584433b4ec98f3df2c74c7@AcuMS.aculab.com>
References: <202412100848.HfPEKlvV-lkp@intel.com>
In-Reply-To: <202412100848.HfPEKlvV-lkp@intel.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 58u3q6uvEMRdJgslsJoMc2793DsRuB69bjJxgi2FHXk_1733826415
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

>    drivers/gpu/drm/i915/display/intel_backlight.c: In function 'scale':

I think this has been reported before.

The 'problem' is in drivers/gpu/drm/i915/display/intel_backlight.c
The compiler is inlining functions enough to detect a call to clamp()
with min > max.
The error isn't obvious and even the full compiler output doesn't say where
'scale' is being inlined from so it is hard to see why there is a problem.

I'm not in a position to rerun the failing build.
Probably needs rerunning with the lines commented out one by one to see whi=
ch
is responsible.

=09David

> -----Original Message-----
> From: kernel test robot <lkp@intel.com>
> Sent: 10 December 2024 01:07
> To: David Laight <David.Laight@ACULAB.COM>
> Cc: oe-kbuild-all@lists.linux.dev; Andrew Morton <akpm@linux-foundation.o=
rg>; Linux Memory Management
> List <linux-mm@kvack.org>
> Subject: [linux-next:master 2241/2462] include/linux/compiler_types.h:542=
:45: error: call to
> '__compiletime_assert_413' declared with attribute error: clamp() low lim=
it source_min greater than
> high limit source_max
>=20
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   d1486dca38afd08ca279ae94eb3a397f10737824
> commit: 58febb0202b31e9e8d55a603a70f7f131455ef2f [2241/2462] minmax.h: us=
e BUILD_BUG_ON_MSG() for the
> lo < hi test in clamp()
> config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/2024=
1210/202412100848.HfPEKlvV-
> lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-
> ci/archive/20241210/202412100848.HfPEKlvV-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412100848.HfPEKlvV-lkp=
@intel.com/
>=20
> All errors (new ones prefixed by >>):
>=20
>    In file included from <command-line>:
>    drivers/gpu/drm/i915/display/intel_backlight.c: In function 'scale':
> >> include/linux/compiler_types.h:542:45: error: call to '__compiletime_a=
ssert_413' declared with
> attribute error: clamp() low limit source_min greater than high limit sou=
rce_max
>      542 |         _compiletime_assert(condition, msg, __compiletime_asse=
rt_, __COUNTER__)
>          |                                             ^
>    include/linux/compiler_types.h:523:25: note: in definition of macro '_=
_compiletime_assert'
>      523 |                         prefix ## suffix();                   =
          \
>          |                         ^~~~~~
>    include/linux/compiler_types.h:542:9: note: in expansion of macro '_co=
mpiletime_assert'
>      542 |         _compiletime_assert(condition, msg, __compiletime_asse=
rt_, __COUNTER__)
>          |         ^~~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:39:37: note: in expansion of macro 'compilet=
ime_assert'
>       39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond)=
, msg)
>          |                                     ^~~~~~~~~~~~~~~~~~
>    include/linux/minmax.h:109:9: note: in expansion of macro 'BUILD_BUG_O=
N_MSG'
>      109 |         BUILD_BUG_ON_MSG(statically_true(ulo > uhi),          =
                  \
>          |         ^~~~~~~~~~~~~~~~
>    include/linux/minmax.h:116:9: note: in expansion of macro '__clamp_onc=
e'
>      116 |         __clamp_once(val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID=
(l_), __UNIQUE_ID(h_))
>          |         ^~~~~~~~~~~~
>    include/linux/minmax.h:192:28: note: in expansion of macro '__careful_=
clamp'
>      192 | #define clamp(val, lo, hi) __careful_clamp(val, lo, hi)
>          |                            ^~~~~~~~~~~~~~~
>    drivers/gpu/drm/i915/display/intel_backlight.c:47:22: note: in expansi=
on of macro 'clamp'
>       47 |         source_val =3D clamp(source_val, source_min, source_ma=
x);
>          |                      ^~~~~
>=20
>=20
> vim +/__compiletime_assert_413 +542 include/linux/compiler_types.h
>=20
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  528
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  529  #define _compiletime_assert(c=
ondition, msg, prefix,
> suffix) \
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  530  =09__compiletime_assert(condi=
tion, msg, prefix, suffix)
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  531
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  532  /**
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  533   * compiletime_assert - break=
 build and emit msg if
> condition is false
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  534   * @condition: a compile-time=
 constant condition to check
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  535   * @msg:       a message to e=
mit if condition is false
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  536   *
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  537   * In tradition of POSIX asse=
rt, this macro will break the
> build if the
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  538   * supplied condition is *fal=
se*, emitting the supplied
> error message if the
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  539   * compiler has support to do=
 so.
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  540   */
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  541  #define compiletime_assert(co=
ndition, msg) \
> eb5c2d4b45e3d2 Will Deacon 2020-07-21 @542  =09_compiletime_assert(condit=
ion, msg,
> __compiletime_assert_, __COUNTER__)
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  543
>=20
> :::::: The code at line 542 was first introduced by commit
> :::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compilet=
ime_assert() macros into
> compiler_types.h
>=20
> :::::: TO: Will Deacon <will@kernel.org>
> :::::: CC: Will Deacon <will@kernel.org>
>=20
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

