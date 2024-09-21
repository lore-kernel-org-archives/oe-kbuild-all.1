Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C1E250EC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Sep 2024 10:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726913867; cv=none; b=JZAlMJpp7aYmoUbl7YETXEoeeWU9fyQbVsqlZeO/OeBiTFj84VmybLDGzWuH/zBX+uprbwbW6vcQWM8lLtOP8K2acfiQK55rx0sz+pbOl9BT7HztziOQ5uzSHAZ5Sv4TL538+whHic6ctLuKpL/58pZGVYF6odLsKPwTReUzJV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726913867; c=relaxed/simple;
	bh=r2uCRBDJ/gFf6nENPjkB0SxD/KxHqtgcMSxKqYvu1q4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aCCRgItYnLypqxdsZhdgwum4WuwkVrzc4VE3OqG7JvkBUnDz5H6lngIHXmDQdOZznGMvQkpyVkijakZU9EgM/k/f8bmd/lqdVJafC+JhOaHK8mNMIxcn7DpSuevvpBHhdUKCzaEKXhj/RX/pmlsVxr+hcbkkYgD1yw8sK+W9uI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jx+lQGIx; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jx+lQGIx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726913866; x=1758449866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r2uCRBDJ/gFf6nENPjkB0SxD/KxHqtgcMSxKqYvu1q4=;
  b=Jx+lQGIxeBlQOdKxIDBUqgQc4+sRrnPGPOIxYevwa6PxhsdfvLsQhZr7
   9ZuKxe1yXLJ43Bs6F7QsHmy4tZhJzeBx/W/het4CDcEFScS7XOnl8O0aL
   P4hfcpoLX/qONm428ueLX1BEwVGptSy/PTMscvxJeeCEA3aP7qwFxKSCZ
   jWC4ar5v4ooP6UXHZydoZ4t9I1BlpMLJC2VX59f0JWstAljU98nhnpVBV
   05cR1RKysDXzjCqhWfhidbxNdH2vwmcffsYJrTqKcmZ3FIYbWHSmTUICX
   ah8QjUUcWlsKmqgp8lpbRGz8hVlxl23AtzWjGxyW7v8Bq3B/KE5+bCCgA
   A==;
X-CSE-ConnectionGUID: ID/l6QwYR9mOiEAHkYJKjg==
X-CSE-MsgGUID: 1ac0LP70SveSmNBfNlCwXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="26069171"
X-IronPort-AV: E=Sophos;i="6.10,246,1719903600"; 
   d="scan'208";a="26069171"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 03:17:45 -0700
X-CSE-ConnectionGUID: tXVrFNQLQAKCLQXCIiq1/Q==
X-CSE-MsgGUID: 5orsi0lmT3utL8shjAJI9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,246,1719903600"; 
   d="scan'208";a="75337264"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Sep 2024 03:17:43 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srxBN-000FLX-0Z;
	Sat, 21 Sep 2024 10:17:41 +0000
Date: Sat, 21 Sep 2024 18:16:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:for-arm-ci 1/1] drivers/perf/arm_pmuv3.c:773:13: error:
 implicit declaration of function 'is_pmuv3p9'; did you mean 'is_pmuv3p5'?
Message-ID: <202409211847.iBFe1sOE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-arm-ci
head:   2883d236eb899eb2465cebf0c9f8cddc0978dba3
commit: 2883d236eb899eb2465cebf0c9f8cddc0978dba3 [1/1] perf/arm_pmuv3: Add support for PMUv3.9 per counter EL0 access control
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240921/202409211847.iBFe1sOE-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240921/202409211847.iBFe1sOE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409211847.iBFe1sOE-lkp@intel.com/

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
>> drivers/perf/arm_pmuv3.c:773:13: error: implicit declaration of function 'is_pmuv3p9'; did you mean 'is_pmuv3p5'? [-Wimplicit-function-declaration]
     773 |         if (is_pmuv3p9(cpu_pmu->pmuver)) {
         |             ^~~~~~~~~~
         |             is_pmuv3p5
>> drivers/perf/arm_pmuv3.c:779:17: error: implicit declaration of function 'write_pmuacr'; did you mean 'write_pmcr'? [-Wimplicit-function-declaration]
     779 |                 write_pmuacr(mask);
         |                 ^~~~~~~~~~~~
         |                 write_pmcr


vim +773 drivers/perf/arm_pmuv3.c

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
   793		update_pmuserenr(ARMV8_PMU_USERENR_ER | ARMV8_PMU_USERENR_CR);
   794	}
   795	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
