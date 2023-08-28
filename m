Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6C311CA3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Aug 2023 12:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693225127; x=1724761127;
  h=date:from:cc:subject:message-id:mime-version;
  bh=0WQVwGmt1r2c2fEqomefkEFfHPEsr/NAwk8nnryXd6I=;
  b=IwHbqnB4y8in7f3L86qIscoRONdRupjlQ9aM/KsQfzun0Fdyqq4gYGiL
   iU0utcCfVUlh9XC/96rV3/58aPNiKE1izP6W4cK9cZJQB7QGb664ET1OC
   z1auVjUof7HTesELjOI0WfkJPaQ3w56zsMF7u5Ji12LcotJWgrsruS/qj
   dct4EcDsKsYYj2JvRiJbyj5SJ83b+CE12+dq7I07I6fJ+HzsDTw33GQC7
   KoZeUpNFtuf+my1AXYpjn2YJxrdB2pEXKZXDUn81Q0QDP1ERrlMD4jpQK
   aNGjV3Q2kh34b3/CuC6lYsvunF11n82ISTp0a5oD1VvgHEXyZCIMrWDxd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="365289420"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="365289420"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 05:18:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="803675995"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="803675995"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 28 Aug 2023 05:18:45 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qabCe-0007pp-2x
	for oe-kbuild-all@lists.linux.dev;
	Mon, 28 Aug 2023 12:18:44 +0000
Date: Mon, 28 Aug 2023 20:17:52 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:5.15/dovetail-xenomai 8586/26832] ld.lld: error:
 relocation R_AARCH64_ABS64 cannot be used against local symbol; recompile
 with -fPIC
Message-ID: <202308282048.V0KQQqX6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Philippe,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/intel/linux-intel-lts.git 5.15/dovetail-xenomai
head:   ef4cd214d7c9836eb64fced61f30c02eadf8a91c
commit: 376f534db595228ae75dfc585b85dcd1309978bd [8586/26832] clocksource/drivers: dovetail: fix dependency on GENERIC_CLOCKSOURCE_VDSO
config: arm64-randconfig-r022-20230828 (https://download.01.org/0day-ci/archive/20230828/202308282048.V0KQQqX6-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230828/202308282048.V0KQQqX6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308282048.V0KQQqX6-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/vdso/vgettimeofday.c:9:5: warning: no previous prototype for function '__kernel_clock_gettime' [-Wmissing-prototypes]
   int __kernel_clock_gettime(clockid_t clock,
   ^
   arch/arm64/kernel/vdso/vgettimeofday.c:9:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __kernel_clock_gettime(clockid_t clock,
   ^
   static
   arch/arm64/kernel/vdso/vgettimeofday.c:15:5: warning: no previous prototype for function '__kernel_gettimeofday' [-Wmissing-prototypes]
   int __kernel_gettimeofday(struct __kernel_old_timeval *tv,
   ^
   arch/arm64/kernel/vdso/vgettimeofday.c:15:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __kernel_gettimeofday(struct __kernel_old_timeval *tv,
   ^
   static
   arch/arm64/kernel/vdso/vgettimeofday.c:21:5: warning: no previous prototype for function '__kernel_clock_getres' [-Wmissing-prototypes]
   int __kernel_clock_getres(clockid_t clock_id,
   ^
   arch/arm64/kernel/vdso/vgettimeofday.c:21:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __kernel_clock_getres(clockid_t clock_id,
   ^
   static
   3 warnings generated.
>> ld.lld: error: relocation R_AARCH64_ABS64 cannot be used against local symbol; recompile with -fPIC
   >>> defined in arch/arm64/kernel/vdso/vgettimeofday.o
   >>> referenced by vgettimeofday.c
   >>>               arch/arm64/kernel/vdso/vgettimeofday.o:(.rodata+0x0)
--
>> ld.lld: error: relocation R_AARCH64_ABS64 cannot be used against local symbol; recompile with -fPIC
   >>> defined in arch/arm64/kernel/vdso/vgettimeofday.o
   >>> referenced by vgettimeofday.c
   >>>               arch/arm64/kernel/vdso/vgettimeofday.o:(.rodata+0x8)
--
>> ld.lld: error: relocation R_AARCH64_ABS64 cannot be used against local symbol; recompile with -fPIC
   >>> defined in arch/arm64/kernel/vdso/vgettimeofday.o
   >>> referenced by vgettimeofday.c
   >>>               arch/arm64/kernel/vdso/vgettimeofday.o:(.rodata+0x10)
--
>> ld.lld: error: relocation R_AARCH64_ABS64 cannot be used against local symbol; recompile with -fPIC
   >>> defined in arch/arm64/kernel/vdso/vgettimeofday.o
   >>> referenced by vgettimeofday.c
   >>>               arch/arm64/kernel/vdso/vgettimeofday.o:(.rodata+0x18)
--
>> ld.lld: error: relocation R_AARCH64_ABS64 cannot be used against local symbol; recompile with -fPIC
   >>> defined in arch/arm64/kernel/vdso/vgettimeofday.o
   >>> referenced by vgettimeofday.c
   >>>               arch/arm64/kernel/vdso/vgettimeofday.o:(.rodata+0x20)
--
>> ld.lld: error: relocation R_AARCH64_ABS64 cannot be used against local symbol; recompile with -fPIC
   >>> defined in arch/arm64/kernel/vdso/vgettimeofday.o
   >>> referenced by vgettimeofday.c
   >>>               arch/arm64/kernel/vdso/vgettimeofday.o:(.rodata+0x28)
   make[2]: *** [arch/arm64/kernel/vdso/Makefile:56: arch/arm64/kernel/vdso/vdso.so.dbg] Error 1 shuffle=16129440
   make[2]: Target 'arch/arm64/kernel/vdso/vdso.so' not remade because of errors.
   make[2]: Target 'include/generated/vdso-offsets.h' not remade because of errors.
   make[1]: *** [arch/arm64/Makefile:201: vdso_prepare] Error 2 shuffle=16129440
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2 shuffle=16129440
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
