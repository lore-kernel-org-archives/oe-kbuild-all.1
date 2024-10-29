Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F137464
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 11:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730201821; cv=none; b=aIWv1PA3TM5q0l1mLjslsPaBkNI/8N9z3pGPIc0X+WS3CaB8doML7mUoB3+mwLTqm7JJP49EXVOHFQB+SnouVgQhk9UiXlgnc9DuQA9SK6LRyJtaZ72/FNn1+ov2fciemr/DJKGSoqr8tgYOIHDHfpFDZchjVWDsC7IRYFzhoJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730201821; c=relaxed/simple;
	bh=DRAB8kiuo+Gmu+S2b1QeSADopKODr+1U+LpB4ObGBKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Oou1A0cuNMZb8/IRQteZTe5j4rPjyTFvQaCrCjy/obPBQHwq0Qf0MT3UpGgIIe+KM/DTiaonrkcn0o9gvrGWDcK8wKQcyxF5p+adljvGBjeIwyXCZHU5YERHtl12eH9bhN3qsfav9TvFy/TqYUalgYWGUhGtqMDOb+feQWYzrCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EgCpYPvd; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EgCpYPvd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730201819; x=1761737819;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DRAB8kiuo+Gmu+S2b1QeSADopKODr+1U+LpB4ObGBKQ=;
  b=EgCpYPvd3TcWsgErSUp9KdJTBLh44cfg36Wdk6vsIzgFDPQRqs+TChM+
   ZJfft2HHNDeRP/WwD5xv2KnlX5cc+FS/ttnl1UoR7phTqMPI2StMAry6a
   rtyiAEwZdpUMM9Bvg6AhaPf+r8JeRAnHNHYJZGQaTVg5rU+LXTpLQnY10
   BQZez4tSfizc9vKcEKJwu9OVbfBpqkFwKC7Kyn7y7GLRIktYZJ7mFQr1g
   l5Dchzou8B+CDXUp7GNrhyKpxiL0SxGPSx/2cRJx7uj8qlvKSC0JacE8A
   dVOBaA/9k94OGNon2Tfy0Tzi8vdJ67a/pjNPBZIQz+9/+9+5SMGfKmzfN
   A==;
X-CSE-ConnectionGUID: /lH7IpgdRYiGCN0233wr/g==
X-CSE-MsgGUID: 9o/lyOLbQeugevYJbWikiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="41233642"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="41233642"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 04:36:58 -0700
X-CSE-ConnectionGUID: OqP5Aq86Rtme/UBZxIV5jw==
X-CSE-MsgGUID: a17zW5kwSMeovoYWNL1Tyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="119398978"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Oct 2024 04:36:57 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5kWs-000daz-0m;
	Tue, 29 Oct 2024 11:36:54 +0000
Date: Tue, 29 Oct 2024 19:36:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Will Deacon <will@kernel.org>
Subject: [linux-next:master 7404/7771] drivers/perf/arm_pmuv3.c:779:17:
 error: implicit declaration of function 'write_pmuacr'; did you mean
 'write_pmcr'?
Message-ID: <202410291954.NiHLIwSC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6fb2fa9805c501d9ade047fc511961f3273cdcb5
commit: 0bbff9ed81654d5f06bfca484681756ee407f924 [7404/7771] perf/arm_pmuv3: Add PMUv3.9 per counter EL0 access control
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20241029/202410291954.NiHLIwSC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410291954.NiHLIwSC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410291954.NiHLIwSC-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/perf/arm_pmuv3.c:143:51: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_CACHE_REFILL_RD'
     143 |         [C(L1D)][C(OP_READ)][C(RESULT_MISS)]    = ARMV8_IMPDEF_PERFCTR_L1D_CACHE_REFILL_RD,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:123:65: warning: initialized field overwritten [-Woverride-init]
     123 | #define ARMV8_IMPDEF_PERFCTR_L1D_CACHE_WR                       0x0041
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:144:51: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_CACHE_WR'
     144 |         [C(L1D)][C(OP_WRITE)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_L1D_CACHE_WR,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:123:65: note: (near initialization for 'armv8_vulcan_perf_cache_map[0][1][0]')
     123 | #define ARMV8_IMPDEF_PERFCTR_L1D_CACHE_WR                       0x0041
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:144:51: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_CACHE_WR'
     144 |         [C(L1D)][C(OP_WRITE)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_L1D_CACHE_WR,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:125:65: warning: initialized field overwritten [-Woverride-init]
     125 | #define ARMV8_IMPDEF_PERFCTR_L1D_CACHE_REFILL_WR                0x0043
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:145:51: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_CACHE_REFILL_WR'
     145 |         [C(L1D)][C(OP_WRITE)][C(RESULT_MISS)]   = ARMV8_IMPDEF_PERFCTR_L1D_CACHE_REFILL_WR,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:125:65: note: (near initialization for 'armv8_vulcan_perf_cache_map[0][1][1]')
     125 | #define ARMV8_IMPDEF_PERFCTR_L1D_CACHE_REFILL_WR                0x0043
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:145:51: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_CACHE_REFILL_WR'
     145 |         [C(L1D)][C(OP_WRITE)][C(RESULT_MISS)]   = ARMV8_IMPDEF_PERFCTR_L1D_CACHE_REFILL_WR,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:134:65: warning: initialized field overwritten [-Woverride-init]
     134 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD                         0x004E
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:147:51: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD'
     147 |         [C(DTLB)][C(OP_READ)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:134:65: note: (near initialization for 'armv8_vulcan_perf_cache_map[3][0][0]')
     134 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD                         0x004E
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:147:51: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD'
     147 |         [C(DTLB)][C(OP_READ)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_L1D_TLB_RD,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:135:65: warning: initialized field overwritten [-Woverride-init]
     135 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR                         0x004F
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:148:52: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR'
     148 |         [C(DTLB)][C(OP_WRITE)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR,
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:135:65: note: (near initialization for 'armv8_vulcan_perf_cache_map[3][1][0]')
     135 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR                         0x004F
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:148:52: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR'
     148 |         [C(DTLB)][C(OP_WRITE)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_L1D_TLB_WR,
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:132:65: warning: initialized field overwritten [-Woverride-init]
     132 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD                  0x004C
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:149:51: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD'
     149 |         [C(DTLB)][C(OP_READ)][C(RESULT_MISS)]   = ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:132:65: note: (near initialization for 'armv8_vulcan_perf_cache_map[3][0][1]')
     132 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD                  0x004C
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:149:51: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD'
     149 |         [C(DTLB)][C(OP_READ)][C(RESULT_MISS)]   = ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_RD,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:133:65: warning: initialized field overwritten [-Woverride-init]
     133 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR                  0x004D
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:150:51: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR'
     150 |         [C(DTLB)][C(OP_WRITE)][C(RESULT_MISS)]  = ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:133:65: note: (near initialization for 'armv8_vulcan_perf_cache_map[3][1][1]')
     133 | #define ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR                  0x004D
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:150:51: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR'
     150 |         [C(DTLB)][C(OP_WRITE)][C(RESULT_MISS)]  = ARMV8_IMPDEF_PERFCTR_L1D_TLB_REFILL_WR,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:149:65: warning: initialized field overwritten [-Woverride-init]
     149 | #define ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD                      0x0060
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:152:51: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD'
     152 |         [C(NODE)][C(OP_READ)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:149:65: note: (near initialization for 'armv8_vulcan_perf_cache_map[6][0][0]')
     149 | #define ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD                      0x0060
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:152:51: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD'
     152 |         [C(NODE)][C(OP_READ)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_RD,
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:150:65: warning: initialized field overwritten [-Woverride-init]
     150 | #define ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR                      0x0061
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:153:52: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR'
     153 |         [C(NODE)][C(OP_WRITE)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR,
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/arm_pmuv3.h:150:65: note: (near initialization for 'armv8_vulcan_perf_cache_map[6][1][0]')
     150 | #define ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR                      0x0061
         |                                                                 ^~~~~~
   drivers/perf/arm_pmuv3.c:153:52: note: in expansion of macro 'ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR'
     153 |         [C(NODE)][C(OP_WRITE)][C(RESULT_ACCESS)] = ARMV8_IMPDEF_PERFCTR_BUS_ACCESS_WR,
         |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/arm_pmuv3.c: In function 'armv8pmu_enable_user_access':
>> drivers/perf/arm_pmuv3.c:779:17: error: implicit declaration of function 'write_pmuacr'; did you mean 'write_pmcr'? [-Wimplicit-function-declaration]
     779 |                 write_pmuacr(mask);
         |                 ^~~~~~~~~~~~
         |                 write_pmcr

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +779 drivers/perf/arm_pmuv3.c

   767	
   768	static void armv8pmu_enable_user_access(struct arm_pmu *cpu_pmu)
   769	{
   770		int i;
   771		struct pmu_hw_events *cpuc = this_cpu_ptr(cpu_pmu->hw_events);
   772	
   773		if (is_pmuv3p9(cpu_pmu->pmuver)) {
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
