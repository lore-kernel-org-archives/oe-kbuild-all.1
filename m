Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066D149641
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Sep 2024 20:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726433127; cv=none; b=uDjU2JAQ1vqN1woPawo+ouXXA8baHnaRIzT3GvHQQZ2kQKBljFp0VnAOnfxEnCvhuqApWYiVYwa99OdsKrBKSV0cGZzd+jTvmFD+K/BARs7rSLVoyVuDdzH11002BSGsN2RYdgf5maF3/bEE9D4OK383/fOJHZu7Sql6xzOBJjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726433127; c=relaxed/simple;
	bh=Y/UqVpmGl25elyQLJ6yyJ+dqQtfxmNSiwFmL2INY1wE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R0oK4w1mJQKiOkAWBCWGpv4EUD+/CUemDu84lNdwvjzRSg4B8bQbiEZFyUGn6nO58vjJcVKLQzdZsSiN4SLiB9mdQz96Zg1jCP2QfKtj8N6mc1CPF1HmR0XLHr3WflF43Qej2RHlYuMpQPJMYXWAOewvghMd89WSw9MBi0OgWME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SyXG7bsM; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SyXG7bsM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726433125; x=1757969125;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y/UqVpmGl25elyQLJ6yyJ+dqQtfxmNSiwFmL2INY1wE=;
  b=SyXG7bsMWVSAepLdsY6/WDxNbPBHn9OyR+PIJvQ6ssbPmLpLuVD4QwGS
   jZweZULI81aj5RlZV6UR6mSigJ/Vv8Epg0upJxeFfEg2IT0K3WIXnPZ8B
   piIYW+Eu9gwcwAk3/XVFPd+G9LSElrrGVoWeDxua4ZSecorkG3swufi/a
   FCYvm722jheKClU2HqXv1B4DUAdhPLo160vz1b7lFV24CFsnt0dq9oTA7
   IOjbzQgl27GLBCY5ikcrhBkErdEYg/Xcov/7SR4ANoZB72mwkSqFbzDi7
   TOMucfzzDJ8uLBnDsFN8QMcePyg29nwxMvioPYv9kkPdJNm+avlbgD7Te
   Q==;
X-CSE-ConnectionGUID: /xKGW1nvTq63fGU2HnAdHQ==
X-CSE-MsgGUID: kkSUrSLRS9i5YnusLedH3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="25417350"
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="25417350"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 13:45:23 -0700
X-CSE-ConnectionGUID: f6cmE2KQT/WorsDVG4DLlw==
X-CSE-MsgGUID: DkmcEv08TBWYHfnFhlu8kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,231,1719903600"; 
   d="scan'208";a="99543133"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Sep 2024 13:45:22 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spw7U-00092V-0y;
	Sun, 15 Sep 2024 20:45:20 +0000
Date: Mon, 16 Sep 2024 04:45:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1373/13950] ld: vgettimeofday.c:undefined
 reference to `__tsan_read2'
Message-ID: <202409160450.X95GB3Yc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   84404f248a61323e09909849803ea4efce81742f
commit: 371d3f569b16c38afcf6abb24d620f9d768c95f9 [1373/13950] vdso: do cntvct workaround in the VDSO
config: arm64-randconfig-001-20240916 (https://download.01.org/0day-ci/archive/20240916/202409160450.X95GB3Yc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240916/202409160450.X95GB3Yc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409160450.X95GB3Yc-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   arch/arm64/kernel/vdso-ilp32/Makefile:93: FORCE prerequisite is missing
   arch/arm64/kernel/vdso-ilp32/Makefile:87: FORCE prerequisite is missing
   arch/arm64/kernel/vdso-ilp32/Makefile:90: FORCE prerequisite is missing
   arch/arm64/kernel/vdso-ilp32/Makefile:71: FORCE prerequisite is missing
   ld: arch/arm64/kernel/vdso-ilp32/vgettimeofday-ilp32.o: in function `__cvdso_gettimeofday_data.constprop.0':
   vgettimeofday.c:(.text+0x2c): undefined reference to `__tsan_volatile_read4'
   ld: vgettimeofday.c:(.text+0x44): undefined reference to `__tsan_read4'
>> ld: vgettimeofday.c:(.text+0x60): undefined reference to `__tsan_read2'
   ld: vgettimeofday.c:(.text+0x80): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x90): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x9c): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0xa8): undefined reference to `__tsan_read4'
   ld: vgettimeofday.c:(.text+0xb8): undefined reference to `__tsan_read4'
   ld: vgettimeofday.c:(.text+0xc4): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0xd4): undefined reference to `__tsan_volatile_read4'
   ld: vgettimeofday.c:(.text+0x138): undefined reference to `__tsan_write4'
   ld: vgettimeofday.c:(.text+0x144): undefined reference to `__tsan_write4'
   ld: vgettimeofday.c:(.text+0x19c): undefined reference to `__tsan_read2'
   ld: vgettimeofday.c:(.text+0x1c0): undefined reference to `__tsan_read2'
   ld: vgettimeofday.c:(.text+0x1ec): undefined reference to `__tsan_read4'
   ld: vgettimeofday.c:(.text+0x1f8): undefined reference to `__tsan_write4'
   ld: vgettimeofday.c:(.text+0x204): undefined reference to `__tsan_read4'
   ld: vgettimeofday.c:(.text+0x210): undefined reference to `__tsan_write4'
   ld: arch/arm64/kernel/vdso-ilp32/vgettimeofday-ilp32.o: in function `__cvdso_clock_gettime_data.constprop.0':
   vgettimeofday.c:(.text+0x2cc): undefined reference to `__tsan_volatile_read4'
   ld: vgettimeofday.c:(.text+0x2e4): undefined reference to `__tsan_read4'
   ld: vgettimeofday.c:(.text+0x300): undefined reference to `__tsan_read2'
   ld: vgettimeofday.c:(.text+0x32c): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x338): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x344): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x354): undefined reference to `__tsan_read4'
   ld: vgettimeofday.c:(.text+0x364): undefined reference to `__tsan_read4'
   ld: vgettimeofday.c:(.text+0x374): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x384): undefined reference to `__tsan_volatile_read4'
   ld: vgettimeofday.c:(.text+0x3e0): undefined reference to `__tsan_write8'
   ld: vgettimeofday.c:(.text+0x3ec): undefined reference to `__tsan_write8'
   ld: vgettimeofday.c:(.text+0x434): undefined reference to `__tsan_read2'
   ld: vgettimeofday.c:(.text+0x45c): undefined reference to `__tsan_read2'
   ld: vgettimeofday.c:(.text+0x51c): undefined reference to `__tsan_volatile_read4'
   ld: vgettimeofday.c:(.text+0x530): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x53c): undefined reference to `__tsan_write8'
   ld: vgettimeofday.c:(.text+0x548): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x554): undefined reference to `__tsan_write8'
   ld: vgettimeofday.c:(.text+0x564): undefined reference to `__tsan_volatile_read4'
   ld: arch/arm64/kernel/vdso-ilp32/vgettimeofday-ilp32.o: in function `__kernel_clock_getres':
   vgettimeofday.c:(.text+0x644): undefined reference to `__tsan_write8'
   ld: vgettimeofday.c:(.text+0x650): undefined reference to `__tsan_write8'
   ld: vgettimeofday.c:(.text+0x680): undefined reference to `__tsan_volatile_read4'
   ld: arch/arm64/kernel/vdso-ilp32/vgettimeofday-ilp32.o: in function `_sub_I_00099_0':
   vgettimeofday.c:(.text.startup+0x8): undefined reference to `__tsan_init'
   collect2: error: ld returned 1 exit status
   make[3]: *** [arch/arm64/kernel/vdso-ilp32/Makefile:71: arch/arm64/kernel/vdso-ilp32/vdso-ilp32.so.dbg] Error 1 shuffle=2963184100
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
