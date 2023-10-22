Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF5F360
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 00:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fnHtn2IE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697933194; x=1729469194;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5slDFKjnZMNBBD6pzBcV++erWDTTcH+cYmpMZIKXiBk=;
  b=fnHtn2IEXFLG2KcX6SymHto2Pm3CmvcjXd2biyiKd9xEYyHJM8L9jPaR
   idCFTgm55d5FSbbv8hEUGSGenRArLvT2vxsGChCYziAYW2eUIEmJmUOq4
   ilSm7R2bpdO45lbr9M8N9hO9XBPJzVIR4gZEHAAW+cF0BLKpdR4P0563A
   8uTygXa4bsrCmoX1MYeA/tCycBcrYWe+2jsG/bTCCSwxPg44JWvVCWzSY
   htvGQB0DmVucPy4ot31DoxP8TDcRv+HquffOviFexgP1IrkUoDaM3HjIt
   hMkhRdJBBH9u26mT61kQKJ94FDKNBbZrYYdlBkZK86kIOGJfMoAQZEeKP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="385554284"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="385554284"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 17:06:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="761388238"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="761388238"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 21 Oct 2023 17:06:31 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quLzC-0005PY-1J;
	Sun, 22 Oct 2023 00:06:30 +0000
Date: Sun, 22 Oct 2023 08:05:54 +0800
From: kernel test robot <lkp@intel.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/2] arm: perf: Remove PMU locking
Message-ID: <202310220734.qqOiDabZ-lkp@intel.com>
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
[also build test WARNING on tip/perf/core perf-tools/perf-tools linus/master acme/perf/core v6.6-rc6 next-20231020]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anshuman-Khandual/arm-perf-Remove-PMU-locking/20231017-142418
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20231016052431.1390269-2-anshuman.khandual%40arm.com
patch subject: [RFC 1/2] arm: perf: Remove PMU locking
config: arm-spitz_defconfig (https://download.01.org/0day-ci/archive/20231022/202310220734.qqOiDabZ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231022/202310220734.qqOiDabZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310220734.qqOiDabZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   arch/arm/kernel/perf_event_xscale.c: In function 'xscale1pmu_enable_event':
>> arch/arm/kernel/perf_event_xscale.c:209:31: warning: unused variable 'events' [-Wunused-variable]
     209 |         struct pmu_hw_events *events = this_cpu_ptr(cpu_pmu->hw_events);
         |                               ^~~~~~
   arch/arm/kernel/perf_event_xscale.c: In function 'xscale1pmu_disable_event':
   arch/arm/kernel/perf_event_xscale.c:243:31: warning: unused variable 'events' [-Wunused-variable]
     243 |         struct pmu_hw_events *events = this_cpu_ptr(cpu_pmu->hw_events);
         |                               ^~~~~~
   arch/arm/kernel/perf_event_xscale.c: In function 'xscale1pmu_start':
   arch/arm/kernel/perf_event_xscale.c:300:31: warning: unused variable 'events' [-Wunused-variable]
     300 |         struct pmu_hw_events *events = this_cpu_ptr(cpu_pmu->hw_events);
         |                               ^~~~~~
   arch/arm/kernel/perf_event_xscale.c: In function 'xscale1pmu_stop':
   arch/arm/kernel/perf_event_xscale.c:310:31: warning: unused variable 'events' [-Wunused-variable]
     310 |         struct pmu_hw_events *events = this_cpu_ptr(cpu_pmu->hw_events);
         |                               ^~~~~~
   arch/arm/kernel/perf_event_xscale.c: In function 'xscale2pmu_enable_event':
   arch/arm/kernel/perf_event_xscale.c:547:31: warning: unused variable 'events' [-Wunused-variable]
     547 |         struct pmu_hw_events *events = this_cpu_ptr(cpu_pmu->hw_events);
         |                               ^~~~~~
   arch/arm/kernel/perf_event_xscale.c: In function 'xscale2pmu_disable_event':
   arch/arm/kernel/perf_event_xscale.c:591:31: warning: unused variable 'events' [-Wunused-variable]
     591 |         struct pmu_hw_events *events = this_cpu_ptr(cpu_pmu->hw_events);
         |                               ^~~~~~
>> arch/arm/kernel/perf_event_xscale.c:588:23: warning: unused variable 'flags' [-Wunused-variable]
     588 |         unsigned long flags, ien, evtsel, of_flags;
         |                       ^~~~~
   arch/arm/kernel/perf_event_xscale.c: In function 'xscale2pmu_start':
   arch/arm/kernel/perf_event_xscale.c:655:31: warning: unused variable 'events' [-Wunused-variable]
     655 |         struct pmu_hw_events *events = this_cpu_ptr(cpu_pmu->hw_events);
         |                               ^~~~~~
   arch/arm/kernel/perf_event_xscale.c: In function 'xscale2pmu_stop':
   arch/arm/kernel/perf_event_xscale.c:665:31: warning: unused variable 'events' [-Wunused-variable]
     665 |         struct pmu_hw_events *events = this_cpu_ptr(cpu_pmu->hw_events);
         |                               ^~~~~~


vim +/events +209 arch/arm/kernel/perf_event_xscale.c

43eab87828fee6 Will Deacon       2010-11-13  203  
ed6f2a522398c2 Sudeep Holla      2012-07-30  204  static void xscale1pmu_enable_event(struct perf_event *event)
43eab87828fee6 Will Deacon       2010-11-13  205  {
a03e5d1ee878e9 Anshuman Khandual 2023-10-16  206  	unsigned long val, mask, evt;
ed6f2a522398c2 Sudeep Holla      2012-07-30  207  	struct arm_pmu *cpu_pmu = to_arm_pmu(event->pmu);
ed6f2a522398c2 Sudeep Holla      2012-07-30  208  	struct hw_perf_event *hwc = &event->hw;
11679250860700 Mark Rutland      2014-05-13 @209  	struct pmu_hw_events *events = this_cpu_ptr(cpu_pmu->hw_events);
ed6f2a522398c2 Sudeep Holla      2012-07-30  210  	int idx = hwc->idx;
43eab87828fee6 Will Deacon       2010-11-13  211  
43eab87828fee6 Will Deacon       2010-11-13  212  	switch (idx) {
43eab87828fee6 Will Deacon       2010-11-13  213  	case XSCALE_CYCLE_COUNTER:
43eab87828fee6 Will Deacon       2010-11-13  214  		mask = 0;
43eab87828fee6 Will Deacon       2010-11-13  215  		evt = XSCALE1_CCOUNT_INT_EN;
43eab87828fee6 Will Deacon       2010-11-13  216  		break;
43eab87828fee6 Will Deacon       2010-11-13  217  	case XSCALE_COUNTER0:
43eab87828fee6 Will Deacon       2010-11-13  218  		mask = XSCALE1_COUNT0_EVT_MASK;
43eab87828fee6 Will Deacon       2010-11-13  219  		evt = (hwc->config_base << XSCALE1_COUNT0_EVT_SHFT) |
43eab87828fee6 Will Deacon       2010-11-13  220  			XSCALE1_COUNT0_INT_EN;
43eab87828fee6 Will Deacon       2010-11-13  221  		break;
43eab87828fee6 Will Deacon       2010-11-13  222  	case XSCALE_COUNTER1:
43eab87828fee6 Will Deacon       2010-11-13  223  		mask = XSCALE1_COUNT1_EVT_MASK;
43eab87828fee6 Will Deacon       2010-11-13  224  		evt = (hwc->config_base << XSCALE1_COUNT1_EVT_SHFT) |
43eab87828fee6 Will Deacon       2010-11-13  225  			XSCALE1_COUNT1_INT_EN;
43eab87828fee6 Will Deacon       2010-11-13  226  		break;
43eab87828fee6 Will Deacon       2010-11-13  227  	default:
43eab87828fee6 Will Deacon       2010-11-13  228  		WARN_ONCE(1, "invalid counter number (%d)\n", idx);
43eab87828fee6 Will Deacon       2010-11-13  229  		return;
43eab87828fee6 Will Deacon       2010-11-13  230  	}
43eab87828fee6 Will Deacon       2010-11-13  231  
43eab87828fee6 Will Deacon       2010-11-13  232  	val = xscale1pmu_read_pmnc();
43eab87828fee6 Will Deacon       2010-11-13  233  	val &= ~mask;
43eab87828fee6 Will Deacon       2010-11-13  234  	val |= evt;
43eab87828fee6 Will Deacon       2010-11-13  235  	xscale1pmu_write_pmnc(val);
43eab87828fee6 Will Deacon       2010-11-13  236  }
43eab87828fee6 Will Deacon       2010-11-13  237  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
