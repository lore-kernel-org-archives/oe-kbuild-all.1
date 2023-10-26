Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA663C6B2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Oct 2023 23:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EF8BVxoL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698363951; x=1729899951;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bOL7H5P3UtjC1LfhXU4TE0KaKiBtuhCPthxD76w1WpI=;
  b=EF8BVxoLr4ADcHD1HaaV0DoXSoAJeh2GplUmZETel6ehNV0nxEcDZ8Zq
   LloWPgio6z1ORtdvnQXf1bBRNCLOG06nQDpL0SQC2PL21OG/QSuimEeO+
   Z/d6dJxDUqU84G/F6iVDkzV2Wumcs9tqDW9FI8Qlb0Md3MpInBE96xAQH
   fgrPmYBfhIHfKUfzYfunDT4h8orbPxRB+AA4mB3mLDpoPsxij67Wn0KVn
   1wja7xIKcXKWTqT6UVqpjANR0gvQea/gU2lZGscyM1uonNWpRzkfrivN4
   sSqFpTehduzdh/FJV82IhsBJPyp+JeTPcxvEPoOSSSvByJOFs3JbzRaXQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="454140337"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="454140337"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 16:45:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="7471335"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Oct 2023 16:45:39 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwA2t-000AER-2i;
	Thu, 26 Oct 2023 23:45:47 +0000
Date: Fri, 27 Oct 2023 07:45:13 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find_and_clear_tmp1 21/46]
 drivers/perf/apple_m1_cpu_pmu.c:439:23: warning: unused variable 'affinity'
Message-ID: <202310270729.4at10YHl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux find_and_clear_tmp1
head:   62bfd93b1d4bc92cd171973923c45a2b011f1c5c
commit: 74e9e3851dc5da4d94dee7950cf41e1e5f9ea274 [21/46] drivers/perf: optimize m1_pmu_get_event_idx() by using find_bit() API
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231027/202310270729.4at10YHl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231027/202310270729.4at10YHl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310270729.4at10YHl-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                                           ^~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:28:41: warning: initialized field overwritten [-Woverride-init]
      28 | #define ONLY_5_6_7                      (BIT(5) | BIT(6) | BIT(7))
         |                                         ^
   drivers/perf/apple_m1_cpu_pmu.c:125:43: note: in expansion of macro 'ONLY_5_6_7'
     125 |         [M1_PMU_PERFCTR_UNKNOWN_ca]     = ONLY_5_6_7,
         |                                           ^~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:28:41: note: (near initialization for 'm1_pmu_event_affinity[202]')
      28 | #define ONLY_5_6_7                      (BIT(5) | BIT(6) | BIT(7))
         |                                         ^
   drivers/perf/apple_m1_cpu_pmu.c:125:43: note: in expansion of macro 'ONLY_5_6_7'
     125 |         [M1_PMU_PERFCTR_UNKNOWN_ca]     = ONLY_5_6_7,
         |                                           ^~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:28:41: warning: initialized field overwritten [-Woverride-init]
      28 | #define ONLY_5_6_7                      (BIT(5) | BIT(6) | BIT(7))
         |                                         ^
   drivers/perf/apple_m1_cpu_pmu.c:126:43: note: in expansion of macro 'ONLY_5_6_7'
     126 |         [M1_PMU_PERFCTR_UNKNOWN_cb]     = ONLY_5_6_7,
         |                                           ^~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:28:41: note: (near initialization for 'm1_pmu_event_affinity[203]')
      28 | #define ONLY_5_6_7                      (BIT(5) | BIT(6) | BIT(7))
         |                                         ^
   drivers/perf/apple_m1_cpu_pmu.c:126:43: note: in expansion of macro 'ONLY_5_6_7'
     126 |         [M1_PMU_PERFCTR_UNKNOWN_cb]     = ONLY_5_6_7,
         |                                           ^~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:27:41: warning: initialized field overwritten [-Woverride-init]
      27 | #define ONLY_2_4_6                      (BIT(2) | BIT(4) | BIT(6))
         |                                         ^
   drivers/perf/apple_m1_cpu_pmu.c:127:43: note: in expansion of macro 'ONLY_2_4_6'
     127 |         [M1_PMU_PERFCTR_UNKNOWN_f5]     = ONLY_2_4_6,
         |                                           ^~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:27:41: note: (near initialization for 'm1_pmu_event_affinity[245]')
      27 | #define ONLY_2_4_6                      (BIT(2) | BIT(4) | BIT(6))
         |                                         ^
   drivers/perf/apple_m1_cpu_pmu.c:127:43: note: in expansion of macro 'ONLY_2_4_6'
     127 |         [M1_PMU_PERFCTR_UNKNOWN_f5]     = ONLY_2_4_6,
         |                                           ^~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:27:41: warning: initialized field overwritten [-Woverride-init]
      27 | #define ONLY_2_4_6                      (BIT(2) | BIT(4) | BIT(6))
         |                                         ^
   drivers/perf/apple_m1_cpu_pmu.c:128:43: note: in expansion of macro 'ONLY_2_4_6'
     128 |         [M1_PMU_PERFCTR_UNKNOWN_f6]     = ONLY_2_4_6,
         |                                           ^~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:27:41: note: (near initialization for 'm1_pmu_event_affinity[246]')
      27 | #define ONLY_2_4_6                      (BIT(2) | BIT(4) | BIT(6))
         |                                         ^
   drivers/perf/apple_m1_cpu_pmu.c:128:43: note: in expansion of macro 'ONLY_2_4_6'
     128 |         [M1_PMU_PERFCTR_UNKNOWN_f6]     = ONLY_2_4_6,
         |                                           ^~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:27:41: warning: initialized field overwritten [-Woverride-init]
      27 | #define ONLY_2_4_6                      (BIT(2) | BIT(4) | BIT(6))
         |                                         ^
   drivers/perf/apple_m1_cpu_pmu.c:129:43: note: in expansion of macro 'ONLY_2_4_6'
     129 |         [M1_PMU_PERFCTR_UNKNOWN_f7]     = ONLY_2_4_6,
         |                                           ^~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:27:41: note: (near initialization for 'm1_pmu_event_affinity[247]')
      27 | #define ONLY_2_4_6                      (BIT(2) | BIT(4) | BIT(6))
         |                                         ^
   drivers/perf/apple_m1_cpu_pmu.c:129:43: note: in expansion of macro 'ONLY_2_4_6'
     129 |         [M1_PMU_PERFCTR_UNKNOWN_f7]     = ONLY_2_4_6,
         |                                           ^~~~~~~~~~
   include/linux/bits.h:37:9: warning: initialized field overwritten [-Woverride-init]
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |         ^
   drivers/perf/apple_m1_cpu_pmu.c:26:41: note: in expansion of macro 'GENMASK'
      26 | #define ONLY_2_TO_7                     GENMASK(7, 2)
         |                                         ^~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:130:43: note: in expansion of macro 'ONLY_2_TO_7'
     130 |         [M1_PMU_PERFCTR_UNKNOWN_f8]     = ONLY_2_TO_7,
         |                                           ^~~~~~~~~~~
   include/linux/bits.h:37:9: note: (near initialization for 'm1_pmu_event_affinity[248]')
      37 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |         ^
   drivers/perf/apple_m1_cpu_pmu.c:26:41: note: in expansion of macro 'GENMASK'
      26 | #define ONLY_2_TO_7                     GENMASK(7, 2)
         |                                         ^~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:130:43: note: in expansion of macro 'ONLY_2_TO_7'
     130 |         [M1_PMU_PERFCTR_UNKNOWN_f8]     = ONLY_2_TO_7,
         |                                           ^~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:27:41: warning: initialized field overwritten [-Woverride-init]
      27 | #define ONLY_2_4_6                      (BIT(2) | BIT(4) | BIT(6))
         |                                         ^
   drivers/perf/apple_m1_cpu_pmu.c:131:43: note: in expansion of macro 'ONLY_2_4_6'
     131 |         [M1_PMU_PERFCTR_UNKNOWN_fd]     = ONLY_2_4_6,
         |                                           ^~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:27:41: note: (near initialization for 'm1_pmu_event_affinity[253]')
      27 | #define ONLY_2_4_6                      (BIT(2) | BIT(4) | BIT(6))
         |                                         ^
   drivers/perf/apple_m1_cpu_pmu.c:131:43: note: in expansion of macro 'ONLY_2_4_6'
     131 |         [M1_PMU_PERFCTR_UNKNOWN_fd]     = ONLY_2_4_6,
         |                                           ^~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:136:43: warning: initialized field overwritten [-Woverride-init]
     136 |         [PERF_COUNT_HW_CPU_CYCLES]      = M1_PMU_PERFCTR_CPU_CYCLES,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:136:43: note: (near initialization for 'm1_pmu_perf_map[0]')
   drivers/perf/apple_m1_cpu_pmu.c:137:43: warning: initialized field overwritten [-Woverride-init]
     137 |         [PERF_COUNT_HW_INSTRUCTIONS]    = M1_PMU_PERFCTR_INSTRUCTIONS,
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/apple_m1_cpu_pmu.c:137:43: note: (near initialization for 'm1_pmu_perf_map[1]')
   drivers/perf/apple_m1_cpu_pmu.c: In function 'm1_pmu_get_event_idx':
>> drivers/perf/apple_m1_cpu_pmu.c:439:23: warning: unused variable 'affinity' [-Wunused-variable]
     439 |         unsigned long affinity = m1_pmu_event_affinity[evtype];
         |                       ^~~~~~~~


vim +/affinity +439 drivers/perf/apple_m1_cpu_pmu.c

a639027a1be1d6 Marc Zyngier 2022-02-08  434  
a639027a1be1d6 Marc Zyngier 2022-02-08  435  static int m1_pmu_get_event_idx(struct pmu_hw_events *cpuc,
a639027a1be1d6 Marc Zyngier 2022-02-08  436  				struct perf_event *event)
a639027a1be1d6 Marc Zyngier 2022-02-08  437  {
a639027a1be1d6 Marc Zyngier 2022-02-08  438  	unsigned long evtype = event->hw.config_base & M1_PMU_CFG_EVENT;
a639027a1be1d6 Marc Zyngier 2022-02-08 @439  	unsigned long affinity = m1_pmu_event_affinity[evtype];
a639027a1be1d6 Marc Zyngier 2022-02-08  440  	int idx;
a639027a1be1d6 Marc Zyngier 2022-02-08  441  
a639027a1be1d6 Marc Zyngier 2022-02-08  442  	/*
a639027a1be1d6 Marc Zyngier 2022-02-08  443  	 * Place the event on the first free counter that can count
a639027a1be1d6 Marc Zyngier 2022-02-08  444  	 * this event.
a639027a1be1d6 Marc Zyngier 2022-02-08  445  	 *
a639027a1be1d6 Marc Zyngier 2022-02-08  446  	 * We could do a better job if we had a view of all the events
a639027a1be1d6 Marc Zyngier 2022-02-08  447  	 * counting on the PMU at any given time, and by placing the
a639027a1be1d6 Marc Zyngier 2022-02-08  448  	 * most constraining events first.
a639027a1be1d6 Marc Zyngier 2022-02-08  449  	 */
74e9e3851dc5da Yury Norov   2023-10-21  450  	idx = find_and_set_bit(cpuc->used_mask, M1_PMU_NR_COUNTERS);
74e9e3851dc5da Yury Norov   2023-10-21  451  	return idx < M1_PMU_NR_COUNTERS ? idx : -EAGAIN;
a639027a1be1d6 Marc Zyngier 2022-02-08  452  }
a639027a1be1d6 Marc Zyngier 2022-02-08  453  

:::::: The code at line 439 was first introduced by commit
:::::: a639027a1be1d68437e1c2cac6ed16306c84ab3c drivers/perf: Add Apple icestorm/firestorm CPU PMU driver

:::::: TO: Marc Zyngier <maz@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
