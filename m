Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637AA6125
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Dec 2023 06:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UYG1HNHW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703314541; x=1734850541;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4+IBR7NBcs1fKZpeMw7lpbLGR/L1Qpr5D3dGyPwjVT8=;
  b=UYG1HNHWU5406jIIVrlg2RSEYrOyzfBsaH8tTlq7wknERgzAx8dpNM/V
   kDKuFESyMwSJKgZU/Js/c/bCgaObakts6Fui5mQsXbQjuXIkQsJYl2YvY
   QmGWbzXid9iRPDwTBFHrhK3i49bOrtCL7B0xBFz9nj136PBEXkZ/5t17b
   qjYLEUUN1doGI0stt96U8pohzeVr5MZo2JR0g+w4E6kT/9SUyWFvp6rBB
   CQ2RU6uRBjZZGhp4Tqof1P77p76OHDylajdI1oy43o8HmL3pEVkcdAAyZ
   AZSPWIYcsCzeUNANKkiUhRGIpLcXGb1Z/jkGjYu3B3xKAsbqzyFL14gk+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="393349213"
X-IronPort-AV: E=Sophos;i="6.04,298,1695711600"; 
   d="scan'208";a="393349213"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2023 22:55:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="920896128"
X-IronPort-AV: E=Sophos;i="6.04,298,1695711600"; 
   d="scan'208";a="920896128"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 22 Dec 2023 22:55:38 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGvv3-000AOP-1X;
	Sat, 23 Dec 2023 06:55:34 +0000
Date: Sat, 23 Dec 2023 14:54:38 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	arm@kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: [soc:soc/arm 5/5] arch/arm/kernel/perf_event_v6.c:455:13: warning:
 'armv6mpcore_pmu_disable_event' defined but not used
Message-ID: <202312231434.wNbFQ3Bx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/arm
head:   2560cffd2134c2e070dee369b37f6e55438087f9
commit: 2560cffd2134c2e070dee369b37f6e55438087f9 [5/5] ARM: Delete ARM11MPCore (ARM11 ARMv6K SMP) support
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20231223/202312231434.wNbFQ3Bx-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231223/202312231434.wNbFQ3Bx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312231434.wNbFQ3Bx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm/kernel/perf_event_v6.c:83:51: warning: initialized field overwritten [-Woverride-init]
      83 |         [PERF_COUNT_HW_STALLED_CYCLES_BACKEND]  = ARMV6_PERFCTR_LSU_FULL_STALL,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/perf_event_v6.c:83:51: note: (near initialization for 'armv6_perf_map[8]')
   arch/arm/kernel/perf_event_v6.c:96:51: warning: initialized field overwritten [-Woverride-init]
      96 |         [C(L1D)][C(OP_READ)][C(RESULT_ACCESS)]  = ARMV6_PERFCTR_DCACHE_ACCESS,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/perf_event_v6.c:96:51: note: (near initialization for 'armv6_perf_cache_map[0][0][0]')
   arch/arm/kernel/perf_event_v6.c:97:51: warning: initialized field overwritten [-Woverride-init]
      97 |         [C(L1D)][C(OP_READ)][C(RESULT_MISS)]    = ARMV6_PERFCTR_DCACHE_MISS,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/perf_event_v6.c:97:51: note: (near initialization for 'armv6_perf_cache_map[0][0][1]')
   arch/arm/kernel/perf_event_v6.c:98:51: warning: initialized field overwritten [-Woverride-init]
      98 |         [C(L1D)][C(OP_WRITE)][C(RESULT_ACCESS)] = ARMV6_PERFCTR_DCACHE_ACCESS,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/perf_event_v6.c:98:51: note: (near initialization for 'armv6_perf_cache_map[0][1][0]')
   arch/arm/kernel/perf_event_v6.c:99:51: warning: initialized field overwritten [-Woverride-init]
      99 |         [C(L1D)][C(OP_WRITE)][C(RESULT_MISS)]   = ARMV6_PERFCTR_DCACHE_MISS,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/perf_event_v6.c:99:51: note: (near initialization for 'armv6_perf_cache_map[0][1][1]')
   arch/arm/kernel/perf_event_v6.c:101:51: warning: initialized field overwritten [-Woverride-init]
     101 |         [C(L1I)][C(OP_READ)][C(RESULT_MISS)]    = ARMV6_PERFCTR_ICACHE_MISS,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/perf_event_v6.c:101:51: note: (near initialization for 'armv6_perf_cache_map[1][0][1]')
   arch/arm/kernel/perf_event_v6.c:109:51: warning: initialized field overwritten [-Woverride-init]
     109 |         [C(DTLB)][C(OP_READ)][C(RESULT_MISS)]   = ARMV6_PERFCTR_DTLB_MISS,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/perf_event_v6.c:109:51: note: (near initialization for 'armv6_perf_cache_map[3][0][1]')
   arch/arm/kernel/perf_event_v6.c:110:51: warning: initialized field overwritten [-Woverride-init]
     110 |         [C(DTLB)][C(OP_WRITE)][C(RESULT_MISS)]  = ARMV6_PERFCTR_DTLB_MISS,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/perf_event_v6.c:110:51: note: (near initialization for 'armv6_perf_cache_map[3][1][1]')
   arch/arm/kernel/perf_event_v6.c:112:51: warning: initialized field overwritten [-Woverride-init]
     112 |         [C(ITLB)][C(OP_READ)][C(RESULT_MISS)]   = ARMV6_PERFCTR_ITLB_MISS,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/perf_event_v6.c:112:51: note: (near initialization for 'armv6_perf_cache_map[4][0][1]')
   arch/arm/kernel/perf_event_v6.c:113:51: warning: initialized field overwritten [-Woverride-init]
     113 |         [C(ITLB)][C(OP_WRITE)][C(RESULT_MISS)]  = ARMV6_PERFCTR_ITLB_MISS,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/perf_event_v6.c:113:51: note: (near initialization for 'armv6_perf_cache_map[4][1][1]')
   arch/arm/kernel/perf_event_v6.c:146:51: warning: initialized field overwritten [-Woverride-init]
     146 |         [PERF_COUNT_HW_CPU_CYCLES]              = ARMV6MPCORE_PERFCTR_CPU_CYCLES,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/perf_event_v6.c:146:51: note: (near initialization for 'armv6mpcore_perf_map[0]')
   arch/arm/kernel/perf_event_v6.c:147:51: warning: initialized field overwritten [-Woverride-init]
     147 |         [PERF_COUNT_HW_INSTRUCTIONS]            = ARMV6MPCORE_PERFCTR_INSTR_EXEC,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/perf_event_v6.c:147:51: note: (near initialization for 'armv6mpcore_perf_map[1]')
   arch/arm/kernel/perf_event_v6.c:148:51: warning: initialized field overwritten [-Woverride-init]
     148 |         [PERF_COUNT_HW_BRANCH_INSTRUCTIONS]     = ARMV6MPCORE_PERFCTR_BR_EXEC,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/perf_event_v6.c:148:51: note: (near initialization for 'armv6mpcore_perf_map[4]')
   arch/arm/kernel/perf_event_v6.c:149:51: warning: initialized field overwritten [-Woverride-init]
     149 |         [PERF_COUNT_HW_BRANCH_MISSES]           = ARMV6MPCORE_PERFCTR_BR_MISPREDICT,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/perf_event_v6.c:149:51: note: (near initialization for 'armv6mpcore_perf_map[5]')
   arch/arm/kernel/perf_event_v6.c:150:51: warning: initialized field overwritten [-Woverride-init]
     150 |         [PERF_COUNT_HW_STALLED_CYCLES_FRONTEND] = ARMV6MPCORE_PERFCTR_IBUF_STALL,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/perf_event_v6.c:150:51: note: (near initialization for 'armv6mpcore_perf_map[7]')
   arch/arm/kernel/perf_event_v6.c:151:51: warning: initialized field overwritten [-Woverride-init]
     151 |         [PERF_COUNT_HW_STALLED_CYCLES_BACKEND]  = ARMV6MPCORE_PERFCTR_LSU_FULL_STALL,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/perf_event_v6.c:151:51: note: (near initialization for 'armv6mpcore_perf_map[8]')
   arch/arm/kernel/perf_event_v6.c:159:51: warning: initialized field overwritten [-Woverride-init]
     159 |         [C(L1D)][C(OP_READ)][C(RESULT_ACCESS)]  = ARMV6MPCORE_PERFCTR_DCACHE_RDACCESS,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/perf_event_v6.c:159:51: note: (near initialization for 'armv6mpcore_perf_cache_map[0][0][0]')
   arch/arm/kernel/perf_event_v6.c:160:51: warning: initialized field overwritten [-Woverride-init]
     160 |         [C(L1D)][C(OP_READ)][C(RESULT_MISS)]    = ARMV6MPCORE_PERFCTR_DCACHE_RDMISS,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/perf_event_v6.c:160:51: note: (near initialization for 'armv6mpcore_perf_cache_map[0][0][1]')
   arch/arm/kernel/perf_event_v6.c:161:51: warning: initialized field overwritten [-Woverride-init]
     161 |         [C(L1D)][C(OP_WRITE)][C(RESULT_ACCESS)] = ARMV6MPCORE_PERFCTR_DCACHE_WRACCESS,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/perf_event_v6.c:161:51: note: (near initialization for 'armv6mpcore_perf_cache_map[0][1][0]')
   arch/arm/kernel/perf_event_v6.c:162:51: warning: initialized field overwritten [-Woverride-init]
     162 |         [C(L1D)][C(OP_WRITE)][C(RESULT_MISS)]   = ARMV6MPCORE_PERFCTR_DCACHE_WRMISS,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/perf_event_v6.c:162:51: note: (near initialization for 'armv6mpcore_perf_cache_map[0][1][1]')
   arch/arm/kernel/perf_event_v6.c:164:51: warning: initialized field overwritten [-Woverride-init]
     164 |         [C(L1I)][C(OP_READ)][C(RESULT_MISS)]    = ARMV6MPCORE_PERFCTR_ICACHE_MISS,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/perf_event_v6.c:164:51: note: (near initialization for 'armv6mpcore_perf_cache_map[1][0][1]')
   arch/arm/kernel/perf_event_v6.c:172:51: warning: initialized field overwritten [-Woverride-init]
     172 |         [C(DTLB)][C(OP_READ)][C(RESULT_MISS)]   = ARMV6MPCORE_PERFCTR_DTLB_MISS,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/perf_event_v6.c:172:51: note: (near initialization for 'armv6mpcore_perf_cache_map[3][0][1]')
   arch/arm/kernel/perf_event_v6.c:173:51: warning: initialized field overwritten [-Woverride-init]
     173 |         [C(DTLB)][C(OP_WRITE)][C(RESULT_MISS)]  = ARMV6MPCORE_PERFCTR_DTLB_MISS,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/perf_event_v6.c:173:51: note: (near initialization for 'armv6mpcore_perf_cache_map[3][1][1]')
   arch/arm/kernel/perf_event_v6.c:175:51: warning: initialized field overwritten [-Woverride-init]
     175 |         [C(ITLB)][C(OP_READ)][C(RESULT_MISS)]   = ARMV6MPCORE_PERFCTR_ITLB_MISS,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/perf_event_v6.c:175:51: note: (near initialization for 'armv6mpcore_perf_cache_map[4][0][1]')
   arch/arm/kernel/perf_event_v6.c:176:51: warning: initialized field overwritten [-Woverride-init]
     176 |         [C(ITLB)][C(OP_WRITE)][C(RESULT_MISS)]  = ARMV6MPCORE_PERFCTR_ITLB_MISS,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/perf_event_v6.c:176:51: note: (near initialization for 'armv6mpcore_perf_cache_map[4][1][1]')
>> arch/arm/kernel/perf_event_v6.c:455:13: warning: 'armv6mpcore_pmu_disable_event' defined but not used [-Wunused-function]
     455 | static void armv6mpcore_pmu_disable_event(struct perf_event *event)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm/kernel/perf_event_v6.c:154:23: warning: 'armv6mpcore_perf_cache_map' defined but not used [-Wunused-const-variable=]
     154 | static const unsigned armv6mpcore_perf_cache_map[PERF_COUNT_HW_CACHE_MAX]
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm/kernel/perf_event_v6.c:144:23: warning: 'armv6mpcore_perf_map' defined but not used [-Wunused-const-variable=]
     144 | static const unsigned armv6mpcore_perf_map[PERF_COUNT_HW_MAX] = {
         |                       ^~~~~~~~~~~~~~~~~~~~


vim +/armv6mpcore_pmu_disable_event +455 arch/arm/kernel/perf_event_v6.c

43eab87828fee6 Will Deacon  2010-11-13  454  
ed6f2a522398c2 Sudeep Holla 2012-07-30 @455  static void armv6mpcore_pmu_disable_event(struct perf_event *event)
43eab87828fee6 Will Deacon  2010-11-13  456  {
43eab87828fee6 Will Deacon  2010-11-13  457  	unsigned long val, mask, flags, evt = 0;
ed6f2a522398c2 Sudeep Holla 2012-07-30  458  	struct arm_pmu *cpu_pmu = to_arm_pmu(event->pmu);
ed6f2a522398c2 Sudeep Holla 2012-07-30  459  	struct hw_perf_event *hwc = &event->hw;
11679250860700 Mark Rutland 2014-05-13  460  	struct pmu_hw_events *events = this_cpu_ptr(cpu_pmu->hw_events);
ed6f2a522398c2 Sudeep Holla 2012-07-30  461  	int idx = hwc->idx;
43eab87828fee6 Will Deacon  2010-11-13  462  
43eab87828fee6 Will Deacon  2010-11-13  463  	if (ARMV6_CYCLE_COUNTER == idx) {
43eab87828fee6 Will Deacon  2010-11-13  464  		mask	= ARMV6_PMCR_CCOUNT_IEN;
43eab87828fee6 Will Deacon  2010-11-13  465  	} else if (ARMV6_COUNTER0 == idx) {
43eab87828fee6 Will Deacon  2010-11-13  466  		mask	= ARMV6_PMCR_COUNT0_IEN;
43eab87828fee6 Will Deacon  2010-11-13  467  	} else if (ARMV6_COUNTER1 == idx) {
43eab87828fee6 Will Deacon  2010-11-13  468  		mask	= ARMV6_PMCR_COUNT1_IEN;
43eab87828fee6 Will Deacon  2010-11-13  469  	} else {
43eab87828fee6 Will Deacon  2010-11-13  470  		WARN_ONCE(1, "invalid counter number (%d)\n", idx);
43eab87828fee6 Will Deacon  2010-11-13  471  		return;
43eab87828fee6 Will Deacon  2010-11-13  472  	}
43eab87828fee6 Will Deacon  2010-11-13  473  
43eab87828fee6 Will Deacon  2010-11-13  474  	/*
43eab87828fee6 Will Deacon  2010-11-13  475  	 * Unlike UP ARMv6, we don't have a way of stopping the counters. We
43eab87828fee6 Will Deacon  2010-11-13  476  	 * simply disable the interrupt reporting.
43eab87828fee6 Will Deacon  2010-11-13  477  	 */
0f78d2d5ccf72e Mark Rutland 2011-04-28  478  	raw_spin_lock_irqsave(&events->pmu_lock, flags);
43eab87828fee6 Will Deacon  2010-11-13  479  	val = armv6_pmcr_read();
43eab87828fee6 Will Deacon  2010-11-13  480  	val &= ~mask;
43eab87828fee6 Will Deacon  2010-11-13  481  	val |= evt;
43eab87828fee6 Will Deacon  2010-11-13  482  	armv6_pmcr_write(val);
0f78d2d5ccf72e Mark Rutland 2011-04-28  483  	raw_spin_unlock_irqrestore(&events->pmu_lock, flags);
43eab87828fee6 Will Deacon  2010-11-13  484  }
43eab87828fee6 Will Deacon  2010-11-13  485  

:::::: The code at line 455 was first introduced by commit
:::::: ed6f2a522398c26559f4da23a80aa6195e6284c7 ARM: perf: consistently use struct perf_event in arm_pmu functions

:::::: TO: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
