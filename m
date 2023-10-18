Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF9681A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 21:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CxHVGnuQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697666252; x=1729202252;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=36ikw7MJpyJMEmz0vbQNVf4k9ZLd1untVmbtLJLNOYQ=;
  b=CxHVGnuQ+NhVy4vY4yTGGqbdlHqIW6N55j6gEsqXbMRGILijI6R/1JG4
   qBC1lwYOfB+nRyB3SBTY1b5qjEUE5re4eg5OAGHDIaNKPIrUVjAPaebvH
   QQ8zSNZD6Y+Su9XqIRQNkesVI2FU8JnOpkfJt+IKu6XbK9TIg1w1W9824
   xXgD843oqYE3Y0Ok0YQnuzSeVCGc9eBGzq8ysP7L7G1ldYZXJ5/GprNCw
   NgKiRm9w2elYA1T4kAcGZdXFn6MV1b7hGl9YRRA1b4AenhazNjr1aPt71
   aVO1fTGZIVD9cJeHIqf3ntXIs3NyffcqYF9iwlKBBdx7vGAaSxPz6v3/U
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="376492670"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="376492670"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 14:57:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="760386433"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="760386433"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 18 Oct 2023 14:57:27 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtEXd-00017u-1w;
	Wed, 18 Oct 2023 21:57:25 +0000
Date: Thu, 19 Oct 2023 05:56:43 +0800
From: kernel test robot <lkp@intel.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/2] arm: perf: Remove PMU locking
Message-ID: <202310190527.jpb5nJNH-lkp@intel.com>
References: <20231016052431.1390269-2-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016052431.1390269-2-anshuman.khandual@arm.com>

Hi Anshuman,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on perf-tools-next/perf-tools-next]
[also build test WARNING on tip/perf/core perf-tools/perf-tools linus/master acme/perf/core v6.6-rc6 next-20231018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anshuman-Khandual/arm-perf-Remove-PMU-locking/20231017-142418
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20231016052431.1390269-2-anshuman.khandual%40arm.com
patch subject: [RFC 1/2] arm: perf: Remove PMU locking
config: arm-randconfig-003-20231019 (https://download.01.org/0day-ci/archive/20231019/202310190527.jpb5nJNH-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310190527.jpb5nJNH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310190527.jpb5nJNH-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   arch/arm/kernel/perf_event_v6.c: In function 'armv6pmu_enable_event':
>> arch/arm/kernel/perf_event_v6.c:274:31: warning: unused variable 'events' [-Wunused-variable]
     274 |         struct pmu_hw_events *events = this_cpu_ptr(cpu_pmu->hw_events);
         |                               ^~~~~~
   arch/arm/kernel/perf_event_v6.c: In function 'armv6pmu_start':
   arch/arm/kernel/perf_event_v6.c:364:31: warning: unused variable 'events' [-Wunused-variable]
     364 |         struct pmu_hw_events *events = this_cpu_ptr(cpu_pmu->hw_events);
         |                               ^~~~~~
   arch/arm/kernel/perf_event_v6.c: In function 'armv6pmu_stop':
   arch/arm/kernel/perf_event_v6.c:374:31: warning: unused variable 'events' [-Wunused-variable]
     374 |         struct pmu_hw_events *events = this_cpu_ptr(cpu_pmu->hw_events);
         |                               ^~~~~~
   arch/arm/kernel/perf_event_v6.c: In function 'armv6pmu_disable_event':
   arch/arm/kernel/perf_event_v6.c:419:31: warning: unused variable 'events' [-Wunused-variable]
     419 |         struct pmu_hw_events *events = this_cpu_ptr(cpu_pmu->hw_events);
         |                               ^~~~~~
   arch/arm/kernel/perf_event_v6.c: In function 'armv6mpcore_pmu_disable_event':
   arch/arm/kernel/perf_event_v6.c:452:31: warning: unused variable 'events' [-Wunused-variable]
     452 |         struct pmu_hw_events *events = this_cpu_ptr(cpu_pmu->hw_events);
         |                               ^~~~~~


vim +/events +274 arch/arm/kernel/perf_event_v6.c

43eab87828fee6 Will Deacon       2010-11-13  268  
ed6f2a522398c2 Sudeep Holla      2012-07-30  269  static void armv6pmu_enable_event(struct perf_event *event)
43eab87828fee6 Will Deacon       2010-11-13  270  {
a03e5d1ee878e9 Anshuman Khandual 2023-10-16  271  	unsigned long val, mask, evt;
ed6f2a522398c2 Sudeep Holla      2012-07-30  272  	struct arm_pmu *cpu_pmu = to_arm_pmu(event->pmu);
ed6f2a522398c2 Sudeep Holla      2012-07-30  273  	struct hw_perf_event *hwc = &event->hw;
11679250860700 Mark Rutland      2014-05-13 @274  	struct pmu_hw_events *events = this_cpu_ptr(cpu_pmu->hw_events);
ed6f2a522398c2 Sudeep Holla      2012-07-30  275  	int idx = hwc->idx;
43eab87828fee6 Will Deacon       2010-11-13  276  
43eab87828fee6 Will Deacon       2010-11-13  277  	if (ARMV6_CYCLE_COUNTER == idx) {
43eab87828fee6 Will Deacon       2010-11-13  278  		mask	= 0;
43eab87828fee6 Will Deacon       2010-11-13  279  		evt	= ARMV6_PMCR_CCOUNT_IEN;
43eab87828fee6 Will Deacon       2010-11-13  280  	} else if (ARMV6_COUNTER0 == idx) {
43eab87828fee6 Will Deacon       2010-11-13  281  		mask	= ARMV6_PMCR_EVT_COUNT0_MASK;
43eab87828fee6 Will Deacon       2010-11-13  282  		evt	= (hwc->config_base << ARMV6_PMCR_EVT_COUNT0_SHIFT) |
43eab87828fee6 Will Deacon       2010-11-13  283  			  ARMV6_PMCR_COUNT0_IEN;
43eab87828fee6 Will Deacon       2010-11-13  284  	} else if (ARMV6_COUNTER1 == idx) {
43eab87828fee6 Will Deacon       2010-11-13  285  		mask	= ARMV6_PMCR_EVT_COUNT1_MASK;
43eab87828fee6 Will Deacon       2010-11-13  286  		evt	= (hwc->config_base << ARMV6_PMCR_EVT_COUNT1_SHIFT) |
43eab87828fee6 Will Deacon       2010-11-13  287  			  ARMV6_PMCR_COUNT1_IEN;
43eab87828fee6 Will Deacon       2010-11-13  288  	} else {
43eab87828fee6 Will Deacon       2010-11-13  289  		WARN_ONCE(1, "invalid counter number (%d)\n", idx);
43eab87828fee6 Will Deacon       2010-11-13  290  		return;
43eab87828fee6 Will Deacon       2010-11-13  291  	}
43eab87828fee6 Will Deacon       2010-11-13  292  
43eab87828fee6 Will Deacon       2010-11-13  293  	/*
43eab87828fee6 Will Deacon       2010-11-13  294  	 * Mask out the current event and set the counter to count the event
43eab87828fee6 Will Deacon       2010-11-13  295  	 * that we're interested in.
43eab87828fee6 Will Deacon       2010-11-13  296  	 */
43eab87828fee6 Will Deacon       2010-11-13  297  	val = armv6_pmcr_read();
43eab87828fee6 Will Deacon       2010-11-13  298  	val &= ~mask;
43eab87828fee6 Will Deacon       2010-11-13  299  	val |= evt;
43eab87828fee6 Will Deacon       2010-11-13  300  	armv6_pmcr_write(val);
43eab87828fee6 Will Deacon       2010-11-13  301  }
43eab87828fee6 Will Deacon       2010-11-13  302  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
