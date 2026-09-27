Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C363346766
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 22:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790547688; cv=none; b=PFDpAn12rNTVSI/01CVepQzy1Fk+wjRMR+cJ9mnXQalgtfT6TrUmXF9eZ0vWgGeZzIkCEQTJZm2phKr6yaGt1ubsiTBW4NeGRjDGS7LefyIfUAAI8MtXtgQVdc3SQYGt1WjktSYZx1WVuBcie8KvW2mmK4peb8kLnXK/3RWThDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790547688; c=relaxed/simple;
	bh=c6LZ09/MTcShZrKtR6QRcpdx5o+Y3FDPdl5bmuzUHXM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=X0xdEKwmuTMJXFSDqO/EtomVjaTGbGkWWJBzbG+Mz60AtaEIuJuM35DpyzgNE2Zi7qmcowMQagdcSLaqKwf5kVfdgoS8A2Hz2K6sX997a3oRIEBf5vMd8Pk9TFxaUhN1Ufl1FmHCHaMgWBu0Q61AuzHdqmhzoQrWZi80L41Lyys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GAusKLMX; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GAusKLMX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790547684; x=1822083684;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=c6LZ09/MTcShZrKtR6QRcpdx5o+Y3FDPdl5bmuzUHXM=;
  b=GAusKLMX3bEuDh8aDRrR0iOqIaiAKNS/RkdWXB1r226SjPuj9ErICW2R
   dhrRg0iTynSGze6/l1J2Ha2Hjjvtov20Fs/nqVMI1iSY1pjfkraSyEy7i
   +HqmR1qJoghX6J55I16KwgFaPPjAFMZEfakRTyfYUlCD1p4sd//8eNpE0
   fJtuYVd39Dm9WqPkE2fTJbwZv6/TTU0YuMj0yBtTiLFJ+rPGgqfDxStM3
   GbN9cRs1+MZ5FMK+Di0l4gE57hCwqeMjjc/sicsaNeWB192ABaHbMm1q3
   b44LviFt1UOBZ0hbcIvADE8TL/ewGgeyf1uI/GwRZj1C+6Z/qJhlRdfS7
   A==;
X-CSE-ConnectionGUID: pMJO6gObQvW/RO32CHPZhA==
X-CSE-MsgGUID: 9QLt/i4qQvuSJmo6NqmK/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="95063856"
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="95063856"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 15:21:23 -0700
X-CSE-ConnectionGUID: Q2arJt4iS6++NDnp/ntsIA==
X-CSE-MsgGUID: hbSxIyjJRi+s1vMmFGi4wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,127,1787036400"; 
   d="scan'208";a="273992410"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 27 Sep 2026 15:21:23 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAxFI-000000000i8-1ouw;
	Sun, 27 Sep 2026 22:21:20 +0000
Date: Mon, 28 Sep 2026 00:20:23 +0200
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-timens-conditional 12/12]
 arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c:483:24: error:
 implicit declaration of function 'clock_getres_fallback'; did you mean
 'clock_getres32_fallback'?
Message-ID: <202609280041.GO294f3K-lkp@intel.com>
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
config: sparc-randconfig-r2107-20260927 (https://download.01.org/0day-ci/ar=
chive/20260928/202609280041.GO294f3K-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260928/202609280041.GO294f3K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609280041.GO294f3K-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   In file included from arch/sparc/vdso/vclock_gettime.c:22:
   arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c: In function=
 '__cvdso_clock_getres_data':
>> arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c:483:24: erro=
r: implicit declaration of function 'clock_getres_fallback'; did you mean '=
clock_getres32_fallback'? [-Wimplicit-function-declaration]
     483 |                 return clock_getres_fallback(clock, res);
         |                        ^~~~~~~~~~~~~~~~~~~~~
         |                        clock_getres32_fallback
--
   In file included from arch/sparc/vdso/vdso32/../vclock_gettime.c:22,
                    from arch/sparc/vdso/vdso32/vclock_gettime.c:22:
   arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c: In function=
 '__cvdso_clock_getres_data':
   arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c:483:24: erro=
r: implicit declaration of function 'clock_getres_fallback'; did you mean '=
clock_gettime_fallback'? [-Wimplicit-function-declaration]
     483 |                 return clock_getres_fallback(clock, res);
         |                        ^~~~~~~~~~~~~~~~~~~~~
         |                        clock_gettime_fallback
   arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c: In function=
 '__cvdso_clock_getres_time32_data':
>> arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c:505:24: erro=
r: implicit declaration of function 'clock_getres32_fallback'; did you mean=
 'clock_gettime32_fallback'? [-Wimplicit-function-declaration]
     505 |                 return clock_getres32_fallback(clock, res);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~
         |                        clock_gettime32_fallback


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
