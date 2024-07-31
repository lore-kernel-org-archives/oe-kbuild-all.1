Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD8317579
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jul 2024 20:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722456783; cv=none; b=p/HjDtKOx/GCL/UI4YBswP7T2ijbYFvfbqZjo8W2W/zF9CoidBNOqwY3m+VZoRtEPrBAr5pzq0ys267GVwelmWdTzY2heo5u0rcRlblTsuKvOX85HUuXzd3YsES999+QDFYxExcBDl9S4LoEoUJJBAgn4CLuqIXlQDWl9wgqpcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722456783; c=relaxed/simple;
	bh=Asbnu3rl6AEiv0xW/tHz1UyBE962COd1xEsxsFMJ3n0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VM8F1kZ16wcdrGQXFIJRREuUMBUn2XuuiJeqwNfjSvANvHJe7oc9tbJ/gS5RaPeblx9dop+2HX3atHes16wNohjiwUiYOQJLc16vhw2bkBG6tB+V8sh6s796IDn/ZdjVy0HcTUAg5QADmgtIXAE2qnFgVmy8dpo6ga274e/bwO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hqZ+ulwS; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hqZ+ulwS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722456781; x=1753992781;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Asbnu3rl6AEiv0xW/tHz1UyBE962COd1xEsxsFMJ3n0=;
  b=hqZ+ulwSyQQTurEZFrhLij98rN+gnglq4XHUyyI8/4nELhtu3M5PotHA
   eWe11+6MjE7KcJzQ1rI/qQqgR//MaVc/YQuTs+SZBC9LybBbQ/vZsWPiN
   /qLD8SBT/m0a7yBc2kWpU3/QBajoY3YC5ME5XQEgy4d47CuMDIjko3Ss5
   43le/gHd49ICwoBaW/YJ6m9A4+0gsNM0awtszXSblfapZ2vm+CkO9JB07
   PgwiSKipRrX+7l3IPFpAoVG01giZcsNmQCpLUw0jO/TkWmofvhZbHmT69
   I0EByXTboXpFHeK50x2quYmxsveyhXz6Y0e1VvmwY0jdEdllbNUDu6N72
   Q==;
X-CSE-ConnectionGUID: AhiZLmloT9WfVqFhtJ05hg==
X-CSE-MsgGUID: RnviuBYUT5K36hFnl2w7Ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="37879724"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="37879724"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 13:13:00 -0700
X-CSE-ConnectionGUID: XM0rq/CbTN2oM/ONamBCEA==
X-CSE-MsgGUID: 1AUNTrLgTJe03FDj9WrXqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="54456243"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 Jul 2024 13:12:58 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZFgu-000ulz-1u;
	Wed, 31 Jul 2024 20:12:56 +0000
Date: Thu, 1 Aug 2024 04:12:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 701/11695] vgettimeofday.c:undefined reference to
 `__tsan_volatile_read4'
Message-ID: <202408010424.vAnjVI1d-lkp@intel.com>
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
head:   e0427893d95be3be1bb71e10dfb53b6f732e8e42
commit: f9b54a6714445cde83aeff0318cf767b3b81229d [701/11695] arm64:ilp32: add ARM64_ILP32 to Kconfig
config: arm64-randconfig-004-20240801 (https://download.01.org/0day-ci/archive/20240801/202408010424.vAnjVI1d-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240801/202408010424.vAnjVI1d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408010424.vAnjVI1d-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   arch/arm64/kernel/vdso-ilp32/Makefile:90: FORCE prerequisite is missing
   arch/arm64/kernel/vdso-ilp32/Makefile:87: FORCE prerequisite is missing
   arch/arm64/kernel/vdso-ilp32/Makefile:84: FORCE prerequisite is missing
   arch/arm64/kernel/vdso-ilp32/Makefile:68: FORCE prerequisite is missing
   ld: arch/arm64/kernel/vdso-ilp32/vgettimeofday-ilp32.o: in function `__cvdso_gettimeofday_data.constprop.0':
>> vgettimeofday.c:(.text+0x44): undefined reference to `__tsan_volatile_read4'
   ld: vgettimeofday.c:(.text+0x5c): undefined reference to `__tsan_read4'
   ld: vgettimeofday.c:(.text+0x84): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x90): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x9c): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0xa8): undefined reference to `__tsan_read4'
   ld: vgettimeofday.c:(.text+0xb8): undefined reference to `__tsan_read4'
   ld: vgettimeofday.c:(.text+0xc8): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0xd8): undefined reference to `__tsan_volatile_read4'
   ld: vgettimeofday.c:(.text+0x138): undefined reference to `__tsan_write4'
   ld: vgettimeofday.c:(.text+0x144): undefined reference to `__tsan_write4'
   ld: vgettimeofday.c:(.text+0x194): undefined reference to `__tsan_read4'
   ld: vgettimeofday.c:(.text+0x1a0): undefined reference to `__tsan_write4'
   ld: vgettimeofday.c:(.text+0x1ac): undefined reference to `__tsan_read4'
   ld: vgettimeofday.c:(.text+0x1b8): undefined reference to `__tsan_write4'
   ld: arch/arm64/kernel/vdso-ilp32/vgettimeofday-ilp32.o: in function `__cvdso_clock_gettime_data.constprop.0':
   vgettimeofday.c:(.text+0x27c): undefined reference to `__tsan_volatile_read4'
   ld: vgettimeofday.c:(.text+0x290): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x29c): undefined reference to `__tsan_write8'
   ld: vgettimeofday.c:(.text+0x2a8): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x2b4): undefined reference to `__tsan_write8'
   ld: vgettimeofday.c:(.text+0x2c4): undefined reference to `__tsan_volatile_read4'
   ld: vgettimeofday.c:(.text+0x314): undefined reference to `__tsan_volatile_read4'
   ld: vgettimeofday.c:(.text+0x32c): undefined reference to `__tsan_read4'
   ld: vgettimeofday.c:(.text+0x360): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x370): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x37c): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x388): undefined reference to `__tsan_read4'
   ld: vgettimeofday.c:(.text+0x398): undefined reference to `__tsan_read4'
   ld: vgettimeofday.c:(.text+0x3a8): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x3b8): undefined reference to `__tsan_volatile_read4'
   ld: vgettimeofday.c:(.text+0x418): undefined reference to `__tsan_write8'
   ld: vgettimeofday.c:(.text+0x424): undefined reference to `__tsan_write8'
   ld: arch/arm64/kernel/vdso-ilp32/vgettimeofday-ilp32.o: in function `__kernel_clock_getres':
   vgettimeofday.c:(.text+0x530): undefined reference to `__tsan_volatile_read4'
   ld: vgettimeofday.c:(.text+0x55c): undefined reference to `__tsan_write8'
   ld: vgettimeofday.c:(.text+0x568): undefined reference to `__tsan_write8'
   ld: arch/arm64/kernel/vdso-ilp32/vgettimeofday-ilp32.o: in function `_sub_I_00099_0':
>> vgettimeofday.c:(.text.startup+0x8): undefined reference to `__tsan_init'
   collect2: error: ld returned 1 exit status
   make[3]: *** [arch/arm64/kernel/vdso-ilp32/Makefile:68: arch/arm64/kernel/vdso-ilp32/vdso-ilp32.so.dbg] Error 1 shuffle=953699413
   make[3]: Target 'include/generated/vdso-ilp32-offsets.h' not remade because of errors.
   make[2]: *** [arch/arm64/Makefile:201: vdso_prepare] Error 2 shuffle=953699413
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=953699413
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=953699413
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
