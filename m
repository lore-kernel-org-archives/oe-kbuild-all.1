Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C79311587
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Feb 2026 10:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772015115; cv=none; b=bd4Q4VjmJ7dlCcx4DDcuHxG/qib1m7ejnDg9Q/bp5gkkMOafSbNY8aiVnFstOHJ7evfHy6/RsjUqnWviTiTrm+kKOmTUQ4EQfENqzxPRkSC+5aooiZWu3GAqGlwP75fL5Ecp6MzdfWX4dkX5m/sgX7B0pdZEQV1vKgvZg/I1gl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772015115; c=relaxed/simple;
	bh=ilfpgnCyOsrVx5qiJWl0zD61ygP6msXkeRfLTnn9dgk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Ry/pgtYRncoDmy+51Sz/A12oTwvU/fXiGTG5JMZSoEX4nZMdu/4vXkCLP8m6Fiv23K5XDjzt0D0BB6xlqYztigTBPZKGUURXImHt7gUpHDlV4XvBRq/+rWDv3bXhfQpMfofRbti3ERbuPCbl+7MSpsDfct/Kutadjtilv7bGnok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MpL4Th0z; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MpL4Th0z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772015114; x=1803551114;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ilfpgnCyOsrVx5qiJWl0zD61ygP6msXkeRfLTnn9dgk=;
  b=MpL4Th0zIGJG4wgkmE0BoJ0rwwReIkJy0ckLHLA4YZcCFiUey29eAPBV
   ARjJ9sA6LP7PZs6r9wKkEmt4JWwlZw4EA5eBnSYdTtPWBc/xIFRHfu7A/
   Ea+YERXBjEwzDRUhlpZB/NV6phmEHdzVgFbwNBi8nHIOg3gaLQjGvEKDC
   Ziw1tjO9Z7pfl28elNlPU36osq/QUYSUtvIHA8yGsKcchRZvM1ywzD9dk
   sUArkLfjKyHPvBiaVuB6QXJztYdjYUFRJWSW/ql5Sy6C8yI/hCeAsp7x6
   Ca6o0HoSqWCDWRj7ITwuaiTXpfan6M3acxtzwhxZyIx05f+REGaJGFSKa
   A==;
X-CSE-ConnectionGUID: y1cNVnE8RsK+XVOTpZTYJA==
X-CSE-MsgGUID: iaGTn3pgQlGonLBWUCGn0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="84413313"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="84413313"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 02:25:13 -0800
X-CSE-ConnectionGUID: dKt2QM44QAy0v4JJ6dfkzw==
X-CSE-MsgGUID: uDWhdUwnRruehAeOHbq+jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="216331094"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 25 Feb 2026 02:25:12 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvC4r-000000005Dt-1sDZ;
	Wed, 25 Feb 2026 10:25:09 +0000
Date: Wed, 25 Feb 2026 18:24:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:for-next/kspp 2/3]
 arch/arm64/include/asm/vdso/gettimeofday.h:89:37: error: initialization of
 'const struct vdso_time_data *' from incompatible pointer type 'struct
 vdso_time_data (*)[]'
Message-ID: <202602251855.BT8B0pjE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-=
next/kspp
head:   c471bbfb03f639ea9ec53a4b30ae6cba509eb2d1
commit: 07c00a03a06b6bdf3121bb1747ad770fbaa30f5c [2/3] vdso/datapage: Defin=
e vdso time and rng data pointers as pointers
config: arm64-randconfig-r064-20260225 (https://download.01.org/0day-ci/arc=
hive/20260225/202602251855.BT8B0pjE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260225/202602251855.BT8B0pjE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602251855.BT8B0pjE-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   In file included from include/vdso/datapage.h:196,
                    from lib/vdso/gettimeofday.c:6,
                    from <command-line>:
   arch/arm64/include/asm/vdso/gettimeofday.h: In function '__arch_get_vdso=
_u_time_data':
>> arch/arm64/include/asm/vdso/gettimeofday.h:89:37: error: initialization =
of 'const struct vdso_time_data *' from incompatible pointer type 'struct v=
dso_time_data (*)[]' [-Werror=3Dincompatible-pointer-types]
     const struct vdso_time_data *ret =3D &vdso_u_time_data;
                                        ^
   In file included from include/vdso/datapage.h:196,
                    from lib/vdso/getrandom.c:8,
                    from <command-line>:
   arch/arm64/include/asm/vdso/gettimeofday.h: In function '__arch_get_vdso=
_u_time_data':
>> arch/arm64/include/asm/vdso/gettimeofday.h:89:37: error: initialization =
of 'const struct vdso_time_data *' from incompatible pointer type 'struct v=
dso_time_data (*)[]' [-Werror=3Dincompatible-pointer-types]
     const struct vdso_time_data *ret =3D &vdso_u_time_data;
                                        ^
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:287: arch/arm64/kernel/vdso/vgetran=
dom.o] Error 1
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:287: arch/arm64/kernel/vdso/vgettim=
eofday.o] Error 1
   make[3]: Target 'include/generated/vdso-offsets.h' not remade because of=
 errors.
   make[3]: Target 'arch/arm64/kernel/vdso/vdso.so' not remade because of e=
rrors.
   make[2]: *** [arch/arm64/Makefile:207: vdso_prepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +89 arch/arm64/include/asm/vdso/gettimeofday.h

28b1a824a4f44d Vincenzo Frascino 2019-06-21  85 =20
0c314cda93258c Thomas Wei=C3=9Fschuh  2025-04-30  86  #if IS_ENABLED(CONFIG=
_CC_IS_GCC) && IS_ENABLED(CONFIG_PAGE_SIZE_64KB)
0c314cda93258c Thomas Wei=C3=9Fschuh  2025-04-30  87  static __always_inlin=
e const struct vdso_time_data *__arch_get_vdso_u_time_data(void)
0c314cda93258c Thomas Wei=C3=9Fschuh  2025-04-30  88  {
0c314cda93258c Thomas Wei=C3=9Fschuh  2025-04-30 @89  	const struct vdso_ti=
me_data *ret =3D &vdso_u_time_data;
0c314cda93258c Thomas Wei=C3=9Fschuh  2025-04-30  90 =20
0c314cda93258c Thomas Wei=C3=9Fschuh  2025-04-30  91  	/* Work around inval=
id absolute relocations */
0c314cda93258c Thomas Wei=C3=9Fschuh  2025-04-30  92  	OPTIMIZER_HIDE_VAR(r=
et);
0c314cda93258c Thomas Wei=C3=9Fschuh  2025-04-30  93 =20
0c314cda93258c Thomas Wei=C3=9Fschuh  2025-04-30  94  	return ret;
0c314cda93258c Thomas Wei=C3=9Fschuh  2025-04-30  95  }
0c314cda93258c Thomas Wei=C3=9Fschuh  2025-04-30  96  #define __arch_get_vd=
so_u_time_data __arch_get_vdso_u_time_data
0c314cda93258c Thomas Wei=C3=9Fschuh  2025-04-30  97  #endif /* IS_ENABLED(=
CONFIG_CC_IS_GCC) && IS_ENABLED(CONFIG_PAGE_SIZE_64KB) */
0c314cda93258c Thomas Wei=C3=9Fschuh  2025-04-30  98 =20

:::::: The code at line 89 was first introduced by commit
:::::: 0c314cda93258cd1f0055a278a6576b5d4aeabf5 arm64: vdso: Work around in=
valid absolute relocations from GCC

:::::: TO: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
