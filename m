Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40677BA39
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 11:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709466531; cv=none; b=Nrh6nsm4bsIUa1RhB8oIuqpUbudAcC5/SSJ4yh75y9Qdh9haIQC0PmK/Y5xi+1HxOcK+FB/Xtyx8IzQ3NHfi1cTK2qHaoOXM6FYfrOrwIFwgJZ0aPU3XFtLXJswlVAIbZPputkA84xNqGx/y0M9LDfLiJnRuPNDZPa53PoBDlXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709466531; c=relaxed/simple;
	bh=GILt6pJ02HZ5OKai0LxOjonfAYzygLfj9MLPoebXRmA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aMd68PDDrsmTzCMbssf+nnAD+c6IAw4musO2P7AM+Wf5fqseRjXyw5Hvl0JQUTSkMlFf2LP4we8G9oHW4IrwrjOoCUkCnGx2rOtxS4FQvkb3PtE/gxGa0MkRIOFJ90simgi7pGOpwzXW+mLiEJxZPy3FbKH151MkDunKlT51zb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mYjkbrq4; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mYjkbrq4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709466529; x=1741002529;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GILt6pJ02HZ5OKai0LxOjonfAYzygLfj9MLPoebXRmA=;
  b=mYjkbrq41aQV6eglWe632leGbzL3TIwtRmd2WuV0VkwvKEtlZlcd4IJi
   Zd8KNL8l6k1WQeO1LrmW1Hv3wQ72KkA7Us0n1Ad6b7gQFaA3dkxypdJpt
   8dN3fJqwGzgZ/EpSKp9DJSihJzPR0p9UlzIkxSA2knPVSNAkGfMZUIlVA
   fY7yO9LJgkwsCr1jD0blVw//h1gBgr0mmhatgTk7Nyyv8L0ZSGt+55wk1
   iZeUfKUwqpJDqcpVA8OjKyqLdxC1ds015UdxofvWnGSjT74EgrCPkp20B
   7OQbGRiuSCYfHiFfTSnqxLGlkQfcUWkQUV407/Au/wyQKpuFQQye0SOCR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="4130790"
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="4130790"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 03:48:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="8826579"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Mar 2024 03:48:47 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgkKi-0001k4-1j;
	Sun, 03 Mar 2024 11:48:44 +0000
Date: Sun, 3 Mar 2024 19:48:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1373/3769] ld: vgettimeofday.c:undefined
 reference to `__tsan_read2'
Message-ID: <202403031930.ji3wANIx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   fbcd4a3032a53350f6d182c9daeaa4c46e65d964
commit: 371d3f569b16c38afcf6abb24d620f9d768c95f9 [1373/3769] vdso: do cntvct workaround in the VDSO
config: arm64-randconfig-r051-20240303 (https://download.01.org/0day-ci/archive/20240303/202403031930.ji3wANIx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403031930.ji3wANIx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403031930.ji3wANIx-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   arch/arm64/kernel/vdso-ilp32/Makefile:87: FORCE prerequisite is missing
   arch/arm64/kernel/vdso-ilp32/Makefile:90: FORCE prerequisite is missing
   arch/arm64/kernel/vdso-ilp32/Makefile:93: FORCE prerequisite is missing
   arch/arm64/kernel/vdso-ilp32/Makefile:71: FORCE prerequisite is missing
   ld: arch/arm64/kernel/vdso-ilp32/vgettimeofday-ilp32.o: in function `__cvdso_gettimeofday_data.constprop.0':
   vgettimeofday.c:(.text+0x28): undefined reference to `__tsan_volatile_read4'
   ld: vgettimeofday.c:(.text+0x40): undefined reference to `__tsan_read4'
>> ld: vgettimeofday.c:(.text+0x60): undefined reference to `__tsan_read2'
   ld: vgettimeofday.c:(.text+0x80): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x90): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x9c): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0xa8): undefined reference to `__tsan_read4'
   ld: vgettimeofday.c:(.text+0xb4): undefined reference to `__tsan_read4'
   ld: vgettimeofday.c:(.text+0xc4): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0xd4): undefined reference to `__tsan_volatile_read4'
   ld: vgettimeofday.c:(.text+0x130): undefined reference to `__tsan_write4'
   ld: vgettimeofday.c:(.text+0x13c): undefined reference to `__tsan_write4'
   ld: vgettimeofday.c:(.text+0x194): undefined reference to `__tsan_read2'
   ld: vgettimeofday.c:(.text+0x1b8): undefined reference to `__tsan_read2'
   ld: vgettimeofday.c:(.text+0x1e4): undefined reference to `__tsan_read4'
   ld: vgettimeofday.c:(.text+0x1f0): undefined reference to `__tsan_write4'
   ld: vgettimeofday.c:(.text+0x1fc): undefined reference to `__tsan_read4'
   ld: vgettimeofday.c:(.text+0x208): undefined reference to `__tsan_write4'
   ld: arch/arm64/kernel/vdso-ilp32/vgettimeofday-ilp32.o: in function `__cvdso_clock_gettime_data.constprop.0':
   vgettimeofday.c:(.text+0x28c): undefined reference to `__tsan_volatile_read4'
   ld: vgettimeofday.c:(.text+0x2a4): undefined reference to `__tsan_read4'
   ld: vgettimeofday.c:(.text+0x2c0): undefined reference to `__tsan_read2'
   ld: vgettimeofday.c:(.text+0x2ec): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x2fc): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x308): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x318): undefined reference to `__tsan_read4'
   ld: vgettimeofday.c:(.text+0x324): undefined reference to `__tsan_read4'
   ld: vgettimeofday.c:(.text+0x334): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x344): undefined reference to `__tsan_volatile_read4'
   ld: vgettimeofday.c:(.text+0x3a0): undefined reference to `__tsan_write8'
   ld: vgettimeofday.c:(.text+0x3ac): undefined reference to `__tsan_write8'
   ld: vgettimeofday.c:(.text+0x3f4): undefined reference to `__tsan_read2'
   ld: vgettimeofday.c:(.text+0x41c): undefined reference to `__tsan_read2'
   ld: vgettimeofday.c:(.text+0x4dc): undefined reference to `__tsan_volatile_read4'
   ld: vgettimeofday.c:(.text+0x4f0): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x4fc): undefined reference to `__tsan_write8'
   ld: vgettimeofday.c:(.text+0x508): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x514): undefined reference to `__tsan_write8'
   ld: vgettimeofday.c:(.text+0x524): undefined reference to `__tsan_volatile_read4'
   ld: arch/arm64/kernel/vdso-ilp32/vgettimeofday-ilp32.o: in function `__kernel_clock_getres':
   vgettimeofday.c:(.text+0x604): undefined reference to `__tsan_write8'
   ld: vgettimeofday.c:(.text+0x610): undefined reference to `__tsan_write8'
   ld: vgettimeofday.c:(.text+0x640): undefined reference to `__tsan_volatile_read4'
   ld: arch/arm64/kernel/vdso-ilp32/vgettimeofday-ilp32.o: in function `_sub_I_00099_0':
   vgettimeofday.c:(.text.startup+0x8): undefined reference to `__tsan_init'
   collect2: error: ld returned 1 exit status
   make[3]: *** [arch/arm64/kernel/vdso-ilp32/Makefile:71: arch/arm64/kernel/vdso-ilp32/vdso-ilp32.so.dbg] Error 1
   make[3]: Target 'include/generated/vdso-ilp32-offsets.h' not remade because of errors.
   make[2]: *** [arch/arm64/Makefile:201: vdso_prepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARM64_ERRATUM_845719
   Depends on [n]: AARCH32_EL0 [=n]
   Selected by [y]:
   - ARCH_MXC [=y] && ARCH_NXP [=y] && COMPAT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
