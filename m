Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220E341854
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 20:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="En7JcIis"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701895080; x=1733431080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hvgcuwnt2ENQfXc/NHnMEjaSlzCkUOLhLPBqWBa7fho=;
  b=En7JcIisTBjBWYFk+SF2fDyxTpubjP03z79a3CvoXNPpoBTl8+ppcnvN
   dLD2hX4SUguQOpVkL4yb3IvKXWEkkPfY2GNJFod9UId9GBsue53mYpKnc
   6lInQMeiibp/vc6mANzpd+6IKCfo/tR/2TZlylxrpqnEHVi146l8eb9+x
   2GL1jlN8NT6DjALGsAOlVlAWtHGobrIk1G0jgCplP3+cc7XlDxwH4prQH
   iVurs4X15KD9MKRpQYydGLANIlzGQRVCG3/dRdRpS2JPWqqYsPSsNLPaw
   YHrizxmqw+Cnlnm3iFgAOc4tQeQ7ErReG/XjaqfkZUTr9zr7c4bVue3sr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="373602005"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="373602005"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 12:37:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="771430324"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="771430324"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 06 Dec 2023 12:37:57 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAyeZ-000BOo-0p;
	Wed, 06 Dec 2023 20:37:55 +0000
Date: Thu, 7 Dec 2023 04:37:00 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:perf/overflow 1/3] arch/arm/kernel/perf_event_xscale.c:503:9:
 error: 'regs' undeclared
Message-ID: <202312070442.hY4d9WVX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git perf/overflow
head:   f3b357f85dad79444f2d0c645833fb947de1e88d
commit: 80783e59015586b6cb6b3211b0753822929e6969 [1/3] arm_pmu: centralise event overflow handling
config: arm-pxa_defconfig (https://download.01.org/0day-ci/archive/20231207/202312070442.hY4d9WVX-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231207/202312070442.hY4d9WVX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312070442.hY4d9WVX-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm/kernel/perf_event_xscale.c:61:51: warning: initialized field overwritten [-Woverride-init]
      61 |         [PERF_COUNT_HW_CPU_CYCLES]              = XSCALE_PERFCTR_CCNT,
         |                                                   ^~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/perf_event_xscale.c:61:51: note: (near initialization for 'xscale_perf_map[0]')
   arch/arm/kernel/perf_event_xscale.c:62:51: warning: initialized field overwritten [-Woverride-init]
      62 |         [PERF_COUNT_HW_INSTRUCTIONS]            = XSCALE_PERFCTR_INSTRUCTION,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/perf_event_xscale.c:62:51: note: (near initialization for 'xscale_perf_map[1]')
   arch/arm/kernel/perf_event_xscale.c:63:51: warning: initialized field overwritten [-Woverride-init]
      63 |         [PERF_COUNT_HW_BRANCH_INSTRUCTIONS]     = XSCALE_PERFCTR_BRANCH,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/perf_event_xscale.c:63:51: note: (near initialization for 'xscale_perf_map[4]')
   arch/arm/kernel/perf_event_xscale.c:64:51: warning: initialized field overwritten [-Woverride-init]
      64 |         [PERF_COUNT_HW_BRANCH_MISSES]           = XSCALE_PERFCTR_BRANCH_MISS,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/perf_event_xscale.c:64:51: note: (near initialization for 'xscale_perf_map[5]')
   arch/arm/kernel/perf_event_xscale.c:65:51: warning: initialized field overwritten [-Woverride-init]
      65 |         [PERF_COUNT_HW_STALLED_CYCLES_FRONTEND] = XSCALE_PERFCTR_ICACHE_NO_DELIVER,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/perf_event_xscale.c:65:51: note: (near initialization for 'xscale_perf_map[7]')
   arch/arm/kernel/perf_event_xscale.c:73:51: warning: initialized field overwritten [-Woverride-init]
      73 |         [C(L1D)][C(OP_READ)][C(RESULT_ACCESS)]  = XSCALE_PERFCTR_DCACHE_ACCESS,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/perf_event_xscale.c:73:51: note: (near initialization for 'xscale_perf_cache_map[0][0][0]')
   arch/arm/kernel/perf_event_xscale.c:74:51: warning: initialized field overwritten [-Woverride-init]
      74 |         [C(L1D)][C(OP_READ)][C(RESULT_MISS)]    = XSCALE_PERFCTR_DCACHE_MISS,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/perf_event_xscale.c:74:51: note: (near initialization for 'xscale_perf_cache_map[0][0][1]')
   arch/arm/kernel/perf_event_xscale.c:75:51: warning: initialized field overwritten [-Woverride-init]
      75 |         [C(L1D)][C(OP_WRITE)][C(RESULT_ACCESS)] = XSCALE_PERFCTR_DCACHE_ACCESS,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/perf_event_xscale.c:75:51: note: (near initialization for 'xscale_perf_cache_map[0][1][0]')
   arch/arm/kernel/perf_event_xscale.c:76:51: warning: initialized field overwritten [-Woverride-init]
      76 |         [C(L1D)][C(OP_WRITE)][C(RESULT_MISS)]   = XSCALE_PERFCTR_DCACHE_MISS,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/perf_event_xscale.c:76:51: note: (near initialization for 'xscale_perf_cache_map[0][1][1]')
   arch/arm/kernel/perf_event_xscale.c:78:51: warning: initialized field overwritten [-Woverride-init]
      78 |         [C(L1I)][C(OP_READ)][C(RESULT_MISS)]    = XSCALE_PERFCTR_ICACHE_MISS,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/perf_event_xscale.c:78:51: note: (near initialization for 'xscale_perf_cache_map[1][0][1]')
   arch/arm/kernel/perf_event_xscale.c:80:51: warning: initialized field overwritten [-Woverride-init]
      80 |         [C(DTLB)][C(OP_READ)][C(RESULT_MISS)]   = XSCALE_PERFCTR_DTLB_MISS,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/perf_event_xscale.c:80:51: note: (near initialization for 'xscale_perf_cache_map[3][0][1]')
   arch/arm/kernel/perf_event_xscale.c:81:51: warning: initialized field overwritten [-Woverride-init]
      81 |         [C(DTLB)][C(OP_WRITE)][C(RESULT_MISS)]  = XSCALE_PERFCTR_DTLB_MISS,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/perf_event_xscale.c:81:51: note: (near initialization for 'xscale_perf_cache_map[3][1][1]')
   arch/arm/kernel/perf_event_xscale.c:83:51: warning: initialized field overwritten [-Woverride-init]
      83 |         [C(ITLB)][C(OP_READ)][C(RESULT_MISS)]   = XSCALE_PERFCTR_ITLB_MISS,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/perf_event_xscale.c:83:51: note: (near initialization for 'xscale_perf_cache_map[4][0][1]')
   arch/arm/kernel/perf_event_xscale.c:84:51: warning: initialized field overwritten [-Woverride-init]
      84 |         [C(ITLB)][C(OP_WRITE)][C(RESULT_MISS)]  = XSCALE_PERFCTR_ITLB_MISS,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/perf_event_xscale.c:84:51: note: (near initialization for 'xscale_perf_cache_map[4][1][1]')
   arch/arm/kernel/perf_event_xscale.c: In function 'xscale2pmu_handle_irq':
>> arch/arm/kernel/perf_event_xscale.c:503:9: error: 'regs' undeclared (first use in this function)
     503 |         regs = get_irq_regs();
         |         ^~~~
   arch/arm/kernel/perf_event_xscale.c:503:9: note: each undeclared identifier is reported only once for each function it appears in


vim +/regs +503 arch/arm/kernel/perf_event_xscale.c

43eab87828fee6 Will Deacon  2010-11-13  483  
43eab87828fee6 Will Deacon  2010-11-13  484  static irqreturn_t
0788f1e97324d8 Mark Rutland 2018-05-10  485  xscale2pmu_handle_irq(struct arm_pmu *cpu_pmu)
43eab87828fee6 Will Deacon  2010-11-13  486  {
43eab87828fee6 Will Deacon  2010-11-13  487  	unsigned long pmnc, of_flags;
11679250860700 Mark Rutland 2014-05-13  488  	struct pmu_hw_events *cpuc = this_cpu_ptr(cpu_pmu->hw_events);
43eab87828fee6 Will Deacon  2010-11-13  489  	int idx;
43eab87828fee6 Will Deacon  2010-11-13  490  
43eab87828fee6 Will Deacon  2010-11-13  491  	/* Disable the PMU. */
43eab87828fee6 Will Deacon  2010-11-13  492  	pmnc = xscale2pmu_read_pmnc();
43eab87828fee6 Will Deacon  2010-11-13  493  	xscale2pmu_write_pmnc(pmnc & ~XSCALE_PMU_ENABLE);
43eab87828fee6 Will Deacon  2010-11-13  494  
43eab87828fee6 Will Deacon  2010-11-13  495  	/* Check the overflow flag register. */
43eab87828fee6 Will Deacon  2010-11-13  496  	of_flags = xscale2pmu_read_overflow_flags();
43eab87828fee6 Will Deacon  2010-11-13  497  	if (!(of_flags & XSCALE2_OVERFLOWED_MASK))
43eab87828fee6 Will Deacon  2010-11-13  498  		return IRQ_NONE;
43eab87828fee6 Will Deacon  2010-11-13  499  
43eab87828fee6 Will Deacon  2010-11-13  500  	/* Clear the overflow bits. */
43eab87828fee6 Will Deacon  2010-11-13  501  	xscale2pmu_write_overflow_flags(of_flags);
43eab87828fee6 Will Deacon  2010-11-13  502  
43eab87828fee6 Will Deacon  2010-11-13 @503  	regs = get_irq_regs();
43eab87828fee6 Will Deacon  2010-11-13  504  
8be3f9a2385f91 Mark Rutland 2011-05-17  505  	for (idx = 0; idx < cpu_pmu->num_events; ++idx) {
43eab87828fee6 Will Deacon  2010-11-13  506  		struct perf_event *event = cpuc->events[idx];
43eab87828fee6 Will Deacon  2010-11-13  507  
f6f5a30c834135 Will Deacon  2012-03-06  508  		if (!event)
f6f5a30c834135 Will Deacon  2012-03-06  509  			continue;
f6f5a30c834135 Will Deacon  2012-03-06  510  
3f31ae121348af Will Deacon  2012-03-06  511  		if (!xscale2_pmnc_counter_has_overflowed(of_flags, idx))
43eab87828fee6 Will Deacon  2010-11-13  512  			continue;
43eab87828fee6 Will Deacon  2010-11-13  513  
80783e59015586 Mark Rutland 2023-12-05  514  		armpmu_event_overflow(event);
43eab87828fee6 Will Deacon  2010-11-13  515  	}
43eab87828fee6 Will Deacon  2010-11-13  516  
43eab87828fee6 Will Deacon  2010-11-13  517  	irq_work_run();
43eab87828fee6 Will Deacon  2010-11-13  518  
43eab87828fee6 Will Deacon  2010-11-13  519  	/*
43eab87828fee6 Will Deacon  2010-11-13  520  	 * Re-enable the PMU.
43eab87828fee6 Will Deacon  2010-11-13  521  	 */
43eab87828fee6 Will Deacon  2010-11-13  522  	pmnc = xscale2pmu_read_pmnc() | XSCALE_PMU_ENABLE;
43eab87828fee6 Will Deacon  2010-11-13  523  	xscale2pmu_write_pmnc(pmnc);
43eab87828fee6 Will Deacon  2010-11-13  524  
43eab87828fee6 Will Deacon  2010-11-13  525  	return IRQ_HANDLED;
43eab87828fee6 Will Deacon  2010-11-13  526  }
43eab87828fee6 Will Deacon  2010-11-13  527  

:::::: The code at line 503 was first introduced by commit
:::::: 43eab87828fee65f89f4088736b2b7a187390a2f ARM: perf: separate PMU backends into multiple files

:::::: TO: Will Deacon <will.deacon@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
