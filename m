Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5843B19DA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Mar 2026 12:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774010399; cv=none; b=hrOTBfyKJ0nE9jRHbJYUPAoBmIuwuUaHpcYAi+AZONydTCGOf+zUn3qlnCdzZB0nXkGIbwLqHuFkXtYVMq4leN0dh4xsg+ZqxKLCWCIilIi8kOHslU03hosi6dJ0WpuDJmsBdVORuNDI2Z3DxE4Rr/14Pzo8abhAcYV5kZniywY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774010399; c=relaxed/simple;
	bh=PntZXmJRQm/XbfCAhtL/fgzXTDnbyTE4K7GxEGis8xc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r75SVwwwAB+5bQ1WvTSwJtlMaa98wAfLObFgWU+Zwb7jFQfhGg4ZiRBhfQ4JLr9t0msmSJ4/ZdWeHm9ghtXnIfksc80Ni9f2YZBxpw80ioXYzbPLUyvuYOGBZ9CtZzR3u1hJiGNzYUSfHv1jVkQmpEkD4I3AtQCP3Xj7QOc+4R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gaP/bwGC; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gaP/bwGC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774010392; x=1805546392;
  h=date:from:to:cc:subject:message-id;
  bh=PntZXmJRQm/XbfCAhtL/fgzXTDnbyTE4K7GxEGis8xc=;
  b=gaP/bwGCuIawPFLYxKRu9HSvZ1d5sulC2rA1FzHrCXRGR+9+jwjCcuWZ
   ahDnI8o1Lgl3vzb6M9zxgbyERziw/hKBczJvB6uUYBgoV10Cb0cfEdO4I
   R9yfFvDAGxUqWOUIx9rO1898IYfBGne7XAY988dVUY7rVLgwnhiPnr+GZ
   TJ7FyM00qsqOMYj7vOXl0sh+DL0EHATOo0esCkawt6la5Qp0AqnP+inRK
   9g10qzj5fDCe+WWXCwD5QGWSBMgbSXKYjKebZqRiTJV9RTCNmWum/rIcM
   b3UkAodm8sUdS+si0B455DW10PHxTpDUuj8xXcP25mMhOaJ+Pww/XcWyb
   g==;
X-CSE-ConnectionGUID: LqXu++4hTQKK7nYYovHUiw==
X-CSE-MsgGUID: NIQMKwqjSTWg78W3Kwt1gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="74983257"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="74983257"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 05:39:52 -0700
X-CSE-ConnectionGUID: IwnOzAihSdKRZVdKyxcw+Q==
X-CSE-MsgGUID: q2TA1an5Q9O6QLxcCRZMUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="223297808"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 20 Mar 2026 05:39:49 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3Z8l-000000002MZ-1379;
	Fri, 20 Mar 2026 12:39:47 +0000
Date: Fri, 20 Mar 2026 20:39:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kai Huang <kai.huang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:upstreamtest 2/2]
 include/asm-generic/bitops/non-atomic.h:15:23: error: redefinition of
 'generic_test_bit'
Message-ID: <202603202046.ctz8usKZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel/tdx.git upstreamtest
head:   5c38ae7e5c475be0eb737e7e77f6982529e0ef4f
commit: 5c38ae7e5c475be0eb737e7e77f6982529e0ef4f [2/2] asm-generic/bitops: Move test_bit{_acquire}() to instrumented-atomic.h
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20260320/202603202046.ctz8usKZ-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603202046.ctz8usKZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603202046.ctz8usKZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/bitops.h:255,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from kernel/bounds.c:14:
>> include/asm-generic/bitops/non-atomic.h:15:23: error: redefinition of 'generic_test_bit'
      15 | #define arch_test_bit generic_test_bit
         |                       ^~~~~~~~~~~~~~~~
   include/asm-generic/bitops/non-instrumented-non-atomic.h:14:33: note: in expansion of macro 'arch_test_bit'
      14 | #define _test_bit               arch_test_bit
         |                                 ^~~~~~~~~~~~~
   include/asm-generic/bitops/instrumented-atomic.h:109:1: note: in expansion of macro '_test_bit'
     109 | _test_bit(unsigned long nr, const volatile unsigned long *addr)
         | ^~~~~~~~~
   In file included from include/linux/bitops.h:28:
   include/asm-generic/bitops/generic-non-atomic.h:121:1: note: previous definition of 'generic_test_bit' with type 'bool(long unsigned int,  const volatile long unsigned int *)' {aka '_Bool(long unsigned int,  const volatile long unsigned int *)'}
     121 | generic_test_bit(unsigned long nr, const volatile unsigned long *addr)
         | ^~~~~~~~~~~~~~~~
>> include/asm-generic/bitops/non-atomic.h:16:31: error: redefinition of 'generic_test_bit_acquire'
      16 | #define arch_test_bit_acquire generic_test_bit_acquire
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/non-instrumented-non-atomic.h:15:33: note: in expansion of macro 'arch_test_bit_acquire'
      15 | #define _test_bit_acquire       arch_test_bit_acquire
         |                                 ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/instrumented-atomic.h:121:1: note: in expansion of macro '_test_bit_acquire'
     121 | _test_bit_acquire(unsigned long nr, const volatile unsigned long *addr)
         | ^~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/generic-non-atomic.h:137:1: note: previous definition of 'generic_test_bit_acquire' with type 'bool(long unsigned int,  const volatile long unsigned int *)' {aka '_Bool(long unsigned int,  const volatile long unsigned int *)'}
     137 | generic_test_bit_acquire(unsigned long nr, const volatile unsigned long *addr)
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:184: kernel/bounds.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1337: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/generic_test_bit +15 include/asm-generic/bitops/non-atomic.h

4117b02132d1cf9 Akinobu Mita      2006-03-26  14  
21bb8af513d35c0 Alexander Lobakin 2022-06-24 @15  #define arch_test_bit generic_test_bit
8238b4579866b7c Mikulas Patocka   2022-08-26 @16  #define arch_test_bit_acquire generic_test_bit_acquire
0e862838f290147 Alexander Lobakin 2022-06-24  17  

:::::: The code at line 15 was first introduced by commit
:::::: 21bb8af513d35c005c401706030f4eb469538d1d bitops: always define asm-generic non-atomic bitops

:::::: TO: Alexander Lobakin <alexandr.lobakin@intel.com>
:::::: CC: Yury Norov <yury.norov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
