Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998CB2D9780
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Jul 2026 23:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783467501; cv=none; b=u3wfiJq+vPWmjl/R/9tOX/mgA8OEb3SwgnvgiuoKIWS5rlWbS/MPckVMlYIJ6lvlJp6BwiuwlVRnoW7ZXHCxMu+bPQtIqV8ICNB78J74MYvep3qwCX8EM6QPxlaxwJ8UWCM/C594mMk5+XXqYMJAoW5Ey+SREsQQuuE2OmxBvkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783467501; c=relaxed/simple;
	bh=DrMYk4WrlYgpx1D3qU762lVFesNzgW2eNvdSKNeYtAM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DmlCbjO7pz9Xc5Ku4bk3IHxh5Bgdk5w6vBeNyBBmSt5sY3ONoxyS4zhDNdH7Sgai1wnvCoFlHQ/uNbXMMZOlXkiN7L2nyg6NifPBu0NU9h+fM8A4SEsapLgD+liLN7ptYCQ3LefFkukd89d6ZU3yC0hbYo1+X02yHqn8GL4i6mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EDjROIY6; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EDjROIY6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783467500; x=1815003500;
  h=date:from:to:cc:subject:message-id;
  bh=DrMYk4WrlYgpx1D3qU762lVFesNzgW2eNvdSKNeYtAM=;
  b=EDjROIY6pFCw8RN92sLJsHlhBfnO0MNtSPxujNbsm3jTy18NZt3R9uPk
   Wv+OJK19ZaRuEIk/pKu2H1E41LlYpwwndDggWILrwgrz+lFIvFTYZpcAc
   HS2I4tHA9zcrTvN92quehR0+/EX1T4bGAdaInkxzFYGPlIBPhTtK+E7OD
   ZJP6ixPFhqNeN8XZc1rEg9l9Lmp8ScbY+dMIEcX3NamOGfPK8L2N8C60P
   cdNJZAJI02syZF8wKZ0RhRIlcI2n2dmJOR6O6HJsiLeyKWATaGN2TQ2Wj
   j5tlTFuC+zWdWorLSjOUIeL2Qd+lm/ddXKDxj02Dh9mr1hB+pY1Meq+Vm
   g==;
X-CSE-ConnectionGUID: OXvIRJ9MRsGWz78QI7ZKlQ==
X-CSE-MsgGUID: kKeY7sdiSTKZ4l7rSLwkhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84149718"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84149718"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 16:38:15 -0700
X-CSE-ConnectionGUID: Xha9yFp7TOOBcTzT0GZd3w==
X-CSE-MsgGUID: PnW8bGiLSzmC/7CHhg4NRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="250771400"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 07 Jul 2026 16:38:12 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whFMf-00000000Fmd-476j;
	Tue, 07 Jul 2026 23:38:09 +0000
Date: Wed, 08 Jul 2026 07:37:53 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver Upton <oupton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Marc Zyngier <maz@kernel.org>,
 "Wei-Lin Chang" <weilin.chang@arm.com>
Subject: [linux-next:master 3509/4300] include/vdso/limits.h:8:25:
 warning: overflow in conversion from 'int' to 's8' {aka 'signed char'}
 changes value from '2147483647' to '-1'
Message-ID: <202607080709.kE9W2GbI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5c73cd9f0819c1c44e373e3dabb68318b1de1a12
commit: 100baf0184896f859290a684f864b8200d8ac872 [3509/4300] KVM: arm64: Ensure level is always initialized when relaxing perms
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260708/202607080709.kE9W2GbI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607080709.kE9W2GbI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607080709.kE9W2GbI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/limits.h:7,
                    from include/linux/overflow.h:6,
                    from include/linux/bits.h:32,
                    from arch/arm64/include/asm/kvm_pgtable.h:10,
                    from arch/arm64/kvm/hyp/pgtable.c:11:
   arch/arm64/kvm/hyp/pgtable.c: In function 'kvm_pgtable_stage2_relax_perms':
>> include/vdso/limits.h:8:25: warning: overflow in conversion from 'int' to 's8' {aka 'signed char'} changes value from '2147483647' to '-1' [-Woverflow]
       8 | #define INT_MAX         ((int)(~0U >> 1))
         |                         ^
   arch/arm64/include/asm/tlbflush.h:163:33: note: in expansion of macro 'INT_MAX'
     163 | #define TLBI_TTL_UNKNOWN        INT_MAX
         |                                 ^~~~~~~
   arch/arm64/kvm/hyp/pgtable.c:1359:20: note: in expansion of macro 'TLBI_TTL_UNKNOWN'
    1359 |         s8 level = TLBI_TTL_UNKNOWN;
         |                    ^~~~~~~~~~~~~~~~
--
   In file included from include/linux/limits.h:7,
                    from include/linux/overflow.h:6,
                    from include/linux/bits.h:32,
                    from arch/arm64/include/asm/kvm_pgtable.h:10,
                    from arch/arm64/kvm/hyp/nvhe/../pgtable.c:11:
   arch/arm64/kvm/hyp/nvhe/../pgtable.c: In function 'kvm_pgtable_stage2_relax_perms':
>> include/vdso/limits.h:8:25: warning: overflow in conversion from 'int' to 's8' {aka 'signed char'} changes value from '2147483647' to '-1' [-Woverflow]
       8 | #define INT_MAX         ((int)(~0U >> 1))
         |                         ^
   arch/arm64/include/asm/tlbflush.h:163:33: note: in expansion of macro 'INT_MAX'
     163 | #define TLBI_TTL_UNKNOWN        INT_MAX
         |                                 ^~~~~~~
   arch/arm64/kvm/hyp/nvhe/../pgtable.c:1359:20: note: in expansion of macro 'TLBI_TTL_UNKNOWN'
    1359 |         s8 level = TLBI_TTL_UNKNOWN;
         |                    ^~~~~~~~~~~~~~~~


vim +8 include/vdso/limits.h

3e0e9f8c6e3ca92 Vincenzo Frascino 2020-03-20   4  
3e0e9f8c6e3ca92 Vincenzo Frascino 2020-03-20   5  #define USHRT_MAX	((unsigned short)~0U)
3e0e9f8c6e3ca92 Vincenzo Frascino 2020-03-20   6  #define SHRT_MAX	((short)(USHRT_MAX >> 1))
3e0e9f8c6e3ca92 Vincenzo Frascino 2020-03-20   7  #define SHRT_MIN	((short)(-SHRT_MAX - 1))
3e0e9f8c6e3ca92 Vincenzo Frascino 2020-03-20  @8  #define INT_MAX		((int)(~0U >> 1))
3e0e9f8c6e3ca92 Vincenzo Frascino 2020-03-20   9  #define INT_MIN		(-INT_MAX - 1)
3e0e9f8c6e3ca92 Vincenzo Frascino 2020-03-20  10  #define UINT_MAX	(~0U)
3e0e9f8c6e3ca92 Vincenzo Frascino 2020-03-20  11  #define LONG_MAX	((long)(~0UL >> 1))
3e0e9f8c6e3ca92 Vincenzo Frascino 2020-03-20  12  #define LONG_MIN	(-LONG_MAX - 1)
3e0e9f8c6e3ca92 Vincenzo Frascino 2020-03-20  13  #define ULONG_MAX	(~0UL)
3e0e9f8c6e3ca92 Vincenzo Frascino 2020-03-20  14  #define LLONG_MAX	((long long)(~0ULL >> 1))
3e0e9f8c6e3ca92 Vincenzo Frascino 2020-03-20  15  #define LLONG_MIN	(-LLONG_MAX - 1)
3e0e9f8c6e3ca92 Vincenzo Frascino 2020-03-20  16  #define ULLONG_MAX	(~0ULL)
3e0e9f8c6e3ca92 Vincenzo Frascino 2020-03-20  17  #define UINTPTR_MAX	ULONG_MAX
3e0e9f8c6e3ca92 Vincenzo Frascino 2020-03-20  18  

:::::: The code at line 8 was first introduced by commit
:::::: 3e0e9f8c6e3ca92154a74edc23a8872da921d2b6 linux/limits.h: Extract common header for vDSO

:::::: TO: Vincenzo Frascino <vincenzo.frascino@arm.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
