Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6981498936
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Oct 2026 19:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790883822; cv=none; b=KuhA+cEDbNjCtVDnc+HopL6FzprIp2cBZqbl/tsOQvXdtMXyaLuso2+655JyR3bY6ArBN4b1IPBz5MM1ZeA3o+oh0WEBAo4r1p7b8e9BS/OZxtQMaMcsSaJzsW27lyXGoGPI6rUSqdg97U/CGUSPM1qL9LSFvDdJc/z3De4rRrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790883822; c=relaxed/simple;
	bh=xYIos1RRY1aPWUd9rSd3cgPDTkjbirDKVjwNRWhwKY0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uWMXpxdNiBjOaAhX0Yh0+u2w45wcSSR39SVdOxxsYnREdWHFKm0cmWh5hTOa+uahh8IEd/1b//W+B6rJazyy8UUS7xtjTIRzeMxYOsBtqG/ABFXaKl7zpzQx3HbLw7g9I8E81Esm+h0/cWc7k0UnEXf5rMecjHWHrqXRHaFixCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MmJPHo7f; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MmJPHo7f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790883820; x=1822419820;
  h=date:from:to:cc:subject:message-id;
  bh=xYIos1RRY1aPWUd9rSd3cgPDTkjbirDKVjwNRWhwKY0=;
  b=MmJPHo7fuF/Tww+UpRaza6fnFT5VWceXsxH5Jl8V+BceSAPoNNNFXInU
   zT4lzJ7AngQG+FJvjzJTUQ5si/KCBWca3WCWxA1ZjQlg2bv9Ef+0OqtX9
   zw1lTPibKmtp/zWvwRu0VKnb3ZKtiG+AcJKGuOGYxSZd9XKa0FZ4k8s1p
   ywG2Kd+NiUGdf15yBrjEr/QUpo9tIr2e3Hp1lZ64VeUCfstSPiesXlcA0
   89qwZEUm8XhjUC6LdGh0O8joFOS3nUakmWrJmzeOoc+6joaNIceryWxi3
   kPj119KZE9M3WGGLeN7EhFhgFw5kG366fuUgm3hxXgSvxWA3rBjGZ5irJ
   w==;
X-CSE-ConnectionGUID: t74Zilt4QJaNyVjDcHksRA==
X-CSE-MsgGUID: y2UcBvSzSTKjlVbC+G8FEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90789117"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="90789117"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 12:43:39 -0700
X-CSE-ConnectionGUID: Q+x/KoPgSNubY6z8bOcnWA==
X-CSE-MsgGUID: YnXVVJOcSB2/zdI2+ugW1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="275277389"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 01 Oct 2026 12:43:38 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCMgq-000000000Bv-03zB;
	Thu, 01 Oct 2026 19:43:36 +0000
Date: Thu, 01 Oct 2026 21:43:32 +0200
From: kernel test robot <lkp@intel.com>
To: Colton Lewis <coltonlewis@google.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/perf/arm_pmuv3.c:907:27: error: call to undeclared
 function 'kvm_pmu_guest_counter_mask'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202610012144.19CAHZhC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Colton-Lewis/arm64-cpufeature-Add-cpucap-for-HPMN0/20260924-172907
head:   bd4ddc4b6b07ef43b3b6bc485285ef5255b458da
commit: adaa4d6a200993f3d0e0946f0fae58d07383aba1 perf: arm_pmuv3: Handle IRQs for Partitioned PMU guest counters
date:   7 days ago
config: arm-randconfig-r2305-20261001 (https://download.01.org/0day-ci/archive/20261001/202610012144.19CAHZhC-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261001/202610012144.19CAHZhC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610012144.19CAHZhC-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:148:2: note: previous initialization is here
     148 |         PERF_CACHE_MAP_ALL_UNSUPPORTED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
      49 |                 [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
         |                                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
      41 | #define CACHE_OP_UNSUPPORTED            0xFFFF
         |                                         ^~~~~~
   drivers/perf/arm_pmuv3.c:155:44: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     155 |         [C(DTLB)][C(OP_READ)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:134:44: note: expanded from macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD'
     134 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD                         0x004E
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:148:2: note: previous initialization is here
     148 |         PERF_CACHE_MAP_ALL_UNSUPPORTED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
      49 |                 [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
         |                                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
      41 | #define CACHE_OP_UNSUPPORTED            0xFFFF
         |                                         ^~~~~~
   drivers/perf/arm_pmuv3.c:156:45: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     156 |         [C(DTLB)][C(OP_WRITE)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR,
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:135:44: note: expanded from macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR'
     135 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR                         0x004F
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:148:2: note: previous initialization is here
     148 |         PERF_CACHE_MAP_ALL_UNSUPPORTED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
      49 |                 [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
         |                                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
      41 | #define CACHE_OP_UNSUPPORTED            0xFFFF
         |                                         ^~~~~~
   drivers/perf/arm_pmuv3.c:157:42: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     157 |         [C(DTLB)][C(OP_READ)][C(RESULT_MISS)]   = ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:132:50: note: expanded from macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD'
     132 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD                  0x004C
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:148:2: note: previous initialization is here
     148 |         PERF_CACHE_MAP_ALL_UNSUPPORTED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
      49 |                 [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
         |                                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
      41 | #define CACHE_OP_UNSUPPORTED            0xFFFF
         |                                         ^~~~~~
   drivers/perf/arm_pmuv3.c:158:43: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     158 |         [C(DTLB)][C(OP_WRITE)][C(RESULT_MISS)]  = ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:133:50: note: expanded from macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR'
     133 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR                  0x004D
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:148:2: note: previous initialization is here
     148 |         PERF_CACHE_MAP_ALL_UNSUPPORTED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
      49 |                 [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
         |                                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
      41 | #define CACHE_OP_UNSUPPORTED            0xFFFF
         |                                         ^~~~~~
   drivers/perf/arm_pmuv3.c:160:44: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     160 |         [C(NODE)][C(OP_READ)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:149:46: note: expanded from macro 'ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD'
     149 | #define ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD                      0x0060
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:148:2: note: previous initialization is here
     148 |         PERF_CACHE_MAP_ALL_UNSUPPORTED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
      49 |                 [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
         |                                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
      41 | #define CACHE_OP_UNSUPPORTED            0xFFFF
         |                                         ^~~~~~
   drivers/perf/arm_pmuv3.c:161:45: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     161 |         [C(NODE)][C(OP_WRITE)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR,
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:150:46: note: expanded from macro 'ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR'
     150 | #define ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR                      0x0061
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:148:2: note: previous initialization is here
     148 |         PERF_CACHE_MAP_ALL_UNSUPPORTED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
      49 |                 [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
         |                                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
      41 | #define CACHE_OP_UNSUPPORTED            0xFFFF
         |                                         ^~~~~~
>> drivers/perf/arm_pmuv3.c:907:27: error: call to undeclared function 'kvm_pmu_guest_counter_mask'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     907 |         write_pmovsclr(pmovsr & ~kvm_pmu_guest_counter_mask());
         |                                  ^
   drivers/perf/arm_pmuv3.c:907:27: note: did you mean 'kvm_pmu_host_counter_mask'?
   arch/arm/include/asm/arm_pmuv3.h:239:19: note: 'kvm_pmu_host_counter_mask' declared here
     239 | static inline u64 kvm_pmu_host_counter_mask(void)
         |                   ^
   55 warnings and 1 error generated.


vim +/kvm_pmu_guest_counter_mask +907 drivers/perf/arm_pmuv3.c

   883	
   884	static irqreturn_t armv8pmu_handle_irq(struct arm_pmu *cpu_pmu)
   885	{
   886		struct perf_sample_data data;
   887		struct pmu_hw_events *cpuc = this_cpu_ptr(cpu_pmu->hw_events);
   888		struct pt_regs *regs;
   889		u64 pmovsr;
   890		int idx;
   891	
   892		/*
   893		 * Get the IRQ flags
   894		 */
   895		pmovsr = armv8pmu_getovf_flags();
   896	
   897		/*
   898		 * Did an overflow occur?
   899		 */
   900		if (!armv8pmu_has_overflowed(pmovsr))
   901			return IRQ_NONE;
   902	
   903		/*
   904		 * Guest flag reset is handled by the kvm hook at the bottom of
   905		 * this function.
   906		 */
 > 907		write_pmovsclr(pmovsr & ~kvm_pmu_guest_counter_mask());
   908	
   909		/*
   910		 * Handle the counter(s) overflow(s)
   911		 */
   912		regs = get_irq_regs();
   913	
   914		/*
   915		 * Stop the PMU while processing the counter overflows
   916		 * to prevent skews in group events.
   917		 */
   918		armv8pmu_stop(cpu_pmu);
   919		for_each_set_bit(idx, cpuc->cntr_mask, ARMPMU_MAX_HWEVENTS) {
   920			struct perf_event *event = cpuc->events[idx];
   921			struct hw_perf_event *hwc;
   922	
   923			/* Ignore if we don't have an event. */
   924			if (!event)
   925				continue;
   926	
   927			/*
   928			 * We have a single interrupt for all counters. Check that
   929			 * each counter has overflowed before we process it.
   930			 */
   931			if (!armv8pmu_counter_has_overflowed(pmovsr, idx))
   932				continue;
   933	
   934			hwc = &event->hw;
   935			armpmu_event_update(event);
   936			perf_sample_data_init(&data, 0, hwc->last_period);
   937			if (!armpmu_event_set_period(event))
   938				continue;
   939	
   940			if (has_branch_stack(event))
   941				read_branch_records(cpuc, event, &data);
   942	
   943			/*
   944			 * Perf event overflow will queue the processing of the event as
   945			 * an irq_work which will be taken care of in the handling of
   946			 * IPI_IRQ_WORK.
   947			 */
   948			perf_event_overflow(event, &data, regs);
   949		}
   950	
   951		kvm_pmu_handle_guest_irq(pmovsr);
   952	
   953		armv8pmu_start(cpu_pmu);
   954	
   955		return IRQ_HANDLED;
   956	}
   957	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
