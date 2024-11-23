Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5FD2309A9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Nov 2024 06:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732343358; cv=none; b=vAiLC4RPn0vlqNQavsc70bRynf5+mn091fRrM4ZTOvXmOtIPLtIa5P7GTiwcEVErkMMffpfMjuzRbCd64ef0jHPTdYdAFiVrO3z8ln1swW/1rs/OUvgfM2uDYXkXKtDQ+Ar+UM4fjx2Wj5CkdrVW3D1a7WV2H+mfv+/IgzMg5mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732343358; c=relaxed/simple;
	bh=8zpBgZ//RBPxvb2EXRhVTromeK44wGSzXDqhoxOAjXU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bCHyaWkiIuAWtItat+jnJcK8pJgIgQLoyO3gHHk0fF3qcZSJqSEUyT9SAt3jNpQaDDIlx3l8rQdMyREB40Un7qBnR/SfbK02veqiTx8IQfIVOqtBQcSxV4MgitNDBGLKVe0dkf6OSEUWQlN+AKRW9aP+3hhnhSxWxmwu1ksaz5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fxJgSA5W; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fxJgSA5W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732343356; x=1763879356;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8zpBgZ//RBPxvb2EXRhVTromeK44wGSzXDqhoxOAjXU=;
  b=fxJgSA5WTVQKgkk+YKsWZWfYXmZeIWrp0t9KtUTWkKKTB9zX60ZyAk3r
   W2DFwmZ/imjKUnYo4Mii2bDeeU5rvc29AcK+euH/BdhuaJJC6djN4ES4Z
   8i+Sp74Eo05xusQ1RrH0ZrZZjJo4pnSo6TLPMJ2LfiW7O4M8D+1aZVwCw
   FfHkKGtXm9PF9aFtgnzK0H6Bohw0o6BTy+mDe2tf931It56wOlwy4+EQz
   rLnSFHQxOd1Y0V7QeH0sBZGXkm7T0UjJM8awtc1+d4yN42tq1RMPePT9K
   9EKeZuPBJoqUEGot7jOligroASfUaDDRml9Vrr5SiTjMGvh8DOwBrn4OH
   g==;
X-CSE-ConnectionGUID: vy780oZYS1yD6QIPUjaaQg==
X-CSE-MsgGUID: QZ8wHjw7SPSyTNarQgehGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="20092985"
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="20092985"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 22:29:16 -0800
X-CSE-ConnectionGUID: rg2avQtETQqmm/htv0lZuw==
X-CSE-MsgGUID: kwUjZUPbSqarHOsXGYeriQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="90764836"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 22 Nov 2024 22:29:15 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEjdo-0004TB-2U;
	Sat, 23 Nov 2024 06:29:12 +0000
Date: Sat, 23 Nov 2024 14:28:19 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 12/59] include/vdso/limits.h:13:25: warning:
 conversion from 'long unsigned int' to 'unsigned int' changes value from
 '18446744073709551615' to '4294967295'
Message-ID: <202411231420.di7hRYuZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   78907e9aaa2afc17557ccada5eeafa2f4423ddcc
commit: 6a0ed0a7aac349150628bda45521200cb75006c2 [12/59] samples/damon/prcl: implement schemes setup
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20241123/202411231420.di7hRYuZ-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411231420.di7hRYuZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411231420.di7hRYuZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/limits.h:7,
                    from include/linux/kernel.h:17,
                    from include/linux/cpumask.h:11,
                    from arch/s390/include/asm/processor.h:31,
                    from include/linux/sched.h:13,
                    from include/linux/cgroup.h:12,
                    from include/linux/memcontrol.h:13,
                    from include/linux/damon.h:11,
                    from samples/damon/prcl.c:9:
   samples/damon/prcl.c: In function 'damon_sample_prcl_start':
>> include/vdso/limits.h:13:25: warning: conversion from 'long unsigned int' to 'unsigned int' changes value from '18446744073709551615' to '4294967295' [-Woverflow]
      13 | #define ULONG_MAX       (~0UL)
         |                         ^
   samples/damon/prcl.c:86:43: note: in expansion of macro 'ULONG_MAX'
      86 |                         .max_age_region = ULONG_MAX},
         |                                           ^~~~~~~~~


vim +13 include/vdso/limits.h

3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20   4  
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20   5  #define USHRT_MAX	((unsigned short)~0U)
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20   6  #define SHRT_MAX	((short)(USHRT_MAX >> 1))
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20   7  #define SHRT_MIN	((short)(-SHRT_MAX - 1))
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20   8  #define INT_MAX		((int)(~0U >> 1))
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20   9  #define INT_MIN		(-INT_MAX - 1)
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20  10  #define UINT_MAX	(~0U)
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20  11  #define LONG_MAX	((long)(~0UL >> 1))
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20  12  #define LONG_MIN	(-LONG_MAX - 1)
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20 @13  #define ULONG_MAX	(~0UL)
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20  14  #define LLONG_MAX	((long long)(~0ULL >> 1))
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20  15  #define LLONG_MIN	(-LLONG_MAX - 1)
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20  16  #define ULLONG_MAX	(~0ULL)
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20  17  #define UINTPTR_MAX	ULONG_MAX
3e0e9f8c6e3ca9 Vincenzo Frascino 2020-03-20  18  

:::::: The code at line 13 was first introduced by commit
:::::: 3e0e9f8c6e3ca92154a74edc23a8872da921d2b6 linux/limits.h: Extract common header for vDSO

:::::: TO: Vincenzo Frascino <vincenzo.frascino@arm.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
