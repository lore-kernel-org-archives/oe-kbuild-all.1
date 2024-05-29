Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3C8184125
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 May 2024 20:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717016244; cv=none; b=Eif1uUAyVzFaxMqDh7A7dbxHZQS5avtnRzvjpiVnn0kyRtP1lzfEF5JcG/mDbc7mR55mNdgwsSz6mkhd8GYHmZ/pwCFEOtlSrtHGyK3P4crSxA6n4LJIcRp9ykeMhsYr8RmkPvHqq7YGz05eZ87xFxkts+3dTytkcFobd2Qu/zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717016244; c=relaxed/simple;
	bh=mJ54rs8jDMveEAZEsVetF/AMZIlOjtE/JhhZn4b/CIY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AnamBg62RvK409v4TdE9LXk8u8bAdU5yCswmLfm6VAgxV4XRcGOLgSvKgxQ/OOEok0iXytAsZ+3e/t/NUpp9mk9Xbi0DKdDoiHt/CP0Hfo2Hkehc11djUchrVN6UratuexAM1MexvVQvIgM9GhcXPvw1cNslxZMMcPf2PauqcHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aiLCAQ8A; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aiLCAQ8A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717016243; x=1748552243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mJ54rs8jDMveEAZEsVetF/AMZIlOjtE/JhhZn4b/CIY=;
  b=aiLCAQ8AwaMbyAwXyDWkiX1ujNhxYSQ9laZgiEf1UvJ2Sw40RkdU4wVo
   dR/tcez3G/3W4tpjueNioxNU39zea8la6o88HkBP88+w1eE2anB4n3T+m
   2VOfAUeQ/cDF245HlRRQEDfgrxllvhZWr1nkBCtfVROSEeZ4INiRa+ExT
   eM4nXeCQtJu3pvCEFsWMcGWzSbpYR381GAfZZ4KoxMacMhYgxxFfH+z11
   bCohHxr2bwHgFJIqZh1Prc0xF0auHMnNCF9NIjARnVdpR3M3M73jOe0so
   Fhaoys412Zpb3AjVq8KQV4n+JnPCqpmJTPzUgRakxcqaV8L/jPJ+tT52u
   w==;
X-CSE-ConnectionGUID: Stq0pmyjSQy2Ef9p3VXcAg==
X-CSE-MsgGUID: EBq+SEhxSymuTIr1Nk2ZZg==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13632681"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="13632681"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 13:56:37 -0700
X-CSE-ConnectionGUID: nnjlIcmGT2asyBkIqq4MNQ==
X-CSE-MsgGUID: wIPwXk60QtGMp7feAYDAyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="66770685"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 29 May 2024 13:56:35 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCQLD-000EBm-0j;
	Wed, 29 May 2024 20:56:20 +0000
Date: Thu, 30 May 2024 04:55:07 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 701/9792] vgettimeofday.c:undefined reference to
 `__tsan_volatile_read4'
Message-ID: <202405300401.Q7EpPsSe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andrew,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c0b6b4438dc70167c4c16f6436499cde257f782a
commit: f9b54a6714445cde83aeff0318cf767b3b81229d [701/9792] arm64:ilp32: add ARM64_ILP32 to Kconfig
config: arm64-randconfig-003-20240530 (https://download.01.org/0day-ci/archive/20240530/202405300401.Q7EpPsSe-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405300401.Q7EpPsSe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405300401.Q7EpPsSe-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   arch/arm64/kernel/vdso-ilp32/Makefile:87: FORCE prerequisite is missing
   arch/arm64/kernel/vdso-ilp32/Makefile:84: FORCE prerequisite is missing
   arch/arm64/kernel/vdso-ilp32/Makefile:90: FORCE prerequisite is missing
   arch/arm64/kernel/vdso-ilp32/Makefile:68: FORCE prerequisite is missing
   ld: arch/arm64/kernel/vdso-ilp32/vgettimeofday-ilp32.o: in function `__cvdso_gettimeofday_data.constprop.0':
>> vgettimeofday.c:(.text+0x28): undefined reference to `__tsan_volatile_read4'
   ld: vgettimeofday.c:(.text+0x40): undefined reference to `__tsan_read4'
   ld: vgettimeofday.c:(.text+0x6c): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x7c): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x88): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x94): undefined reference to `__tsan_read4'
   ld: vgettimeofday.c:(.text+0xa0): undefined reference to `__tsan_read4'
   ld: vgettimeofday.c:(.text+0xb0): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0xc0): undefined reference to `__tsan_volatile_read4'
   ld: vgettimeofday.c:(.text+0x120): undefined reference to `__tsan_write4'
   ld: vgettimeofday.c:(.text+0x12c): undefined reference to `__tsan_write4'
   ld: vgettimeofday.c:(.text+0x184): undefined reference to `__tsan_read4'
   ld: vgettimeofday.c:(.text+0x190): undefined reference to `__tsan_write4'
   ld: vgettimeofday.c:(.text+0x19c): undefined reference to `__tsan_read4'
   ld: vgettimeofday.c:(.text+0x1a8): undefined reference to `__tsan_write4'
   ld: arch/arm64/kernel/vdso-ilp32/vgettimeofday-ilp32.o: in function `__cvdso_clock_gettime_data.constprop.0':
   vgettimeofday.c:(.text+0x24c): undefined reference to `__tsan_volatile_read4'
   ld: vgettimeofday.c:(.text+0x264): undefined reference to `__tsan_read4'
   ld: vgettimeofday.c:(.text+0x298): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x2a8): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x2b4): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x2c4): undefined reference to `__tsan_read4'
   ld: vgettimeofday.c:(.text+0x2d0): undefined reference to `__tsan_read4'
   ld: vgettimeofday.c:(.text+0x2e0): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x2f0): undefined reference to `__tsan_volatile_read4'
   ld: vgettimeofday.c:(.text+0x350): undefined reference to `__tsan_write8'
   ld: vgettimeofday.c:(.text+0x35c): undefined reference to `__tsan_write8'
   ld: vgettimeofday.c:(.text+0x438): undefined reference to `__tsan_volatile_read4'
   ld: vgettimeofday.c:(.text+0x44c): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x458): undefined reference to `__tsan_write8'
   ld: vgettimeofday.c:(.text+0x464): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x470): undefined reference to `__tsan_write8'
   ld: vgettimeofday.c:(.text+0x480): undefined reference to `__tsan_volatile_read4'
   ld: arch/arm64/kernel/vdso-ilp32/vgettimeofday-ilp32.o: in function `__kernel_clock_getres':
>> vgettimeofday.c:(.text+0x584): undefined reference to `__tsan_write8'
   ld: vgettimeofday.c:(.text+0x590): undefined reference to `__tsan_write8'
   ld: vgettimeofday.c:(.text+0x5c0): undefined reference to `__tsan_volatile_read4'
   ld: arch/arm64/kernel/vdso-ilp32/vgettimeofday-ilp32.o: in function `_sub_I_00099_0':
>> vgettimeofday.c:(.text.startup+0x8): undefined reference to `__tsan_init'
   collect2: error: ld returned 1 exit status
   make[3]: *** [arch/arm64/kernel/vdso-ilp32/Makefile:68: arch/arm64/kernel/vdso-ilp32/vdso-ilp32.so.dbg] Error 1 shuffle=1722226854
   make[3]: Target 'include/generated/vdso-ilp32-offsets.h' not remade because of errors.
   make[2]: *** [arch/arm64/Makefile:201: vdso_prepare] Error 2 shuffle=1722226854
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=1722226854
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=1722226854
   make: Target 'prepare' not remade because of errors.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARM64_ERRATUM_845719
   Depends on [n]: AARCH32_EL0 [=n]
   Selected by [y]:
   - ARCH_MXC [=y] && ARCH_NXP [=y] && COMPAT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
