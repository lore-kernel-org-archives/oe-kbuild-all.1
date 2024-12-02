Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EAD1C695
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Dec 2024 02:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733104813; cv=none; b=NgzWucUsK1x7QjtUZzDs/1T0LOQcKFkr5jkQTaPCS0OqdO2sZfD+rT4X/KcryL2vG3fBNyLUqSVLECUBTwywaVdtKnRZEczSGLcSwHzdlyY0NV2Z1AqI38Jufk1PVmS/2pPBAiGpL1FoOj2OCMy2OcW16ubsRPrH7EuP9FYWYyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733104813; c=relaxed/simple;
	bh=ILQtDv7a0n3HMWSK6tAQAKrpr7ee/4yLuPoA30RevYk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nday77RawnTVj8pA5tzpoyn9iDX3QNl1ERfhKKLMcUsuN0Rch0whLqhGglj8WU7Ic9tb8AypVn0LE0w/HbgWX1j9crVBWTZaOZumec3VD8binc5P1B+9xDHtm7pq/R5vu86yOzdVNAl3fw8S/qj3eEUmacQ63tYccebq1R9x1d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HEfwS5Cp; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HEfwS5Cp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733104812; x=1764640812;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ILQtDv7a0n3HMWSK6tAQAKrpr7ee/4yLuPoA30RevYk=;
  b=HEfwS5CpXwgy6nvjBgfB87W3E1ctLZ+HrIMKE99seI41qxx97jDnsDLG
   2JBXAHOkGq6HKtT1IlfAXbPUrXXr4X2aOqRY3bOY5DY03nqs+e5qKA+8K
   4hDW4L22dLWjIs3/iXnGqo61mKQp8jtOSNmsErtO6MtizXxgTR2LQNCc2
   Y+J66XkKb+0qcagUrshBUQr5joQauy3FM1R/4ArM514QjVQDYO/3NqLNK
   CKVS5a/+RDdjYcDzczLR7YcBfpokHkYxtnPzBd+EHznC4LkyybQ3NDehV
   +lj9AyGhMudzcXucgSmBLgIQH790fmGd5GPkuOGcFAP3AnkmkbcV2y8Wy
   w==;
X-CSE-ConnectionGUID: aZSyWp4MT2uB2YC/4IC6zA==
X-CSE-MsgGUID: QzuNxaTcT9mXOL6qsQogHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="43931102"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="43931102"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 18:00:11 -0800
X-CSE-ConnectionGUID: ZPhulTg/TIaohMhEu6S1FA==
X-CSE-MsgGUID: zGssKSHPSnuqWZVi+58BaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="93135923"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 01 Dec 2024 18:00:10 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHvjI-00020O-2z;
	Mon, 02 Dec 2024 02:00:05 +0000
Date: Mon, 2 Dec 2024 09:59:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wang Nan <wangnan1505@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1294/1294]
 drivers/rtc/rtc-phytium.c:129:12: warning: 'phytium_rtc_alarm_irq_enabled'
 defined but not used
Message-ID: <202412020957.zPaYoioo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   b5504db0db8375a77340b5bb54c17cfb75d3c754
commit: 1ce24a39db64afc5041e3a32893f3e5f1f5d4b9d [1294/1294] rtc: add rtc drivers for Phytium SOCs
config: arm64-randconfig-002-20241114 (https://download.01.org/0day-ci/archive/20241202/202412020957.zPaYoioo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412020957.zPaYoioo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412020957.zPaYoioo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/rtc/rtc-phytium.c: In function 'phytium_rtc_read_time':
   drivers/rtc/rtc-phytium.c:65:23: warning: variable 'tmp' set but not used [-Wunused-but-set-variable]
      65 |         unsigned long tmp = 0;
         |                       ^~~
   drivers/rtc/rtc-phytium.c: In function 'phytium_rtc_set_mmss':
   drivers/rtc/rtc-phytium.c:85:23: warning: variable 'tmp' set but not used [-Wunused-but-set-variable]
      85 |         unsigned long tmp = 0;
         |                       ^~~
   drivers/rtc/rtc-phytium.c:84:23: warning: variable 'counter' set but not used [-Wunused-but-set-variable]
      84 |         unsigned long counter = 0;
         |                       ^~~~~~~
   drivers/rtc/rtc-phytium.c: In function 'phytium_rtc_set_alarm':
   drivers/rtc/rtc-phytium.c:139:23: warning: variable 'rtc_time' set but not used [-Wunused-but-set-variable]
     139 |         unsigned long rtc_time;
         |                       ^~~~~~~~
   drivers/rtc/rtc-phytium.c: At top level:
>> drivers/rtc/rtc-phytium.c:129:12: warning: 'phytium_rtc_alarm_irq_enabled' defined but not used [-Wunused-function]
     129 | static int phytium_rtc_alarm_irq_enabled(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/atomic.h:34,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/arm64/include/asm/bitops.h:37,
                    from include/linux/bitops.h:20,
                    from include/linux/kernel.h:11,
                    from include/linux/list.h:9,
                    from include/linux/module.h:10,
                    from drivers/rtc/rtc-phytium.c:18:
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock' at include/linux/spinlock_api_smp.h:143:2,
       inlined from 'spin_lock' at include/linux/spinlock.h:329:2,
       inlined from 'phytium_rtc_set_mmss' at drivers/rtc/rtc-phytium.c:87:2:
   arch/arm64/include/asm/atomic_lse.h:492:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     492 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_lse.h:515:1: note: in expansion of macro '__CMPXCHG_CASE'
     515 | __CMPXCHG_CASE(w,  , acq_4,  a, "memory")
         | ^~~~~~~~~~~~~~
   drivers/rtc/rtc-phytium.c: In function 'phytium_rtc_set_mmss':
   drivers/rtc/rtc-phytium.c:48:12: note: object 'spinlock_phytium_rtc' of size 4
      48 | spinlock_t spinlock_phytium_rtc;
         |            ^~~~~~~~~~~~~~~~~~~~
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock' at include/linux/spinlock_api_smp.h:143:2,
       inlined from 'spin_lock' at include/linux/spinlock.h:329:2,
       inlined from 'phytium_rtc_set_mmss' at drivers/rtc/rtc-phytium.c:87:2:
   arch/arm64/include/asm/atomic_lse.h:492:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     492 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_lse.h:515:1: note: in expansion of macro '__CMPXCHG_CASE'
     515 | __CMPXCHG_CASE(w,  , acq_4,  a, "memory")
         | ^~~~~~~~~~~~~~
   drivers/rtc/rtc-phytium.c: In function 'phytium_rtc_set_mmss':
   drivers/rtc/rtc-phytium.c:48:12: note: object 'spinlock_phytium_rtc' of size 4
      48 | spinlock_t spinlock_phytium_rtc;
         |            ^~~~~~~~~~~~~~~~~~~~
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock' at include/linux/spinlock_api_smp.h:143:2,
       inlined from 'spin_lock' at include/linux/spinlock.h:329:2,
       inlined from 'phytium_rtc_read_time' at drivers/rtc/rtc-phytium.c:67:2:
   arch/arm64/include/asm/atomic_lse.h:492:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     492 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_lse.h:515:1: note: in expansion of macro '__CMPXCHG_CASE'
     515 | __CMPXCHG_CASE(w,  , acq_4,  a, "memory")
         | ^~~~~~~~~~~~~~
   drivers/rtc/rtc-phytium.c: In function 'phytium_rtc_read_time':
   drivers/rtc/rtc-phytium.c:48:12: note: object 'spinlock_phytium_rtc' of size 4
      48 | spinlock_t spinlock_phytium_rtc;
         |            ^~~~~~~~~~~~~~~~~~~~
   In function '__cmpxchg_case_acq_4',
       inlined from '__cmpxchg_acq' at arch/arm64/include/asm/cmpxchg.h:141:1,
       inlined from 'queued_spin_lock' at include/asm-generic/qspinlock.h:85:8,
       inlined from 'do_raw_spin_lock' at include/linux/spinlock.h:180:2,
       inlined from '__raw_spin_lock' at include/linux/spinlock_api_smp.h:143:2,
       inlined from 'spin_lock' at include/linux/spinlock.h:329:2,
       inlined from 'phytium_rtc_read_time' at drivers/rtc/rtc-phytium.c:67:2:
   arch/arm64/include/asm/atomic_lse.h:492:9: warning: array subscript 'long unsigned int[0]' is partly outside array bounds of 'spinlock_t[1]' {aka 'struct spinlock[1]'} [-Warray-bounds=]
     492 |         asm volatile(                                                   \
         |         ^~~
   arch/arm64/include/asm/atomic_lse.h:515:1: note: in expansion of macro '__CMPXCHG_CASE'
     515 | __CMPXCHG_CASE(w,  , acq_4,  a, "memory")
         | ^~~~~~~~~~~~~~
   drivers/rtc/rtc-phytium.c: In function 'phytium_rtc_read_time':
   drivers/rtc/rtc-phytium.c:48:12: note: object 'spinlock_phytium_rtc' of size 4
      48 | spinlock_t spinlock_phytium_rtc;
         |            ^~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HARDLOCKUP_DETECTOR
   Depends on [n]: DEBUG_KERNEL [=n] && !S390 && (HAVE_HARDLOCKUP_DETECTOR_PERF [=n] || HAVE_HARDLOCKUP_DETECTOR_ARCH [=y])
   Selected by [y]:
   - SDEI_WATCHDOG [=y] && <choice> && ARM_SDE_INTERFACE [=y] && !HARDLOCKUP_CHECK_TIMESTAMP [=n]


vim +/phytium_rtc_alarm_irq_enabled +129 drivers/rtc/rtc-phytium.c

   128	
 > 129	static int phytium_rtc_alarm_irq_enabled(struct device *dev)
   130	{
   131		struct phytium_rtc_dev *pdata = dev_get_drvdata(dev);
   132	
   133		return readl(pdata->csr_base + RTC_CCR) & RTC_CCR_IE ? 1 : 0;
   134	}
   135	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
