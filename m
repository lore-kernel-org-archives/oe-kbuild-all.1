Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49AEC9455
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 07:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709451457; cv=none; b=D9PqtXtHACngh05bTTsLzGprH2nDE+JIibghy6vXHkZlPquOrl7susHQcQijfcOmuXTQgkV6v5CIzCfIPXUjQp2w1CI+HSq5tEnPr7VRiOxb/B2DBB5KSJ9oy+VLH+DFFQqTzhy1JmNZ4F7vjd2V8cilwahut5ilOIF5L+vGvDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709451457; c=relaxed/simple;
	bh=YULF+M8LTCSFs9kuuQXHZMkjnSFt1ZnLy60iCIVh0Kg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XETw1DBq0aifWb/xmbl1gjvrZBPZKWXQft8V91lsVvoPsUM012fmsgeKXBl2t3kLm/yCzLbzicMq5W4INrPQ5JDQmc6vNbFYeSmt8Qo/SdAE+H+q1TJZQ9+xdbT6yAql+KdhVZJ62cTjY6FEdYQM7z61qQv45BWGFV0Pp/2YMlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EORaIdC6; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EORaIdC6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709451454; x=1740987454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YULF+M8LTCSFs9kuuQXHZMkjnSFt1ZnLy60iCIVh0Kg=;
  b=EORaIdC66RMZ9YF9xU0xGN66EigIWH/uLx4TOLzFf3IteARB50EcWr9A
   4nc/rf7W1qCbCXoHhDlpj6tk87FCoDjmgXe1i9ZJs+3U2FG9q0JPMxD+G
   /3I8092TDYOBWTefHEaA4ClgSGjbrbiItd6sOd0PnhtitFpGJFH1zf3dv
   9lPo89R1h9/UH+i/CdzAPYe4Ynm5QiC02drMUM+2v66h6DomLfyme78B4
   7vQTeX4gdnvJR988VJL7wDkbBqtsO649g+GpkY5oyO4PDEB5iHjIh09tc
   YN2O5X4i8pUS8TnXnBP2b7gPxZebjK3p4w1IQMMZyBmZe2UEU6NbzmJKq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="7727486"
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="7727486"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2024 23:37:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="9213622"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 Mar 2024 23:37:32 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rggPZ-0001Fs-1K;
	Sun, 03 Mar 2024 07:37:29 +0000
Date: Sun, 3 Mar 2024 15:37:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 701/3769] vgettimeofday.c:undefined reference to
 `__tsan_volatile_read4'
Message-ID: <202403031506.b9MRia3z-lkp@intel.com>
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
commit: f9b54a6714445cde83aeff0318cf767b3b81229d [701/3769] arm64:ilp32: add ARM64_ILP32 to Kconfig
config: arm64-randconfig-r051-20240303 (https://download.01.org/0day-ci/archive/20240303/202403031506.b9MRia3z-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403031506.b9MRia3z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403031506.b9MRia3z-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   arch/arm64/kernel/vdso-ilp32/Makefile:84: FORCE prerequisite is missing
   arch/arm64/kernel/vdso-ilp32/Makefile:87: FORCE prerequisite is missing
   arch/arm64/kernel/vdso-ilp32/Makefile:90: FORCE prerequisite is missing
   arch/arm64/kernel/vdso-ilp32/Makefile:68: FORCE prerequisite is missing
   ld: arch/arm64/kernel/vdso-ilp32/vgettimeofday-ilp32.o: in function `__cvdso_gettimeofday_data.constprop.0':
>> vgettimeofday.c:(.text+0x28): undefined reference to `__tsan_volatile_read4'
>> ld: vgettimeofday.c:(.text+0x40): undefined reference to `__tsan_read4'
>> ld: vgettimeofday.c:(.text+0x6c): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x7c): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x88): undefined reference to `__tsan_read8'
   ld: vgettimeofday.c:(.text+0x94): undefined reference to `__tsan_read4'
   ld: vgettimeofday.c:(.text+0xa0): undefined reference to `__tsan_read4'
   ld: vgettimeofday.c:(.text+0xb0): undefined reference to `__tsan_read8'
>> ld: vgettimeofday.c:(.text+0xc0): undefined reference to `__tsan_volatile_read4'
>> ld: vgettimeofday.c:(.text+0x120): undefined reference to `__tsan_write4'
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
>> ld: vgettimeofday.c:(.text+0x350): undefined reference to `__tsan_write8'
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
>> collect2: error: ld returned 1 exit status
   make[3]: *** [arch/arm64/kernel/vdso-ilp32/Makefile:68: arch/arm64/kernel/vdso-ilp32/vdso-ilp32.so.dbg] Error 1
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
