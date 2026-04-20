Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2805631327D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Apr 2026 23:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776728222; cv=none; b=mpwFeOIiPX5zRq9LYVIDZ2bULEng1rZZzv9Uy1ak7EorZVSwya4adcDbzkD2N3XfEa0/5z6WX+DbcdCyapBLxo+oFcIU4jb4bJ5CUwqZbJqv2Knavfa2p7krUgujjwGnnZBtQ1VIsFQ44YNmPrjn/wHjzyAmQ3ibSZM2/o0UD+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776728222; c=relaxed/simple;
	bh=vVNx/3bZ+POgxXbKiZMOku69dNPhcVjozRaCzyK2FTo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=u7xzQTBddphtGjLsOGkNyW65JMD1Wq4719s6XFo3t7vno9buQpPtYWDfA9m/gBEnW0tIzwNa4+iXDeBRCyL7/I9nC5cBaCGFCX/LDJMByRnok5IAGE3Ej36fs9t3U40zSC+BDy9rsi7bf5IY72iXt3Ojd92m6VB6PDw9lJ/obCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HLESC34u; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HLESC34u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776728221; x=1808264221;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vVNx/3bZ+POgxXbKiZMOku69dNPhcVjozRaCzyK2FTo=;
  b=HLESC34ue2wPd7OdcsW/oC5uzqEh6Q1IFYfvj4JXJyW3EXWJfVM4UPoi
   irHKK72YXN2Th07pDmSMmHysSmFCvMV8gM3Odg9ZcIHGEOb3qiMMBPd39
   MBAfoqOM66nFIF5wKke9Ez5ycbV/jDMd8V/u4fpDFomIk0Glw9ZXf5Ke/
   DJ5QTr+uTGZv7GmUYVfUKlEearFBFcfhNYBdOBDrq7fNWCxH6KFJ26i9o
   H+HITPbbQYFInGxYmu94OGyaRUxje7Aj7JM3+uyXCxANfki2eWFq+AKON
   fhAELo1/WPArhW6dM4rlZCjG4oZ3K92zvQsK0f2lOMIm5FHj9ewuSR9UX
   w==;
X-CSE-ConnectionGUID: Jo0bLCpYTiKdYzs63sOHTA==
X-CSE-MsgGUID: VfW7NXIdRee6qiA8VHjEzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="89031492"
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; 
   d="scan'208";a="89031492"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 16:37:01 -0700
X-CSE-ConnectionGUID: g5FG/9W9SO6Kq/Djt44S3Q==
X-CSE-MsgGUID: SMW2cE3pQZitCuhEK2Yr0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; 
   d="scan'208";a="228706939"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Apr 2026 16:36:59 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wEyAi-0000000030C-450c;
	Mon, 20 Apr 2026 23:36:56 +0000
Date: Tue, 21 Apr 2026 07:36:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2]
 arch/x86/entry/vdso/vma.c:30:15: error: static assertion failed due to
 requirement 'VDSO_NR_PAGES + (2 * (((1UL) << 14) / ((1UL) << 12))) == (6 *
 (((1UL) << 14) / ((1UL) << 12)))': VDSO_NR_PAGES + VDSO_NR_VCLOCK_PAGES ==
 __VDSO_PAGES
Message-ID: <202604210759.McAaCwuE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   2b232de60acc345669d0e8773b9445db098042c8
commit: 4840288585a981ed8a4ecf74ab3b52df96ab860e [2/2] ANDROID: 16K: Align =
vDSO mappings to 16K on x86
config: i386-buildonly-randconfig-005-20260421 (https://download.01.org/0da=
y-ci/archive/20260421/202604210759.McAaCwuE-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260421/202604210759.McAaCwuE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604210759.McAaCwuE-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

>> arch/x86/entry/vdso/vma.c:30:15: error: static assertion failed due to r=
equirement 'VDSO_NR_PAGES + (2 * (((1UL) << 14) / ((1UL) << 12))) =3D=3D (6=
 * (((1UL) << 14) / ((1UL) << 12)))': VDSO_NR_PAGES + VDSO_NR_VCLOCK_PAGES =
=3D=3D __VDSO_PAGES
      30 | static_assert(VDSO_NR_PAGES + VDSO_NR_VCLOCK_PAGES =3D=3D __VDSO=
_PAGES);
         | ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_asser=
t'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_AR=
GS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~=
~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_ass=
ert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   arch/x86/entry/vdso/vma.c:30:52: note: expression evaluates to '12 =3D=
=3D 24'
      30 | static_assert(VDSO_NR_PAGES + VDSO_NR_VCLOCK_PAGES =3D=3D __VDSO=
_PAGES);
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~=
~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_asser=
t'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_AR=
GS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~=
~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_ass=
ert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   1 error generated.
--
>> ld.lld: error: arch/x86/entry/vdso/vdso32/vdso32.lds:634: symbol not fou=
nd: __MAX_PAGE_SIZE
   ld.lld: error: arch/x86/entry/vdso/vdso32/vdso32.lds:635: symbol not fou=
nd: __MAX_PAGE_SIZE
   ld.lld: error: arch/x86/entry/vdso/vdso32/vdso32.lds:635: symbol not fou=
nd: __MAX_PAGE_SIZE
   ld.lld: error: arch/x86/entry/vdso/vdso32/vdso32.lds:637: symbol not fou=
nd: __MAX_PAGE_SIZE
>> ld.lld: error: arch/x86/entry/vdso/vdso32/vdso32.lds:634: symbol not fou=
nd: __MAX_PAGE_SIZE
   ld.lld: error: arch/x86/entry/vdso/vdso32/vdso32.lds:635: symbol not fou=
nd: __MAX_PAGE_SIZE
   ld.lld: error: arch/x86/entry/vdso/vdso32/vdso32.lds:635: symbol not fou=
nd: __MAX_PAGE_SIZE
   ld.lld: error: arch/x86/entry/vdso/vdso32/vdso32.lds:637: symbol not fou=
nd: __MAX_PAGE_SIZE
>> ld.lld: error: arch/x86/entry/vdso/vdso32/vdso32.lds:634: symbol not fou=
nd: __MAX_PAGE_SIZE
   ld.lld: error: arch/x86/entry/vdso/vdso32/vdso32.lds:635: symbol not fou=
nd: __MAX_PAGE_SIZE
   ld.lld: error: arch/x86/entry/vdso/vdso32/vdso32.lds:635: symbol not fou=
nd: __MAX_PAGE_SIZE
   ld.lld: error: arch/x86/entry/vdso/vdso32/vdso32.lds:637: symbol not fou=
nd: __MAX_PAGE_SIZE


vim +30 arch/x86/entry/vdso/vma.c

2aae950b21e4bc arch/x86_64/vdso/vma.c    Andi Kleen       2007-07-21  29 =
=20
dafde29605ebf2 arch/x86/entry/vdso/vma.c Thomas Wei=C3=9Fschuh 2025-02-04 @=
30  static_assert(VDSO_NR_PAGES + VDSO_NR_VCLOCK_PAGES =3D=3D __VDSO_PAGES);
b757959f192daf arch/x86/entry/vdso/vma.c Christophe Leroy 2024-08-22  31 =
=20

:::::: The code at line 30 was first introduced by commit
:::::: dafde29605ebf214747e7602f4f22d3f617373a5 x86/vdso: Switch to generic=
 storage implementation

:::::: TO: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
