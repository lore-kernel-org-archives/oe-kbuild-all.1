Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36215134BD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jul 2023 17:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689702875; x=1721238875;
  h=date:from:cc:subject:message-id:mime-version;
  bh=siKrf/68//G+6QSyKHNj0Y06y/XWRj5BOvLzXASUM9Q=;
  b=jO+PEsDH0Ym5GIvuzvLDXMlx5o2TN8bUG5//vOEKcsj4pkVFNvLQOjkY
   3BR3wGC99SrdZzwPfGKmElVU2z62jTrrb7OE0Fv2AHO7rjzx4OWybEyvt
   sjvV1euWVixGDljfG8CU/wkPv3TIt7qBAnD6DBnmsRwN/4jIK50NMoEPw
   W+60QemE9ndq2QSbW3Mn/9D2NYT9FoqeRfTfT9VxJPh7NmtFmBvKKQBql
   LxW3RYijS0vwLNK3fBZa9dU/X1SZx8bGPdM7PX7Gu3ooFoHDbTf80qIDN
   MTyYrwlBqchHDz9uFS2XiqVk9rYzMdoUwiloTkIXoAQgwU3OjZO6UWOYv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="365153715"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="365153715"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 10:54:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="717684065"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="717684065"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 18 Jul 2023 10:54:33 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLotz-0003Lh-1Q
	for oe-kbuild-all@lists.linux.dev;
	Tue, 18 Jul 2023 17:54:24 +0000
Date: Wed, 19 Jul 2023 01:54:06 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:5.15/dovetail-xenomai 8586/26803] ld.lld: error:
 relocation R_AARCH64_ABS64 cannot be used against local symbol; recompile
 with -fPIC
Message-ID: <202307190132.2ZABZ4Tx-lkp@intel.com>
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
head:   9ebe966c9db2389fa11b6997119b22b7374fd44d
commit: 376f534db595228ae75dfc585b85dcd1309978bd [8586/26803] clocksource/drivers: dovetail: fix dependency on GENERIC_CLOCKSOURCE_VDSO
config: arm64-randconfig-r011-20230718 (https://download.01.org/0day-ci/archive/20230719/202307190132.2ZABZ4Tx-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307190132.2ZABZ4Tx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307190132.2ZABZ4Tx-lkp@intel.com/

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
   make[2]: *** [arch/arm64/kernel/vdso/Makefile:56: arch/arm64/kernel/vdso/vdso.so.dbg] Error 1 shuffle=4022157678
   make[2]: Target 'arch/arm64/kernel/vdso/vdso.so' not remade because of errors.
   make[2]: Target 'include/generated/vdso-offsets.h' not remade because of errors.
   make[1]: *** [arch/arm64/Makefile:201: vdso_prepare] Error 2 shuffle=4022157678
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2 shuffle=4022157678
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
