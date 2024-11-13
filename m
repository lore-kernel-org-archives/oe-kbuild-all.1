Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DB5206E9E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 21:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731532599; cv=none; b=qEcMhQyPDJZuXatFhExv3ecu/8Xlt2oq4sTxiQ6WtxuWXJIxOu+H5UHFhkQt4XMagfNYLjLFVCG34bgNZ5FmP5MYXhGrPV7gW/ZEUVJKk8IuQoNDcQFsDWV3xAvKQQGrDuR9Fu7JKtr8Ljl+LLkg7mcidMgFVEuagkeUdINgQCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731532599; c=relaxed/simple;
	bh=mKv7JAXcGiuFPMOgoh7qREHc7ZpsvJsnzB6/TM7r48A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yg941kh5dzoppRefvhdNXPwZODfRJ/HZUERlLYSWhJHWiR8VfCWRcLWn4DM30j1RsC4Y7asAhwvh3UhbwNiGmKV3832RsEOasFMDkfa0ClfyvwG4fPVU+ayxxEAQ0ACMipm2542k5a5m6XboCYIaHSy/ZRkFDYUYAzSaQsNu93w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dn3krag6; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dn3krag6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731532598; x=1763068598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mKv7JAXcGiuFPMOgoh7qREHc7ZpsvJsnzB6/TM7r48A=;
  b=Dn3krag6vmDPeo+HQRRTdCC4jcy9D5bBg3E4pBJC6agfDHIrzq9EjNBy
   Oxpyr3OTPy2FYt5oN1sH7lwI8y7To0SUMuOnpK1+2N/OKG9ZbPTQOmPcJ
   vd9nvyx1aQv6um91mbEFg0L1sa2zXGJain80vcDUz1NssX4JWnK0DNr2L
   dJNE4WumLX1ygN93Wv8VSz3R8rGLgAyXFznaV40Lp2DshFJAZqEODSx+6
   iggh/V/zmHkyl6ey5LX/2nIijOgIeCvJwlRLpOxIqsyzd9hqLVCsTFKO7
   MGU3kHhKan37UCFVO2ce1RtGJHPPLyGw3td6dQpwaFR94rvoLWVDfkCmq
   g==;
X-CSE-ConnectionGUID: 4iimQm7wSQ+qYCDB1R3LIA==
X-CSE-MsgGUID: CJTCjSt5Q0urbGHc/HQRnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="35375288"
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="35375288"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 13:16:37 -0800
X-CSE-ConnectionGUID: CU687OGtS4OsBl9XZjIPpA==
X-CSE-MsgGUID: nOFSdgcvRB+erxUKCKXTKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="88405585"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Nov 2024 13:16:36 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBKj4-0000j7-0M;
	Wed, 13 Nov 2024 21:16:34 +0000
Date: Thu, 14 Nov 2024 05:15:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wang Nan <wangnan1505@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1294/1294]
 drivers/rtc/rtc-phytium.c:129:12: warning: 'phytium_rtc_alarm_irq_enabled'
 defined but not used
Message-ID: <202411140519.n2BlgtJC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a81d020c58c2c6a55ebaf15846470a9ecb69bd1a
commit: 1ce24a39db64afc5041e3a32893f3e5f1f5d4b9d [1294/1294] rtc: add rtc drivers for Phytium SOCs
config: arm64-randconfig-002-20241114 (https://download.01.org/0day-ci/archive/20241114/202411140519.n2BlgtJC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241114/202411140519.n2BlgtJC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411140519.n2BlgtJC-lkp@intel.com/

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
