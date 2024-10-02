Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AEC1D0F73
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 17:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727890110; cv=none; b=gxgyFAyUBj6et3wHVzDkr/e5h4ONSJpF192VgwvGNifncDXG8vU8fpikwhCKuIqwcTCJa5AKHHDLImPzrSYTyXOeYVERtlRSjAuhIA+fzgyEgyLO2/7vprJuHe1K/KYiOxhhaB0HwuMcvwhHnG/sW+9n4HWmclhuVkohQgn1JAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727890110; c=relaxed/simple;
	bh=bSN8NBpMT/aY1bfs97SFj1LIDZc7MaFxFy9J/IC4Xuk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sr0DsxAtLpmg7mv2kJC7t8LLeUdhwoOKXycJBPCe2chIJiG8VLhuYAUfzARRF0FEwYUom6zYr3GEaLDqxv+3O2GprrGzUUi6rIL3I5osFiocZecXrCQmG/TzHyqtrmHHKSxcJI6l794Y5Pc1q6UjI03pZ4FJQehEM9rjtenVEHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AmUJk/cA; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AmUJk/cA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727890108; x=1759426108;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bSN8NBpMT/aY1bfs97SFj1LIDZc7MaFxFy9J/IC4Xuk=;
  b=AmUJk/cAF8Kj2lhMcJRDPwt7LsHKpYN2TdZmyqbJnD1RuuPSkB/C8iU2
   Y2+EDw28HYG97LJDlz0dafFaD2EARjQ4fo4X/y3/2KyiaFqfP8N6zEw14
   nRzM4WOKpD9q8KFAAYYEY8AybDa3w18FW0qfW498lTQwu0Kgd68vNGETa
   pOvMjzJF50h0IhRwYQMlSYsI8z3D241hUxIY62YWFROiZcntwoT+s4Ayh
   KgeBcIb22mZerRINRIeM9oZ+iQzaPo9DaiTyHpnO7waJCVa6NzKz9GmMJ
   QMIas9yRhkpo3JXlgPr+9TC73duVh4M4uqkUv+UYBVipPWaOwxqeqqUFQ
   Q==;
X-CSE-ConnectionGUID: MHgYgL/hSFahCr9fR7MsSw==
X-CSE-MsgGUID: 8fIbx4HRQpm8Y9pG0BMimg==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27194105"
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; 
   d="scan'208";a="27194105"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 10:28:27 -0700
X-CSE-ConnectionGUID: grp/nReITI+4MCV71UqEqw==
X-CSE-MsgGUID: LWd8oa6yRvixwk5VkMKlbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; 
   d="scan'208";a="73741923"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 02 Oct 2024 10:28:26 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sw39E-000UJY-0C;
	Wed, 02 Oct 2024 17:28:24 +0000
Date: Thu, 3 Oct 2024 01:28:14 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:for-arm-ci 1/1] drivers/perf/arm_pmuv3.c:773:6: error: call to
 undeclared function 'is_pmuv3p9'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202410030122.iOY1pVuk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-arm-ci
head:   55ba96936d039e7d6fb525e96b4f2780fe60e71a
commit: 55ba96936d039e7d6fb525e96b4f2780fe60e71a [1/1] perf/arm_pmuv3: Add support for PMUv3.9 per counter EL0 access control
config: arm-randconfig-r051-20241002 (https://download.01.org/0day-ci/archive/20241003/202410030122.iOY1pVuk-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project fef3566a25ff0e34fb87339ba5e13eca17cec00f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241003/202410030122.iOY1pVuk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410030122.iOY1pVuk-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:140:2: note: previous initialization is here
     140 |         PERF_CACHE_MAP_ALL_UNSUPPORTED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
      49 |                 [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
         |                                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
      41 | #define CACHE_OP_UNSUPPORTED            0xFFFF
         |                                         ^~~~~~
   drivers/perf/arm_pmuv3.c:147:44: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     147 |         [C(DTLB)][C(OP_READ)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:134:44: note: expanded from macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD'
     134 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD                         0x004E
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:140:2: note: previous initialization is here
     140 |         PERF_CACHE_MAP_ALL_UNSUPPORTED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
      49 |                 [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
         |                                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
      41 | #define CACHE_OP_UNSUPPORTED            0xFFFF
         |                                         ^~~~~~
   drivers/perf/arm_pmuv3.c:148:45: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     148 |         [C(DTLB)][C(OP_WRITE)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR,
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:135:44: note: expanded from macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR'
     135 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR                         0x004F
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:140:2: note: previous initialization is here
     140 |         PERF_CACHE_MAP_ALL_UNSUPPORTED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
      49 |                 [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
         |                                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
      41 | #define CACHE_OP_UNSUPPORTED            0xFFFF
         |                                         ^~~~~~
   drivers/perf/arm_pmuv3.c:149:42: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     149 |         [C(DTLB)][C(OP_READ)][C(RESULT_MISS)]   = ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:132:50: note: expanded from macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD'
     132 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD                  0x004C
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:140:2: note: previous initialization is here
     140 |         PERF_CACHE_MAP_ALL_UNSUPPORTED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
      49 |                 [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
         |                                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
      41 | #define CACHE_OP_UNSUPPORTED            0xFFFF
         |                                         ^~~~~~
   drivers/perf/arm_pmuv3.c:150:43: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     150 |         [C(DTLB)][C(OP_WRITE)][C(RESULT_MISS)]  = ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:133:50: note: expanded from macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR'
     133 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR                  0x004D
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:140:2: note: previous initialization is here
     140 |         PERF_CACHE_MAP_ALL_UNSUPPORTED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
      49 |                 [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
         |                                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
      41 | #define CACHE_OP_UNSUPPORTED            0xFFFF
         |                                         ^~~~~~
   drivers/perf/arm_pmuv3.c:152:44: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     152 |         [C(NODE)][C(OP_READ)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:149:46: note: expanded from macro 'ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD'
     149 | #define ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD                      0x0060
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:140:2: note: previous initialization is here
     140 |         PERF_CACHE_MAP_ALL_UNSUPPORTED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
      49 |                 [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
         |                                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
      41 | #define CACHE_OP_UNSUPPORTED            0xFFFF
         |                                         ^~~~~~
   drivers/perf/arm_pmuv3.c:153:45: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
     153 |         [C(NODE)][C(OP_WRITE)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR,
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:150:46: note: expanded from macro 'ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR'
     150 | #define ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR                      0x0061
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:140:2: note: previous initialization is here
     140 |         PERF_CACHE_MAP_ALL_UNSUPPORTED,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:49:31: note: expanded from macro 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
      49 |                 [0 ... C(RESULT_MAX) - 1] = CACHE_OP_UNSUPPORTED,       \
         |                                             ^~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmu.h:41:31: note: expanded from macro 'CACHE_OP_UNSUPPORTED'
      41 | #define CACHE_OP_UNSUPPORTED            0xFFFF
         |                                         ^~~~~~
>> drivers/perf/arm_pmuv3.c:773:6: error: call to undeclared function 'is_pmuv3p9'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     773 |         if (is_pmuv3p9(cpu_pmu->pmuver)) {
         |             ^
>> drivers/perf/arm_pmuv3.c:779:3: error: call to undeclared function 'write_pmuacr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     779 |                 write_pmuacr(mask);
         |                 ^
   drivers/perf/arm_pmuv3.c:779:3: note: did you mean 'write_pmcr'?
   arch/arm/include/asm/arm_pmuv3.h:136:20: note: 'write_pmcr' declared here
     136 | static inline void write_pmcr(u32 val)
         |                    ^
   56 warnings and 2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +/is_pmuv3p9 +773 drivers/perf/arm_pmuv3.c

   767	
   768	static void armv8pmu_enable_user_access(struct arm_pmu *cpu_pmu)
   769	{
   770		int i;
   771		struct pmu_hw_events *cpuc = this_cpu_ptr(cpu_pmu->hw_events);
   772	
 > 773		if (is_pmuv3p9(cpu_pmu->pmuver)) {
   774			u64 mask = 0;
   775			for_each_set_bit(i, cpuc->used_mask, ARMPMU_MAX_HWEVENTS) {
   776				if (armv8pmu_event_has_user_read(cpuc->events[i]))
   777					mask |= BIT(i);
   778			}
 > 779			write_pmuacr(mask);
   780		} else {
   781			/* Clear any unused counters to avoid leaking their contents */
   782			for_each_andnot_bit(i, cpu_pmu->cntr_mask, cpuc->used_mask,
   783					    ARMPMU_MAX_HWEVENTS) {
   784				if (i == ARMV8_PMU_CYCLE_IDX)
   785					write_pmccntr(0);
   786				else if (i == ARMV8_PMU_INSTR_IDX)
   787					write_pmicntr(0);
   788				else
   789					armv8pmu_write_evcntr(i, 0);
   790			}
   791		}
   792	
   793		update_pmuserenr(ARMV8_PMU_USERENR_ER | ARMV8_PMU_USERENR_CR | ARMV8_PMU_USERENR_UEN);
   794	}
   795	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
