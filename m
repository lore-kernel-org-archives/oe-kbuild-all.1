Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D9A391501
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Mar 2026 04:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774499047; cv=none; b=qdoRXgUWwkl2qTlKesV8xbm5/XPMnBh6kUoJBAeZ4e/nKE626QlAstXYaeIqJwGSjcBju88MkWlUkHb2P+XMy/hlCy2x8Zwhz8+tUcIQnFsWIrd7shhKxeSx/TfLB10jawmx0tQVc+2DAuB6hY1EGzMjqoiH3nFg62SEMqNVvwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774499047; c=relaxed/simple;
	bh=fCsXF8YMdpVtWy0dK1b/FkDUvGxTDc7q5Ejez2IQ5S4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ojchGhWz3ATIEAXoz4D38qFQkTvOLzbiHm8XJwNHL1O5kWOWpI5XQsTCZgikY8UdOgGwYCMefQUBZzI8OIoDV7x7mMZ1/MdbJIp3uPcHwbPHWtAb/G/en9kUkkdkPQbShL0MTxfzbmFIdSBkbYtRLTWJy2eLGX0AT9B8RHa6A2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TCEvNDly; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TCEvNDly"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774499045; x=1806035045;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=fCsXF8YMdpVtWy0dK1b/FkDUvGxTDc7q5Ejez2IQ5S4=;
  b=TCEvNDlyGSPG3zxzqE1NnQciSdEt7FLzgQZXgfZPzwsagTrZRCaQDjOg
   q4l9VQLg+bXROQF+42bc9HVekY/VXXRVf/oCuX50v9AdfnplK4I3uKy5l
   DW6Xs4TM2/XRx+wRZn2Wv48JPhHskpdSqVu2gQCj08eAs0bmo/zDBzgT2
   pMfm0SWLKJpMsMXtvRELmppCY0kUbgeXu4Rot+BpjOzys0jn+7tcU7X1P
   Ukf9CalRRorUzbN4HL56g9mgpFUuQjseDL4WxA11X7Q6WUAMSLQrPHcEm
   cPSVqUONnuzBdF6cVQslcJ1Xiut5B0hXQa9P2TEwAZ9XbBwnj1gZDKgp3
   g==;
X-CSE-ConnectionGUID: x5ERh/ViQH264jk6fvdl3w==
X-CSE-MsgGUID: NIQjAk85S4Oet+qT2e4+GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="79404679"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="79404679"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 21:24:04 -0700
X-CSE-ConnectionGUID: mI4B2TmwQ/GwSIMvkD/BEw==
X-CSE-MsgGUID: myBwSLX4RGuYCrNzWa/S2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="226520803"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Mar 2026 21:24:02 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5cGG-0000000089d-0zuT;
	Thu, 26 Mar 2026 04:24:00 +0000
Date: Thu, 26 Mar 2026 12:23:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-ifdeffery 5/6]
 arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c:445:42: sparse:
 sparse: marked inline, but without a definition
Message-ID: <202603261209.TaieM6sN-lkp@intel.com>
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
inux.git b4/vdso-ifdeffery
head:   79ffb31a4d48b44be2785e748722f6b4e3980434
commit: ecf32517f8467dce391bb422c33facd988e22b01 [5/6] VDSO_HAS_CLOCK_GETRES
config: sparc-randconfig-r134-20260326 (https://download.01.org/0day-ci/arc=
hive/20260326/202603261209.TaieM6sN-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260326/202603261209.TaieM6sN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603261209.TaieM6sN-lkp@i=
ntel.com/

sparse warnings: (new ones prefixed by >>)
   arch/sparc/vdso/vclock_gettime.c: note: in included file:
>> arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c:445:42: spar=
se: sparse: marked inline, but without a definition
--
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through=
 arch/sparc/vdso/vdso32/../vclock_gettime.c):
>> arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c:445:42: spar=
se: sparse: marked inline, but without a definition
   arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c:467:44: spar=
se: sparse: marked inline, but without a definition

vim +445 arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c

502a590a170b3b Thomas Gleixner  2019-07-28  444 =20
cfa274511a4a49 Thomas Wei=C3=9Fschuh 2026-03-24 @445  __always_inline int c=
lock_getres_fallback(clockid_t _clkid, struct __kernel_timespec *_ts);
cfa274511a4a49 Thomas Wei=C3=9Fschuh 2026-03-24  446 =20

:::::: The code at line 445 was first introduced by commit
:::::: cfa274511a4a491eb5f2c440f366754326fe28de getres fallbacks

:::::: TO: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
:::::: CC: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
