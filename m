Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3089239E9B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Oct 2025 18:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760639838; cv=none; b=pekpkCpX2MIaccXIJlGSKTuARYds+T8AzWnIZ5qatTNXDHYPaLPzGF1LrXyPFxdEMcXE85557RptCEnsPhiyihtKcMzIvxHRGjatVf32jFPoMJUkPxhBDMYLqlHrFmzOdjM/xvxb3/JeCnf0QOq/8eXEPXhOksywhehjsWJYrv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760639838; c=relaxed/simple;
	bh=UUxU58bp54OeXStSNO991v4yCcariaFLQ26utcqX+Hw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f/7Q3dR5PCsUja53qZDqQbtKWemE2a3247zrJMHC7Ed0oZvZCZ0ja6HYORbnfgtvZtwCuc0uj2GBbFdPI50NQ/fzhh8kyjMOs+8LGKE7Z9VjM+DTnEos/hLaFbweozF0/Wi7lFehXYAPRygVAAzMm68J8fz4D6xjnnqqCZM4ouA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Un7K529K; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Un7K529K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760639835; x=1792175835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UUxU58bp54OeXStSNO991v4yCcariaFLQ26utcqX+Hw=;
  b=Un7K529KMzJCsHUWwgVGyvtkj/aOyUz/V8+Nl4IB4/MOfOM6LnS/YByP
   EcU3N1qQ4LVIIGv65rvs37nZWXNZFjy9/XBUI+uVeAUV7d37XxgpJ5sd1
   lg5qmeG/rw/HlbpbQUrFT1Mfy+ryytMFcafKmgZ2Tyj+uTjc9TSIWYP86
   SEK70WF5BKOZbXiHOKGlS6E09ackbw2xmj/F+g3Tp4dMcsT5ggdG5jX+N
   ppHNsD7wx3PZUTPNAwi/uwuBf5M5IdPMLVQHDUpWAsvtEtr+vEjE3CDBw
   XDRKeYsMizyXfcUdlAkOcnW5LznpMd+VSWdIvOYCRNFnZCRJHK1NGX9l5
   w==;
X-CSE-ConnectionGUID: QZA7R0tSS/mZtegfDfM4qA==
X-CSE-MsgGUID: bmhsPuttRCuUTjwxO8eTrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="74285939"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="74285939"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 11:37:15 -0700
X-CSE-ConnectionGUID: Rn8GMb1qTO2VQTlXLPiDnA==
X-CSE-MsgGUID: WR4I+/85TVW7M5IjRmuC6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="219683677"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 16 Oct 2025 11:37:14 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9Sqd-00058z-2s;
	Thu, 16 Oct 2025 18:37:11 +0000
Date: Fri, 17 Oct 2025 02:36:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2976/2976] ld: vgettimeofday.c:undefined
 reference to `__tsan_read4'
Message-ID: <202510170226.DhWN6e8d-lkp@intel.com>
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
head:   65461ffb14372269f333f0e18867775c14741e76
commit: f9b54a6714445cde83aeff0318cf767b3b81229d [2976/2976] arm64:ilp32: add ARM64_ILP32 to Kconfig
config: arm64-randconfig-003-20251017 (https://download.01.org/0day-ci/archive/20251017/202510170226.DhWN6e8d-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510170226.DhWN6e8d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510170226.DhWN6e8d-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/vdso-ilp32/Makefile:84: FORCE prerequisite is missing
   arch/arm64/kernel/vdso-ilp32/Makefile:90: FORCE prerequisite is missing
   arch/arm64/kernel/vdso-ilp32/Makefile:87: FORCE prerequisite is missing
   cc1: warning: '-mabi=ilp32' is deprecated [-Wdeprecated]
   cc1: warning: '-mabi=ilp32' is deprecated [-Wdeprecated]
   cc1: warning: '-mabi=ilp32' is deprecated [-Wdeprecated]
   cc1: warning: '-mabi=ilp32' is deprecated [-Wdeprecated]
   arch/arm64/kernel/vdso-ilp32/Makefile:68: FORCE prerequisite is missing
   ld: arch/arm64/kernel/vdso-ilp32/vgettimeofday-ilp32.o: in function `__cvdso_gettimeofday_data.constprop.0':
   vgettimeofday.c:(.text+0x28): undefined reference to `__tsan_volatile_read4'
>> ld: vgettimeofday.c:(.text+0x40): undefined reference to `__tsan_read4'
>> ld: vgettimeofday.c:(.text+0x6c): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x78): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x84): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x94): undefined reference to `__tsan_read4'
   ld: vgettimeofday.c:(.text+0xa4): undefined reference to `__tsan_read4'
   ld: vgettimeofday.c:(.text+0xb0): undefined reference to `__tsan_read8'
>> ld: vgettimeofday.c:(.text+0xc0): undefined reference to `__tsan_volatile_read4'
>> ld: vgettimeofday.c:(.text+0x118): undefined reference to `__tsan_write4'
   ld: vgettimeofday.c:(.text+0x124): undefined reference to `__tsan_write4'
   ld: vgettimeofday.c:(.text+0x17c): undefined reference to `__tsan_read4'
   ld: vgettimeofday.c:(.text+0x188): undefined reference to `__tsan_write4'
   ld: vgettimeofday.c:(.text+0x194): undefined reference to `__tsan_read4'
   ld: vgettimeofday.c:(.text+0x1a0): undefined reference to `__tsan_write4'
   ld: arch/arm64/kernel/vdso-ilp32/vgettimeofday-ilp32.o: in function `__cvdso_clock_gettime_data.constprop.0':
   vgettimeofday.c:(.text+0x24c): undefined reference to `__tsan_volatile_read4'
   ld: vgettimeofday.c:(.text+0x264): undefined reference to `__tsan_read4'
   ld: vgettimeofday.c:(.text+0x298): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x2a8): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x2b8): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x2c4): undefined reference to `__tsan_read4'
   ld: vgettimeofday.c:(.text+0x2d4): undefined reference to `__tsan_read4'
   ld: vgettimeofday.c:(.text+0x2e0): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x2f0): undefined reference to `__tsan_volatile_read4'
>> ld: vgettimeofday.c:(.text+0x348): undefined reference to `__tsan_write8'
   ld: vgettimeofday.c:(.text+0x354): undefined reference to `__tsan_write8'
   ld: vgettimeofday.c:(.text+0x41c): undefined reference to `__tsan_volatile_read4'
   ld: vgettimeofday.c:(.text+0x430): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x43c): undefined reference to `__tsan_write8'
   ld: vgettimeofday.c:(.text+0x448): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x454): undefined reference to `__tsan_write8'
   ld: vgettimeofday.c:(.text+0x464): undefined reference to `__tsan_volatile_read4'
   ld: arch/arm64/kernel/vdso-ilp32/vgettimeofday-ilp32.o: in function `__kernel_clock_getres':
   vgettimeofday.c:(.text+0x584): undefined reference to `__tsan_write8'
   ld: vgettimeofday.c:(.text+0x590): undefined reference to `__tsan_write8'
   ld: vgettimeofday.c:(.text+0x5c0): undefined reference to `__tsan_volatile_read4'
   ld: arch/arm64/kernel/vdso-ilp32/vgettimeofday-ilp32.o: in function `_sub_I_00099_0':
   vgettimeofday.c:(.text.startup+0x8): undefined reference to `__tsan_init'
   collect2: error: ld returned 1 exit status
   make[3]: *** [arch/arm64/kernel/vdso-ilp32/Makefile:68: arch/arm64/kernel/vdso-ilp32/vdso-ilp32.so.dbg] Error 1 shuffle=3794859661
   make[3]: Target 'include/generated/vdso-ilp32-offsets.h' not remade because of errors.
   make[2]: *** [arch/arm64/Makefile:201: vdso_prepare] Error 2 shuffle=3794859661
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=3794859661
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=3794859661
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
