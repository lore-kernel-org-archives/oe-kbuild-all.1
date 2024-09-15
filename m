Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D811CA699
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Sep 2024 19:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726426983; cv=none; b=CARoL4MWvhuS+Fvd/Xo1kyTcqPT0T8Yi8t4d+vqSLUNr4f8LoeD2pHsaGOdnqTOeFY0zLVIMnpjJMrqwt56YWGokx8q7XXJb+QdWDFuTpWPDnvPeEEXYUS94EjpWCIBpmOj5HJptBNj/8swOV7+OMsvvbGn3q3z24Hu5Negb6EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726426983; c=relaxed/simple;
	bh=H4yhxnQPxbWWRDRc7kIGTvjlLcGsAsvL16CcOaOctis=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y5jgl283iOlB+fiacI47T3Ayg3QeOBgk3iQSKcA7MzEkrpDcd969pWcVf6XkIvZjuKphiGsLG1CNgQXW/5Avb5hh68HqHLQQu6YpNGK6bxvNLmaNfySAn7yka2P+iRVYGzebM1tKC8ZH1MlYui+8fsJn26XgbhGIGMLy++79X8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DJnTTZCt; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DJnTTZCt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726426981; x=1757962981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H4yhxnQPxbWWRDRc7kIGTvjlLcGsAsvL16CcOaOctis=;
  b=DJnTTZCtiNgbTYPp1axt76t7ZGIMCBrOj05t7PETOb2YFwz48fqVmYOa
   XKqn7hXzxqN9FpY3c2DzwTsHxb/bBwRNjUMPLk1nic7k6YHCOfg9MGvk7
   poVZNOPSwtB7HhwfdkTpcd/z0JT1WyCi86QdUW7CgkKAuU0DoYD5hIyWa
   xj+5PhFv+dE9rn56gSU4nD6bGVUMpLywj4OY+9Z4FKJ4914tFwwQZCh//
   SA+TynPZz6Lz8HYnU0t8d9QfU8tjCTogEmZQqmUlAgq/vP91Qi1llviyN
   94y1wNpNSwV7K0eX9PhP8LehllyWZWzEW3x2CssbnUYsbvGN0QYtzV9KY
   A==;
X-CSE-ConnectionGUID: gpcWTl1AS0e8EM+47U/Pzg==
X-CSE-MsgGUID: UTrF1H8rQnaEO2/aZw02Xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="13535421"
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="13535421"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 12:03:00 -0700
X-CSE-ConnectionGUID: UJbsk5rHTCWjt2KcDgkfKw==
X-CSE-MsgGUID: NaETG81ZSRypLBUDHIhNQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="68987537"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 15 Sep 2024 12:02:59 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spuWO-0008xe-2h;
	Sun, 15 Sep 2024 19:02:56 +0000
Date: Mon, 16 Sep 2024 03:02:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 701/13950] vgettimeofday.c:undefined reference to
 `__tsan_volatile_read4'
Message-ID: <202409160214.lVT0QY5g-lkp@intel.com>
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
head:   84404f248a61323e09909849803ea4efce81742f
commit: f9b54a6714445cde83aeff0318cf767b3b81229d [701/13950] arm64:ilp32: add ARM64_ILP32 to Kconfig
config: arm64-randconfig-001-20240916 (https://download.01.org/0day-ci/archive/20240916/202409160214.lVT0QY5g-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240916/202409160214.lVT0QY5g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409160214.lVT0QY5g-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   arch/arm64/kernel/vdso-ilp32/Makefile:90: FORCE prerequisite is missing
   arch/arm64/kernel/vdso-ilp32/Makefile:84: FORCE prerequisite is missing
   arch/arm64/kernel/vdso-ilp32/Makefile:87: FORCE prerequisite is missing
   arch/arm64/kernel/vdso-ilp32/Makefile:68: FORCE prerequisite is missing
   ld: arch/arm64/kernel/vdso-ilp32/vgettimeofday-ilp32.o: in function `__cvdso_gettimeofday_data.constprop.0':
>> vgettimeofday.c:(.text+0x2c): undefined reference to `__tsan_volatile_read4'
>> ld: vgettimeofday.c:(.text+0x44): undefined reference to `__tsan_read4'
>> ld: vgettimeofday.c:(.text+0x6c): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x78): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x84): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x90): undefined reference to `__tsan_read4'
   ld: vgettimeofday.c:(.text+0xa0): undefined reference to `__tsan_read4'
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
   ld: vgettimeofday.c:(.text+0x2b4): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x2c0): undefined reference to `__tsan_read4'
   ld: vgettimeofday.c:(.text+0x2d0): undefined reference to `__tsan_read4'
   ld: vgettimeofday.c:(.text+0x2e0): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x2f0): undefined reference to `__tsan_volatile_read4'
>> ld: vgettimeofday.c:(.text+0x358): undefined reference to `__tsan_write8'
   ld: vgettimeofday.c:(.text+0x364): undefined reference to `__tsan_write8'
   ld: vgettimeofday.c:(.text+0x448): undefined reference to `__tsan_volatile_read4'
   ld: vgettimeofday.c:(.text+0x45c): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x468): undefined reference to `__tsan_write8'
   ld: vgettimeofday.c:(.text+0x474): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x480): undefined reference to `__tsan_write8'
   ld: vgettimeofday.c:(.text+0x490): undefined reference to `__tsan_volatile_read4'
   ld: arch/arm64/kernel/vdso-ilp32/vgettimeofday-ilp32.o: in function `__kernel_clock_getres':
>> vgettimeofday.c:(.text+0x584): undefined reference to `__tsan_write8'
   ld: vgettimeofday.c:(.text+0x590): undefined reference to `__tsan_write8'
   ld: vgettimeofday.c:(.text+0x5c0): undefined reference to `__tsan_volatile_read4'
   ld: arch/arm64/kernel/vdso-ilp32/vgettimeofday-ilp32.o: in function `_sub_I_00099_0':
>> vgettimeofday.c:(.text.startup+0x8): undefined reference to `__tsan_init'
   collect2: error: ld returned 1 exit status
   make[3]: *** [arch/arm64/kernel/vdso-ilp32/Makefile:68: arch/arm64/kernel/vdso-ilp32/vdso-ilp32.so.dbg] Error 1 shuffle=2963184100
   make[3]: Target 'include/generated/vdso-ilp32-offsets.h' not remade because of errors.
   make[2]: *** [arch/arm64/Makefile:201: vdso_prepare] Error 2 shuffle=2963184100
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=2963184100
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=2963184100
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
