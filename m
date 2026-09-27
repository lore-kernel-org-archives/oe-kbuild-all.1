Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5943C10B2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 22:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790548437; cv=none; b=XtFEMF605SqeAe2sspXQU0VneTLo7+WSK0uovJlj0KAdY3ZV3smB+fpWxHK9OXx1x4//giYo3XDHQ9SUXwjeMgzhRMO4bhpkChaefQeSEKNN3WKYcN0qn/ZHOJQkE9jItgYyKqgJHDiTjUDSrAFn9Qj6JLNTOJuZs7NJjQD8FhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790548437; c=relaxed/simple;
	bh=uP9eExfkQbPJmAXwh0yD2mmnq0I77mWIJ1VnI/FVyR8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CjljcnQ+o8XhdLVdn1e8drByIAGbfvev7A+lpqDW5JtbPKJbNcfKoqjFdkyqxAvks+XI3POUF6btNsSo2Ir/BnUbAliWQN/RG9o9lgKzUJTSXJE305uJ4IcOuN0ygpCy8ddPaRCqAt8PjtM/UJXxL25g0Ghb5ZvEr1s3Bq/HxLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YCF7t4ti; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YCF7t4ti"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790548434; x=1822084434;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=uP9eExfkQbPJmAXwh0yD2mmnq0I77mWIJ1VnI/FVyR8=;
  b=YCF7t4ticcrioZ5kJSgo9jIL6iLTpbaTyy7Fhtj7979wnZ0Z+M93/ViZ
   Jl1uXBhSiw7SB7jPqz1T/uUfRwy0Em5WWJlwcwr6E7WKRZ4Y5XgkQJuOU
   zMZrrn1nqcLemaV3XhqTqIMAIHJv+A9ohpOMHTs4RlLB8rxEczMafL5bL
   e523w0bJ5Xgtau5JvjDDXbqkOYklDsL5D1Z05xxfsjIW30sw2+rV+MroW
   Yz8qXKJHseNL26pY/pPzJhhnGLQwUIgK636gyr8abf2owd6Q62KzoRmSv
   G37798sh7Ip+n2gAIW21NqI1kRnQPhD4KX9zWptBv2ZolVc7B9zNHkui4
   w==;
X-CSE-ConnectionGUID: IPMD/y8KQ4SLAbJNxhvrow==
X-CSE-MsgGUID: JoDxo4R+TLaVw0lLqiYDlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="90012968"
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="90012968"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 15:33:54 -0700
X-CSE-ConnectionGUID: bEjcO5KqSzqENt/zvJOv7w==
X-CSE-MsgGUID: cla0S51TSYemu+4ojoRwgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="302829073"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Sep 2026 15:33:53 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAxRO-00000000NE6-2Dm4;
	Sun, 27 Sep 2026 22:33:50 +0000
Date: Mon, 28 Sep 2026 06:33:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-timens-conditional 12/12]
 arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c:483:10: error:
 implicit declaration of function 'clock_getres_fallback'; did you mean
 'clock_getres32_fallback'?
Message-ID: <202609280633.sTt8J382-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/vdso-timens-conditional
head:   dbe6d2a5ee3233a9e819a0663236161d27841d5a
commit: dbe6d2a5ee3233a9e819a0663236161d27841d5a [12/12] VDSO_HAS_CLOCK_GET=
RES
config: sparc64-randconfig-1000-20260928 (https://download.01.org/0day-ci/a=
rchive/20260928/202609280633.sTt8J382-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260928/202609280633.sTt8J382-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609280633.sTt8J382-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   In file included from arch/sparc/vdso/vclock_gettime.c:22:
   arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c: In function=
 '__cvdso_clock_getres_data':
>> arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c:483:10: erro=
r: implicit declaration of function 'clock_getres_fallback'; did you mean '=
clock_getres32_fallback'? [-Werror=3Dimplicit-function-declaration]
      return clock_getres_fallback(clock, res);
             ^~~~~~~~~~~~~~~~~~~~~
             clock_getres32_fallback
   cc1: some warnings being treated as errors
--
   In file included from arch/sparc/vdso/vdso32/../vclock_gettime.c:22,
                    from arch/sparc/vdso/vdso32/vclock_gettime.c:22:
   arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c: In function=
 '__cvdso_clock_getres_data':
   arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c:483:10: erro=
r: implicit declaration of function 'clock_getres_fallback'; did you mean '=
clock_gettime_fallback'? [-Werror=3Dimplicit-function-declaration]
      return clock_getres_fallback(clock, res);
             ^~~~~~~~~~~~~~~~~~~~~
             clock_gettime_fallback
   arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c: In function=
 '__cvdso_clock_getres_time32_data':
>> arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c:505:10: erro=
r: implicit declaration of function 'clock_getres32_fallback'; did you mean=
 'clock_gettime32_fallback'? [-Werror=3Dimplicit-function-declaration]
      return clock_getres32_fallback(clock, res);
             ^~~~~~~~~~~~~~~~~~~~~~~
             clock_gettime32_fallback
   cc1: some warnings being treated as errors


vim +483 arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c

502a590a170b3b Thomas Gleixner   2019-07-28  473 =20
08cd5e1de81584 Thomas Wei=C3=9Fschuh  2026-02-27  474  static
ac1a42f4e4e296 Thomas Wei=C3=9Fschuh  2025-02-04  475  int __cvdso_clock_ge=
tres_data(const struct vdso_time_data *vd, clockid_t clock,
e876f0b69dc993 Christophe Leroy  2020-02-07  476  			      struct __kernel_=
timespec *res)
502a590a170b3b Thomas Gleixner   2019-07-28  477  {
34f888e3405ace Thomas Wei=C3=9Fschuh  2025-07-01  478  	bool ok;
00b26474c2f161 Vincenzo Frascino 2019-06-21  479 =20
34f888e3405ace Thomas Wei=C3=9Fschuh  2025-07-01  480  	ok =3D  __cvdso_clo=
ck_getres_common(vd, clock, res);
34f888e3405ace Thomas Wei=C3=9Fschuh  2025-07-01  481 =20
34f888e3405ace Thomas Wei=C3=9Fschuh  2025-07-01  482  	if (unlikely(!ok))
00b26474c2f161 Vincenzo Frascino 2019-06-21 @483  		return clock_getres_fal=
lback(clock, res);
502a590a170b3b Thomas Gleixner   2019-07-28  484  	return 0;
00b26474c2f161 Vincenzo Frascino 2019-06-21  485  }
00b26474c2f161 Vincenzo Frascino 2019-06-21  486 =20
e876f0b69dc993 Christophe Leroy  2020-02-07  487  static __maybe_unused
e876f0b69dc993 Christophe Leroy  2020-02-07  488  int __cvdso_clock_getres(=
clockid_t clock, struct __kernel_timespec *res)
e876f0b69dc993 Christophe Leroy  2020-02-07  489  {
df7fcbefa71090 Thomas Wei=C3=9Fschuh  2025-02-04  490  	return __cvdso_cloc=
k_getres_data(__arch_get_vdso_u_time_data(), clock, res);
e876f0b69dc993 Christophe Leroy  2020-02-07  491  }
e876f0b69dc993 Christophe Leroy  2020-02-07  492 =20
08cd5e1de81584 Thomas Wei=C3=9Fschuh  2026-02-27  493  static int
ac1a42f4e4e296 Thomas Wei=C3=9Fschuh  2025-02-04  494  __cvdso_clock_getres=
_time32_data(const struct vdso_time_data *vd, clockid_t clock,
e876f0b69dc993 Christophe Leroy  2020-02-07  495  				 struct old_timespec3=
2 *res)
00b26474c2f161 Vincenzo Frascino 2019-06-21  496  {
00b26474c2f161 Vincenzo Frascino 2019-06-21  497  	struct __kernel_timespec=
 ts;
34f888e3405ace Thomas Wei=C3=9Fschuh  2025-07-01  498  	bool ok;
00b26474c2f161 Vincenzo Frascino 2019-06-21  499 =20
369cecd238ac83 Thomas Wei=C3=9Fschuh  2026-07-02  500  	BUILD_BUG_ON(!IS_EN=
ABLED(CONFIG_COMPAT_32BIT_TIME));
369cecd238ac83 Thomas Wei=C3=9Fschuh  2026-07-02  501 =20
34f888e3405ace Thomas Wei=C3=9Fschuh  2025-07-01  502  	ok =3D __cvdso_cloc=
k_getres_common(vd, clock, &ts);
c60a32ea4f459f Thomas Gleixner   2019-07-30  503 =20
34f888e3405ace Thomas Wei=C3=9Fschuh  2025-07-01  504  	if (unlikely(!ok))
c60a32ea4f459f Thomas Gleixner   2019-07-30 @505  		return clock_getres32_f=
allback(clock, res);
00b26474c2f161 Vincenzo Frascino 2019-06-21  506 =20
a279235ddbe975 Vincenzo Frascino 2019-08-30  507  	if (likely(res)) {
00b26474c2f161 Vincenzo Frascino 2019-06-21  508  		res->tv_sec =3D ts.tv_s=
ec;
00b26474c2f161 Vincenzo Frascino 2019-06-21  509  		res->tv_nsec =3D ts.tv_=
nsec;
00b26474c2f161 Vincenzo Frascino 2019-06-21  510  	}
34f888e3405ace Thomas Wei=C3=9Fschuh  2025-07-01  511  	return 0;
00b26474c2f161 Vincenzo Frascino 2019-06-21  512  }
e876f0b69dc993 Christophe Leroy  2020-02-07  513 =20

:::::: The code at line 483 was first introduced by commit
:::::: 00b26474c2f1613d7ab894c525f775c67c8a9e8f lib/vdso: Provide generic V=
DSO implementation

:::::: TO: Vincenzo Frascino <vincenzo.frascino@arm.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
